pragma Singleton

import Quickshell
import QtQuick

Singleton {
    id: root

    SystemClock {
        id: clock
        precision: SystemClock.Minutes
    }

    readonly property string time: {
        Qt.formatTime(clock.date, "hh:mm AP")
    }
}