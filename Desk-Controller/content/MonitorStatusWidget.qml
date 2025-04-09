import QtQuick
import QtQuick.Controls

Rectangle {
    id: monitorStatusRectangle
    property bool connected;
    property string hostname;
    property string ipAddress;
    property string title;

    width: 400
    height: 200
    color: connected ? "#e6ffe6" : "#ffb3b3"

    border.color: connected ? "#00cc00" : "#ff4d4d"
    border.width: 5
    radius: 10

    Label {
        id: monitorStatusWidgetTitle
        text: monitorStatusRectangle.title
        font.pixelSize: 30
        font.bold: true

        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.margins: 20
    }

    Label {
        id: monitorStatusWidgetHostname
        text: "Hostname: " + monitorStatusRectangle.hostname
        font.pixelSize: 20

        anchors.top: monitorStatusWidgetTitle.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.margins: 20
    }

    Label {
        id: monitorStatusWidgetIpAddress
        text: "IP address: " + monitorStatusRectangle.ipAddress
        font.pixelSize: 20

        anchors.top: monitorStatusWidgetHostname.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.margins: 20
    }
}
