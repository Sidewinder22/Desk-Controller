import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ToolBar {
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
            text: "By {\_ Sidewinder22 _/}"
            elide: Label.ElideRight
            horizontalAlignment: Qt.AlignHCenter
            verticalAlignment: Qt.AlignVCenter
            Layout.fillWidth: true
        }
    }
}
