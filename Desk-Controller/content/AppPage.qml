import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Window {
    id: window
    visible: true
    title: qsTr("App Page")
    // visibility: Qt.WindowFullScreen
    width: 900
    height: 600

    Page {
        anchors.fill: parent

        header: ColumnLayout {
            MenuBar {
                Menu {
                    title: qsTr("&File")
                    Action { text: qsTr("&New...") }
                    Action { text: qsTr("&Open...") }
                    MenuSeparator { }
                    Action {
                        text: qsTr("&Quit...")
                        onTriggered: {
                            Qt.quit()
                        }
                    }
                }

                Menu {
                    title: qsTr("&Edit")
                    Action { text: qsTr("&Copy...") }
                    Action { text: qsTr("&Cut...") }
                }
            }

            ToolBar {
                id: headerToolBar
                Layout.fillWidth: true

                RowLayout {
                    anchors.fill: parent

                    ToolButton {
                        text: "New Connection"
                    }
                    ToolButton {
                        text: qsTr("<")
                        // onClicked
                    }
                    Label {
                        id: headerToolBarLabel
                        text: "Title"
                        elide: Label.ElideRight
                        horizontalAlignment: Qt.AlignHCenter
                        verticalAlignment: Qt.AlignVCenter
                        Layout.fillWidth: true
                    }
                    ToolButton {
                        text: qsTr(":")
                    }
                    Label {
                        text: "IP: 0.0.0.0"
                        elide: Label.ElideRight
                        horizontalAlignment: Qt.AlignHCenter
                        verticalAlignment: Qt.AlignVCenter
                        Layout.fillWidth: true
                    }
                    Label {
                        text: "Port: 9999"
                        elide: Label.ElideRight
                        horizontalAlignment: Qt.AlignHCenter
                        verticalAlignment: Qt.AlignVCenter
                        Layout.fillWidth: true
                    }

                }
            }
        }

        RowLayout {
            anchors.fill:parent

            Button {
                Layout.alignment: Qt.AlignCenter
                text: "Click me"

                onClicked: {
                    console.log("Clicked!")
                }
            }
        }

        footer: TabBar {
            id: footerBar
            TabButton {
                text: qsTr("Home")
            }
            TabButton {
                text: qsTr("Discover")
            }
            TabButton {
                text: qsTr("Activity")
            }
        }
    }
}
