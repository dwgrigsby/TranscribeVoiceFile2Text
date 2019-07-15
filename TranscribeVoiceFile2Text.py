import os
import speech_recognition as sr
from tqdm import tqdm
from multiprocessing.dummy import Pool
pool = Pool(8) # Number of concurrent threads

# api-key.json is the silent-matter-nnn-nnnn.json file downloaded from google cloud IAM
with open("api-key.json") as f:
    GOOGLE_CLOUD_SPEECH_CREDENTIALS = f.read()

validFileExtensions = [".flac", ".wav"]

r = sr.Recognizer()
files = sorted(os.listdir('parts/'))

#addresses bug when file type in dir is not format we want aka .DS_Store on mac os
for filename in files:
    filename2Check, file_extension2Check = os.path.splitext(filename)
    if file_extension2Check in validFileExtensions:
        #Do nothing, this file is to be kept
        continue
    else:
        files.remove(filename)
        continue
        
#address issue for the Need of a check for count of files left is greater than 0
if len(files) > 0:

    def transcribe(data):
        idx, file = data
        name = "parts/" + file
        print(name + " started")
        # Load audio file
        with sr.AudioFile(name) as source:
            audio = r.record(source)
        # Transcribe audio file

        try:
            text = r.recognize_google_cloud(audio, credentials_json=GOOGLE_CLOUD_SPEECH_CREDENTIALS)
        except:
            #Suspect UnknownValueError from _init__.py line 937
            text = "No text found and transcribed in audio : "+file
        finally:
            print(name + " done")
        return {
            "idx": idx,
            "text": text
        }

    all_text = pool.map(transcribe, enumerate(files))
    pool.close()
    pool.join()

    transcript = ""
    for t in sorted(all_text, key=lambda x: x['idx']):
        total_seconds = t['idx'] * 59
        # Cool shortcut from:
        # https://stackoverflow.com/questions/775049/python-time-seconds-to-hms
        # to get hours, minutes and seconds
        m, s = divmod(total_seconds, 60)
        h, m = divmod(m, 60)

        # Format time as h:m:s - 59 seconds of text
        transcript = transcript + "{:0>2d}:{:0>2d}:{:0>2d} {}\n".format(h, m, s, t['text'])

    print(transcript)

    with open("transcript.txt", "w") as f:
        f.write(transcript)

else:
    print("No sound files to process")

