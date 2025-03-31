import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Rectangle {
    property string loadData;

    width: pcMonitorWidgetColumn.width
    height: pcMonitorWidgetColumn.height
    color: "#ddffcc"

    border.color: "#008000"
    border.width: 5
    radius: 10

    ColumnLayout {
        id: pcMonitorWidgetColumn
        anchors.margins: 20

        Label {
            text: "Hostname: "
            font.pixelSize: 20
            Layout.alignment: Qt.AlignHCenter
        }

        Label {
            text: "IP address: "
            font.pixelSize: 20
            Layout.alignment: Qt.AlignHCenter
        }

        TextArea {
            id: loadDataField
            placeholderText: "Load data..."
            text: pcMonitorWidget.loadData

            Layout.fillWidth: true
            Layout.minimumHeight: 375
        }
    }
}
