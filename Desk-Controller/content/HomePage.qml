import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Page {
    id: root

    header: ColumnLayout {
        spacing: 0

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
                    text: qsTr("<")
                    enabled: stackView.depth > 1
                    onClicked: stackView.pop()
                }
                ToolButton {
                    text: qsTr("New Connection")
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

    background: Rectangle {
        // color: "lightblue"
    }

    StackView {
        id: stackView
        initialItem: mainView
        anchors.left: sideMenu.right
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.top: parent.top
    }

    MainView {
        id: mainView
    }

    PCMonitor {
        id: pcMonitor
    }

    RoomMonitor {
        id: roomMonitor
    }

    // SideBar
    Column {
        id: sideMenu
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        height: parent.height

        Button {
            text: "Main"
            onClicked: {
                if (stackView.depth > 1) {
                    stackView.pop()
                }
            }
        }
        Button {
            text: "Second"
            onClicked: {
                stackView.pop()
                stackView.push(pcMonitor)
            }
        }
        Button {
            text: "Third"
            onClicked: {
                stackView.pop()
                stackView.push(roomMonitor)
            }
        }
    }

    footer: ToolBar {
        id: footerToolBar
        Layout.fillWidth: true

        RowLayout {
            anchors.fill: parent

            ToolButton {
                text: qsTr("<")
                enabled: stackView.depth > 1
                onClicked: stackView.pop()
            }
            Label {
                text: "StackView depth: " + stackView.depth
                elide: Label.ElideRight
                horizontalAlignment: Qt.AlignHCenter
                verticalAlignment: Qt.AlignVCenter
                Layout.fillWidth: true
            }
        }
    }
}
