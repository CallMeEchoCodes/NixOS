import Quickshell
import Quickshell.Wayland
import QtQuick
import QtQuick.Layouts
import qs.components

Scope {
    id: root

    Variants {
        model: Quickshell.screens

        PanelWindow {
            id: window

            required property var modelData
            screen: modelData

            WlrLayershell.layer: WlrLayer.Top
            color: "transparent"

            anchors {
                top: true
                left: true
                bottom: true
            }

            margins {
                right: 20 - 20 // - 20 for hyprland gaps
                left: 20
                top: 20
                bottom: 20
            }

            implicitWidth: 40

            ColumnLayout {
                anchors.fill: parent

                Item {
                    Layout.alignment: Qt.AlignCenter

                    implicitHeight: parent.height / 3

                    Stats {
                        anchors.top: parent.top
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                }

                Item {
                    Layout.alignment: Qt.AlignCenter
                    implicitHeight: parent.height / 3

                    Workspaces {
                        screen: window.screen
                        anchors.centerIn: parent
                    }
                }

                Item {
                    Layout.alignment: Qt.AlignCenter
                    implicitHeight: parent.height / 3

                    Tray {
                        anchors.bottomMargin: 12
                        anchors.bottom: parent.bottom
                        anchors.horizontalCenter: parent.horizontalCenter

                        window: window
                    }
                }
            }
        }
    }
}
