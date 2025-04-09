import QtQuick
import QtQuick.Controls

Rectangle {
    property bool connected;
    property string hostname;
    property string ipAddress;

    width: 400
    height: 200
    color: connected ? "#e6ffe6" : "#ffb3b3"

    border.color: connected ? "#00cc00" : "#ff4d4d"
    border.width: 5
    radius: 10

    Label {
        id: pcMonitorWidgetTitle
        text: "Rpi 4 Monitor"
        font.pixelSize: 30
        font.bold: true

        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.margins: 20
    }

    Label {
        id: pcMonitorWidgetHostname
        text: "Hostname: " + pcMonitorWidget.hostname
        font.pixelSize: 20

        anchors.top: pcMonitorWidgetTitle.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.margins: 20
    }

    Label {
        id: pcMonitorWidgetIpAddress
        text: "IP address: " + pcMonitorWidget.ipAddress
        font.pixelSize: 20

        anchors.top: pcMonitorWidgetHostname.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.margins: 20
    }
}
