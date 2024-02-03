import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Dialogs

Item {
    width: 640
    height: 480

    Loader {
        anchors.centerIn: parent
        sourceComponent: setup
    }

    Component {
        id: setup

        Item {
            anchors.centerIn: parent

            Connections {
                target: backend

                function onServerConnected(ip, port) {
                    console.log("Server connected: " + ip + ", port: " + port)
                }
            }

            Button {
                id: newConnectionButton
                height: 50

                text: "Create new connection"
                font.pixelSize: 16

                onClicked: function() {
                    setupDialog.open()
                }
            }

            Dialog {
                id: setupDialog
                title: "Enter data for a new connection"
                standardButtons: Dialog.Ok | Dialog.Cancel

                contentItem: GridLayout {
                    id: setupGridLayout
                    rows: 2
                    columns:2
                    rowSpacing: 20
                    anchors.centerIn: parent

                    Label {
                        id: ipLabel
                        text: "IP address"
                    }

                    Rectangle {
                        id: ipRectangle
                        color: "orange"
                        width: ipTextField.width
                        height: ipTextField.height

                        TextField {
                            id: ipTextField
                            width: 200
                            placeholderText: "0.0.0.0"
                        }
                    }

                    Label {
                        id: portLabel
                        text: "Port number"
                    }

                    Rectangle {
                        id: portRectangle
                        color: "#a28bed"
                        width: portTextField.width
                        height: portTextField.height

                        TextField {
                            id: portTextField
                            width: 200
                            placeholderText: "port number"

                            onEditingFinished: function() {
                                var port = parseInt(portTextField.text)
                                if (port < 1024 || port > 65535)
                                {
                                    wrongPortMessageDialog.open()
                                    return
                                }
                            }
                        }
                    }
                }

                onAccepted: function() {
                    console.log("Ok clicked")

                    var port = parseInt(portTextField.text)
                    if (port < 1024 || port > 65535)
                    {
                        wrongPortMessageDialog.open()
                        return
                    }

                    backend.ipAndPortDataReady(ipTextField.text, port)

                }
                onRejected: console.log("Cancel")
            }

            MessageDialog {
                id: wrongPortMessageDialog
                buttons: MessageDialog.Ok
                text: "Not allowed port number!"
                informativeText: "Port number should be greater than 1023 and lower than 65536"
            }
        }
    }
}
