import QtQuick
import QtQuick.Effects
import QtQuick.Layouts

import Quickshell
import Quickshell.Wayland
import Quickshell.Services.Notifications

import qs
import qs.services
import qs.components

LazyLoader {
    // active: NotificationReceiver.trackedNotifications.values.length > 0
    active: true
    PanelWindow {
        id: window
        screen: Quickshell.screens[2]
        WlrLayershell.layer: WlrLayer.Top

        color: "transparent"
        exclusiveZone: 0 // This is an overlay, dont exclude anything

        implicitWidth: notifications.implicitWidth
        implicitHeight: notifications.implicitHeight

        anchors {
            top: true
            right: true
        }

        Column {
            id: notifications
            spacing: 10

            Repeater {
                model: NotificationReceiver.notifications

                delegate: Item {
                    id: item
                    required property Notification modelData

                    implicitWidth: Math.max(0, content.implicitHeight)
                    implicitHeight: Math.max(100 + 10, content.implicitHeight)

                    RectangularShadow {
                        anchors.fill: bg
                        radius: bg.radius

                        blur: 20
                        spread: 3

                        color: "#33000000"
                    }

                    Rectangle {
                        id: bg

                        anchors.fill: content
                        anchors.leftMargin: 20
                        anchors.rightMargin: 20

                        radius: 10
                        color: Colors.base

                        Column {
                            id: content
                            anchors.margins: 15
                            anchors.fill: parent

                            DefaultedText {
                                text: item.modelData.summary
                                font.pixelSize: 20
                                wrapMode: Text.Wrap

                                font.family: "monospace"
                                font.bold: true

                                width: parent.width
                            }

                            DefaultedText {
                                text: item.modelData.body + "aaaaaaaaaaaaaaaaaaaaaaa aaaaaaaaaaaaa aodkhgakjdgkjagdhj alkgjadjlkghaiuge asjfajsf askjfhaskjf ajksgfhakjghajksghjkasghasghjajs hkjhasjahg kjahgjk ajkfhajksafhjasjkfhahkjsfh"
                                wrapMode: Text.Wrap

                                width: parent.width

                                font.family: "monospace"
                                font.pixelSize: 14
                                font.italic: true
                            }
                        }
                    }
                }
            }
        }
    }
}
