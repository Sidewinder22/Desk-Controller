import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Rectangle {
    property string loadData;
    property string hostname;
    property string ipAddress;

    width: 600
    height: 700
    color: "#f2e6ff"

    border.color: "#6600cc"
    border.width: 5
    radius: 10

    Label {
        id: rpiMonitorWidgetTitle
        text: "Rpi Monitor"
        font.pixelSize: 30
        font.bold: true

        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.margins: 20
    }

    Label {
        id: rpiMonitorWidgetHostname
        text: "Hostname: " + rpiMonitorWidget.hostname
        font.pixelSize: 20

        anchors.top: rpiMonitorWidgetTitle.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.margins: 20
    }

    Label {
        id: rpiMonitorWidgetIpAddress
        text: "IP address: " + rpiMonitorWidget.ipAddress
        font.pixelSize: 20

        anchors.top: rpiMonitorWidgetHostname.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.margins: 20
    }

    TextArea {
        id: loadDataField
        placeholderText: "Load data..."
        text: rpiMonitorWidget.loadData

        anchors.top: rpiMonitorWidgetIpAddress.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.margins: 20

        readOnly: true
    }
}
