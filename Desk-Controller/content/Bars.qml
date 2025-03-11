import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ColumnLayout {

    Action {
        id: connectAction
        text: qsTr("Connect")
        onTriggered: connectDialog.open()
    }

    MenuBar {
        Menu {
            title: qsTr("&File")
            MenuItem { action: connectAction }

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
                text: qsTr("Connect")
                action: connectAction
            }

            Label {
                id: headerToolBarLabel
                text: "Status: --Disconnected--"
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

