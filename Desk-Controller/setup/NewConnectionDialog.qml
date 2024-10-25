import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Dialogs

Item {
    function enable() {
        newConnectionDialog.open()
    }

    Dialog {
        id: newConnectionDialog

        title: "Enter data for a new connection"
        standardButtons: Dialog.Ok | Dialog.Cancel

        function connect() {
            var port = parseInt(portTextField.text)
            if (port < 1024 || port > 65535)
            {
                wrongPortMessageDialog.open()
                return
            }

            backend.ipAndPortDataReady(ipTextField.text, port)
        }

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

                    Keys.onReturnPressed: {
                        console.log("port - Enter pressed");
                        newConnectionDialog.connect();
                        newConnectionDialog.visible = false;
                    }
                }
            }
        }

        onAccepted: connect()
        onRejected: console.log("Cancel")
    }

    MessageDialog {
        id: wrongPortMessageDialog
        buttons: MessageDialog.Ok
        text: "Not allowed port number!"
        informativeText: "Port number should be greater than 1023 and lower than 65536"
    }
}
