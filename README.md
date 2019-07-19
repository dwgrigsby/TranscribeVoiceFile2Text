# TranscribeVoiceFile2Text
<img src="https://blog.grigsbyconsultingllc.com/wp-content/uploads/GCLLC-Button-130x130.gif" height="130" align="right">

# Transcribe Voice File to Text

[**Happy Path Use Case**](#happy-path-use-case)&ensp;|&ensp;[**Gratitude & Credit**](#gratitude-and-credit)&ensp;|&ensp;[**v1.00**](https://github.com/dwgrigsby/TranscribeVoiceFile2Text/releases)

![Screen shot of Terminal post bash script completion](https://blog.grigsbyconsultingllc.com/wp-content/uploads/gif-Flow-smaller.gif)

# Vision
End goal is to have a solution that works as follows on MacOS, iOS, Windows, Android, Chromium, Linux and using the respective Speech to Text | Transcribe and Storage APIs via Google Cloud, Amazon AWS, Microsoft Azure respectively.

# Happy Path Use Case
#### Working: at present Release v1.00  https://blog.grigsbyconsultingllc.com/increase-your-active-listening-results-via-automated-transcribed-voice-memos-to-text-as-notes-via-speech-to-text/

Via Siri or manually open up the voice memo app on Mac or iPhone and take a voice memo then save the voice memo with a descriptive name if desired and share to your Google Drive. Via terminal run Bash Shell TranscribeVoiceMemo2Text.sh  to transcribe the voice memo file on Google Drive showing in finder via Google Drive sync or stream and when it's complete it would move the voice memo to a processed folder with the transcript.txt copied there as well with the same name as the voice memo.

#### Goal:
Via Siri/Dictation/VPA or manually open up the voice memo app and take a voice memo then save the voice memo with a descriptive name if desired in Google Drive and then tell Siri/Dictation/VPA to transcribe the voice memo file on Google Drive and when it's complete it would move the voice memo to processed folder and when you looked in OneNote a page would be created with the voice memo linked to Google Drive in the processed folder as well as the transcribed text would be there.

#### Requirements
1. Mac [Book Pro] and Mac OS > 10.10
2. iPhone > 5(recommended for taking Voice Memo's)
3. Google Cloud Account (at present 07/2019 offering free trial credits)
4. FFMPEG (4.1)
5. BASH (5x for debugging with VSCode)
6. Python > 2.7 (3.7 for debugging with VSCode)
7. VSCode for editing and debugging
8. Install items in requirements.txt via pip3
Review wiki for Blog articles and videos as you may have to update xcode, brew and remove and reinstall python to v3 before you can complete this step. 

#### Installation
1. Clone or fork Project from this github project
2. Create two folders below project folder:
    converted
    parts
3. Install requirements in the above section
4. Change the Paths in the Bash Shell File and the Python file to reflect any local 
5. Save Google Cloud private api key (silent*) as api-key.json in the Project folder.
6. Try it out! and then use VSCode to debug and step through the BASH file and the Python File to learn how it works and enjoy the benefits of generating high quality text via voice from meetings, lectures or personal voice memos for notes and content.

# Gratitude and Credit
Gratitude, Credit and tip of hat to Alex Kras for GitHub Project https://github.com/akras14/speech-to-text which was the beginning point for this project along with an excellent blog article overview.




