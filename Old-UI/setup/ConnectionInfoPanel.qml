import QtQuick
import QtQuick.Controls
import '../components' as Components

Item {
    property string ip: "0.0.0.0"
    property int port: 0000

    Components.Panel {
        id: panel

        Label {
            id: connectionInfoTitle
            text: "Connection Info"
            y: 30
            anchors.horizontalCenter: parent.horizontalCenter

            font.pixelSize: 18
            font.bold: true
        }

        Label {
            id: ipLabel
            text: "IP address: " + connectionInfoPanel.ip

            anchors.top: connectionInfoTitle.bottom
        }

        Label {
            id: portLabel
            text: "Port number: " + connectionInfoPanel.port

            anchors.top: ipLabel.bottom
        }
    }
}
