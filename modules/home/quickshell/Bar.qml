import Quickshell
import Quickshell.Io
import QtQuick

import qs.data

Scope {
    id: root

    Variants {
        model: Quickshell.screens

        PanelWindow {
            property var modelData
            screen: modelData

            anchors {
                top: true
                
                left: true
                bottom: true
            }

            implicitWidth: 40
            color: "transparent"

            Text {
                id: clock
                font.pointSize: 13

                text: DateTime.time
            }
        }
    }
}