import Quickshell
import Quickshell.Widgets
import Quickshell.Services.SystemTray
import QtQuick
import QtQuick.Layouts

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

                QsMenuAnchor {
                    id: anchor
                    anchor.item: trayItem
                    menu: trayItem.modelData.menu
                }

                MouseArea {
                    anchors.fill: parent
                    acceptedButtons: Qt.RightButton
                    onClicked: {
                        if (trayItem.modelData.hasMenu)
                            anchor.open();
                    }
                }
            }
        }
    }
}
