import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

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

            Button {
                id: newConnectionButton
                height: 50

                text: "Create new connection"
                font.pixelSize: 16

                onClicked: function() {
                    setupDialog.open()
                    console.log("Clicked...")
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
                            placeholderText: "0.0.0.0"

                            onEditingFinished: function() {
                                console.log("IP address: ", ipTextField.text)
                            }
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
                            placeholderText: "port number"

                            onEditingFinished: function() {
                                console.log("Port number: ", portTextField.text)
                            }
                        }
                    }
                }

                onAccepted: console.log("Ok")
                onRejected: console.log("Cancel")
            }
        }
    }
}
