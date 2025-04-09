import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Pane {
    visible: false

    ColumnLayout {
        anchors.fill: parent
        spacing: 20

        Label {
            text: "Main View"

            elide: Label.ElideRight
            Layout.alignment: Qt.AlignHCenter

            font.bold: true
            font.pixelSize: 40
        }
    }
}
