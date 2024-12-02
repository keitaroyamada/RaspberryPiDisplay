#!/bin/bash
sleep 30
while [ -z "$DISPLAY" ]; do
    echo "Waiting for X server to start..."
    export DISPLAY=:0
    sleep 1
done
echo "done"
#---------------------------------------------------------------------
#export XDG_RUNTIME_DIR="/run/user/$(id -u)"
#export DISPLAY=:0
USB_PATH=$(ls /media/vm/ | head -n 1)

readarray -d '' mp4_files < <(find /media/vm -type f -name "*.mp4" -print0)

echo "--------------------------------------"
echo "Detected mp4 files"
isMp4Exist=false

for file in "${mp4_files[@]}"; do
    echo "$file"
    isMp4Exist=true
done
echo "--------------------------------------"

#---------------------------------------------------------------------
if $isMp4Exist; then
    #get mp4 list
    playlist="/home/vm/playlist.m3u"
    > "$playlist"

    #set play list
    for file in "${mp4_files[@]}"; do
        echo "$file" >> "$playlist"
    done

    /usr/bin/vlc --fullscreen --no-audio --loop --no-video-title-show "$playlist"
else
    echo "There is no mp4 file."
fi
