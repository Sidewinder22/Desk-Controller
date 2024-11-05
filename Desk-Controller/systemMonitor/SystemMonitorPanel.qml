import QtQuick
import QtQuick.Controls

Item {
    property string ip: "0.0.0.0"
    property int port: 0000

    Rectangle {
        id: mainRectangle
        x: 150
        y: 100
        width: 600
        height: 450
        color: "#9bcad4"
        border.color: "lightsteelblue"
        border.width: 4
        radius: 8

        Label {
            id: panelTitle
            text: "System Monitor"
            y: 30
            anchors.horizontalCenter: parent.horizontalCenter

            font.pixelSize: 18
            font.bold: true
        }

        Label {
            id: ipLabel
            text: "IP address: " + systemMonitorPanel.ip

            anchors.top: panelTitle.bottom
            anchors.margins: 5
        }

        Label {
            id: portLabel
            text: "Port number: " + systemMonitorPanel.port

            anchors.top: panelTitle.bottom
            anchors.left: ipLabel.right
            anchors.margins: 5
        }

        TextArea {
            id: outputTextField
            placeholderText: qsTr("Process Info...")

            anchors.top: ipLabel.bottom
            anchors.left: mainRectangle.left
            anchors.right: mainRectangle.right
            anchors.bottom: mainRectangle.bottom
            anchors.margins: 10

            Connections {
                target: backend

                function onSendProcessInfo(processInfo) {
                    outputTextField.text = processInfo
                }
            }
        }
    }
}
