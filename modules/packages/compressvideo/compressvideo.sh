#!/bin/bash
fIn="$1"
if [[ ! -f "$fIn" ]]; then echo file does not exist; exit 1; fi
ext="${fIn##*.}"
fOut="${fIn}.shrunk.${ext}"
durationSeconds="$(ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "$fIn" || exit 1)"
mul="$(($2))"
[[ "$mul" == "0" ]] && mul=20
mul="${mul:-1}"
echo "Target size: ${mul}MB."
echo "duration: $durationSeconds"
bitrate="$(bc -l <<< "scale = 5; ($mul / $durationSeconds * 8192) - (($durationSeconds / 10.0))")"
beforeSize="$(stat --printf="%s" "$fIn")"
echo "Shrinking ${fIn} to ${mul}MB. Bitrate: ${bitrate}k"
ffmpeg \
    -y \
    -hwaccel auto \
    -i "$fIn" \
    -b:v "$bitrate"k \
    "$fOut" \
    || exit 1
afterSize="$(stat --printf="%s" "$fOut")"
shrinkPercentage="$(bc -l <<< "scale=4; ($afterSize / $beforeSize) * 100")"
echo "Rebuilt file as ${fOut}, shrank from $beforeSize to $afterSize (${shrinkPercentage}% of originalsize)"