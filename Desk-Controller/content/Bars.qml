import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import DeskController

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
                text: Constants.headerToolBarDisconnectedLabel
                elide: Label.ElideRight
                horizontalAlignment: Qt.AlignHCenter
                verticalAlignment: Qt.AlignVCenter
                Layout.fillWidth: true
            }

            ToolButton {
                text: qsTr(":")
            }

            Label {
                id: headerIpLabel
                text: Constants.nullIpAddress
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

        Connections {
            target: backend

            function onPcMonitorConnected(ipAddress) {
                headerIpLabel.text = Constants.ipAddressName + ipAddress
                headerToolBarLabel.text = Constants.headerToolBarConnectedLabel
            }

            function onPcMonitorDisconnected() {
                headerIpLabel.text = Constants.nullIpAddress
                headerToolBarLabel.text = Constants.headerToolBarDisconnectedLabel
            }
        }
    }
}

