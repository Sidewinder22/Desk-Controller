import QtQuick
import QtQuick.Controls

Item {
    id: connectionInfoItem

    property string ip: "0.0.0.0"
    property int port: 0000

    Rectangle {
        x: 150
        y: 100
        width: 600
        height: 450
        color: "#9bcad4"
        border.color: "lightsteelblue"
        border.width: 4
        radius: 8

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
            text: "IP address: " + connectionInfoItem.ip

            anchors.top: connectionInfoTitle.bottom
        }

        Label {
            id: portLabel
            text: "Port number: " + connectionInfoItem.port

            anchors.top: ipLabel.bottom
        }
    }
}
