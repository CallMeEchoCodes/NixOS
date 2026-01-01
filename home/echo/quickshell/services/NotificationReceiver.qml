pragma Singleton

import Quickshell
import Quickshell.Services.Notifications
import QtQuick

Singleton {
    id: root

    property list<Notification> notifications: []

    NotificationServer {
        id: server

        onNotification: notif => {
            notif.tracked = true;

            root.notifications.push(notif);
        }
    }
}
