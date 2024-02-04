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
        sourceComponent: setup
    }

    Component {
        id: setup

        Item {
            anchors.centerIn: parent

            Connections {
                target: backend

                function onServerConnected(ip, port) {
                    console.log("Server connected: " + ip + ", port: " + port);
                    newConnectionButton.visible = false
                    displaySettings.visible = true
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

            Setup.DisplaySettings {
                id: displaySettings
                visible: false
            }
        }
    }
}
