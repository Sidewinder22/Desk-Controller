import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

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
