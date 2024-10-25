import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Dialogs
import "setup" as Setup

Item {
    width: 900
    height: 600

    Loader {
        anchors.fill: parent
        sourceComponent: setupComponent
    }

    Component {
        id: setupComponent

        Item {
            anchors.centerIn: parent

            Connections {
                target: backend

                function onServerConnected(ip, port) {
                    console.log("Server connected: " + ip + ", port: " + port);
                    newConnectionButton.visible = false

                    connectionInfo.visible = true
                    connectionInfo.ip = ip
                    connectionInfo.port = port

                    root.setupCompleted(ip, port);
                }
            }

            Button {
                id: newConnectionButton
                height: 50
                anchors.centerIn: parent

                text: "Create new connection"
                font.pixelSize: 16

                onClicked: function() {
                    setupDialog.enable()
                }
            }

            Setup.NewConnectionDialog {
                id: setupDialog
                x: 250
                y: 150
            }

            Setup.ConnectionInfo {
                id: connectionInfo
                visible: false
            }
        }
    }
}
