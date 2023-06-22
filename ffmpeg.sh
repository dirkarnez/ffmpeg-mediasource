export PATH="/mingw64/bin:/usr/local/bin:/usr/bin:/bin:/P/Downloads/ffmpeg-2021-10-28-git-e84c83ef98-full_build/bin" &&

ffmpeg -i input.mp4 -map 0 -c copy -f segment -segment_time 1800 -reset_timestamps 1 output_%03d.mp4

read -p "Press to exit"

