import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Pane {
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

        RowLayout {
            spacing: 10
            Layout.fillWidth: true

            PCMonitorWidget {
                id: pcMonitorWidget
            }

            RpiMonitorWidget {
                id: rpiMonitorWidget
            }
        }

        Connections {
            target: backend

            function onPcMonitorDataReceivedNotif(loadData) {
                pcMonitorWidget.loadData = loadData
            }

            function onPcMonitorConnectedNotif(ipAddress, hostname) {
                pcMonitorWidget.ipAddress = ipAddress
                pcMonitorWidget.hostname = hostname
            }

            function onPcMonitorDisconnectedNotif() {
                console.log("MainView, pc monitor disconnected")
                pcMonitorWidget.loadData = ""
                pcMonitorWidget.ipAddress = ""
                pcMonitorWidget.hostname = ""
            }

            function onRpiMonitorDataReceivedNotif(loadData) {
                rpiMonitorWidget.loadData = loadData
            }

            function onRpiMonitorConnectedNotif(ipAddress, hostname) {
                rpiMonitorWidget.ipAddress = ipAddress
                rpiMonitorWidget.hostname = hostname
            }

            function onRpiMonitorDisconnectedNotif() {
                console.log("MainView, rpi monitor disconnected")
                rpiMonitorWidget.loadData = ""
                rpiMonitorWidget.ipAddress = ""
                rpiMonitorWidget.hostname = ""
            }
        }
    }
}
