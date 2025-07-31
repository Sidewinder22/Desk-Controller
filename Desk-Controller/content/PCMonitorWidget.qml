import QtQuick
import QtQuick.Controls

Rectangle {
    id: pcMonitorWidgetRectangle
    property string loadData;
    property string hostname;
    property string ipAddress;

    width: 570
    height: 720
    color: "#e6ffe6"

    border.color: "#00cc00"
    border.width: 5
    radius: 10

    Label {
        id: pcMonitorWidgetTitle
        text: "PC Monitor"
        font.pixelSize: 30
        font.bold: true

        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.margins: 20
    }

    Label {
        id: pcMonitorWidgetHostname
        text: "Hostname: " + pcMonitorWidgetRectangle.hostname
        font.pixelSize: 20

        anchors.top: pcMonitorWidgetTitle.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.margins: 20
    }

    Label {
        id: pcMonitorWidgetIpAddress
        text: "IP address: " + pcMonitorWidgetRectangle.ipAddress
        font.pixelSize: 20

        anchors.top: pcMonitorWidgetHostname.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.margins: 20
    }

    TextArea {
        id: loadDataField
        placeholderText: "Load data..."
        text: pcMonitorWidgetRectangle.loadData

        anchors.top: pcMonitorWidgetIpAddress.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.margins: 20

        readOnly: true
    }
}
