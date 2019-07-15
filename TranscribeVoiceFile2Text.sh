#!/bin/bash
#Transcribe voice to text via Google Speech to text API via Google Cloud
shopt -s nullglob

export SOURCE_HOME="$HOME"
export SOURCE_PATH_OF_VOICE_MEMO="$HOME/GStorage/GCLLC_STORAGE/Documents/Voice_Recordings"
export SOURCE_PATH_TO_PARTS_FROM_HOME="$HOME/Audio/parts"
export SOURCE_PROJECT_LOCATION="/Projects/forked/speech-to-text"
export SOURCEFFMPEG="/usr/local/bin/ffmpeg"
export SOURCEPYTHON="/usr/local/bin/python3"

cd $SOURCE_PATH_OF_VOICE_MEMO

for name in *.m4a; do

	cd "$SOURCE_HOME"
	echo "$name"
  rm -fv $SOURCE_PATH_TO_PARTS_FROM_HOME/*.m4a

  export SOURCEVMNAME="$SOURCE_PATH_OF_VOICE_MEMO/$name"
  export SOURCEVMNAMEOUT="$SOURCE_PATH_TO_PARTS_FROM_HOME/out%09d.m4a"

	$SOURCEFFMPEG -nostdin -i "$SOURCEVMNAME" -f segment -segment_time 59 -c copy "$SOURCEVMNAMEOUT" 
	
	cd $SOURCE_PATH_TO_PARTS_FROM_HOME
	echo $PWD
	echo "converting m4a to flac"

	for partname in *.m4a; do 
		echo $partname
		export basefilename="${partname%.[^.]*}"
		echo $basefilename
    export partnameflacdest="$SOURCE_PROJECT_LOCATION/parts/$basefilename.flac"

		$SOURCEFFMPEG -nostdin -i "$partname"  -c:a flac "$partnameflacdest"
  done

    #break
    cd $SOURCE_PROJECT_LOCATION
    
    $SOURCEPYTHON TranscribeVoiceFile2Text.py
    
    basefilenamevm="${name%.[^.]*}"
    export txt=".txt"
    export basefilenamevmtxt="$basefilenamevm$txt"
    mkdir "./converted/$basefilenamevm"
    cp ./transcript.txt "./converted/$basefilenamevm"
    cp ./parts/* "./converted/$basefilenamevm" 
    rm -fv ./parts/*.flac
    rm -fv $SOURCE_PATH_TO_PARTS_FROM_HOME/*.m4a

    cp ./transcript.txt "$SOURCE_PATH_OF_VOICE_MEMO/transcribed/$basefilenamevmtxt"

    rm ./transcript.txt
    mv "$SOURCE_PATH_OF_VOICE_MEMO/$name" "$SOURCE_PATH_OF_VOICE_MEMO/transcribed/$name"
    
    #break
done 

cd "$SOURCE_HOME"