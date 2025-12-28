SCREENSHOT_DIRECTORY="$XDG_PICTURES_DIR/Screenshots"
FILE_NAME="$(date +%F-%H:%M:%S).png"

mkdir -p "$SCREENSHOT_DIRECTORY"

hyprpicker -r -z & HYPRPICKER_PID="$!"
sleep 0.1

AREA="$(slurp || true)"

if [[ -z "$AREA" ]]; then
    kill "$HYPRPICKER_PID"
    exit 1
fi

grim -g "$AREA" "$SCREENSHOT_DIRECTORY/$FILE_NAME"
wl-copy --type image/png < "$SCREENSHOT_DIRECTORY/$FILE_NAME"

kill "$HYPRPICKER_PID"
exit 0