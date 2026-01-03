import Quickshell.Io
import QtQuick
import qs.components

BigSlider {
    id: root

    width: parent.width

    Process {
        id: applyProc
    }

    Process {
        id: readProc
        command: ["sh", "-c", "brightnessctl get && brightnessctl max"]

        running: true

        stdout: StdioCollector {
            onStreamFinished: {
                const lines = text.trim().split('\n');

                if (lines.length != 2)
                    return;

                const brightness = lines[0];
                const max = lines[1];

                root.value = brightness / max;
            }
        }
    }

    icon: value < 0.25 ? "brightness_5" : (value > 0.75 ? "brightness_7" : "brightness_6")

    onMoved: () => {
        Qt.callLater(() => {
            // stops you from setting your brightness to zero and making everything invisible
            if (value < 0.025)
                value = 0.025;

            applyProc.command = ["sh", "-c", `brightnessctl set ${value * 100}%`];
            applyProc.running = true;
        });
    }
}
