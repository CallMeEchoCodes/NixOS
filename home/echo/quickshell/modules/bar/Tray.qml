import Quickshell
import Quickshell.Widgets
import Quickshell.Services.SystemTray
import QtQuick
import QtQuick.Controls

import qs
import qs.components

Rectangle {
    id: root

    required property PanelWindow window

    implicitWidth: tray.width + 15
    implicitHeight: tray.height + 15

    color: Colors.mantle
    radius: 180

    Column {
        id: tray
        anchors.centerIn: parent

        spacing: 10

        Repeater {
            model: SystemTray.items

            delegate: Item {
                id: trayItem

                required property SystemTrayItem modelData

                width: 20
                height: 20

                IconImage {
                    anchors.fill: parent
                    source: trayItem.modelData.icon
                    asynchronous: true
                }

                property bool hovered: false

                QsMenuAnchor {
                    id: anchor
                    anchor.item: trayItem
                    menu: trayItem.modelData.menu
                }

                ToolTip.delay: 1000
                ToolTip.text: trayItem.modelData.tooltipTitle
                ToolTip.visible: hovered

                MouseArea {
                    anchors.fill: parent
                    acceptedButtons: Qt.LeftButton | Qt.RightButton | Qt.MiddleButton

                    onClicked: mouse => {
                        if (mouse.button == Qt.LeftButton) {
                            trayItem.modelData.activate();
                        } else if (mouse.button == Qt.RightButton) {
                            anchor.open();
                        } else if (mouse.button == Qt.MiddleButton) {
                            trayItem.modelData.secondaryActivate();
                        }
                    }
                }
            }
        }
    }
}
