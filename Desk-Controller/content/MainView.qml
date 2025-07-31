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
            spacing: 20
            Layout.fillWidth: true

            MonitorStatusWidget {
                id: pcMonitorWidget
                title: "PC Monitor"
            }

           MonitorStatusWidget {
                id: rpiMonitorWidget
                title: "Rpi 4 Monitor"
            }

           MonitorStatusWidget {
                id: androidMonitorWidget
                title: "S25 Ultra Monitor"
            }

        }

        Connections {
            target: backend

            function onPcMonitorConnectedNotif(ipAddress, hostname) {
                pcMonitorWidget.connected = true
                pcMonitorWidget.ipAddress = ipAddress
                pcMonitorWidget.hostname = hostname
            }

            function onPcMonitorDisconnectedNotif() {
                pcMonitorWidget.connected = false
                pcMonitorWidget.ipAddress = ""
                pcMonitorWidget.hostname = ""
            }

            function onRpiMonitorConnectedNotif(ipAddress, hostname) {
                rpiMonitorWidget.connected = true
                rpiMonitorWidget.ipAddress = ipAddress
                rpiMonitorWidget.hostname = hostname
            }

            function onRpiMonitorDisconnectedNotif() {
                rpiMonitorWidget.connected = false
                rpiMonitorWidget.ipAddress = ""
                rpiMonitorWidget.hostname = ""
            }
        }
    }
}
