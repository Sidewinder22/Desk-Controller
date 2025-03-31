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

            PCMonitorWidget {
                id: pcMonitorWidget
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            }

            PCMonitorWidget {
                id: pcMonitorWidget2
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            }
        }

        Connections {
            target: backend

            function onPcMonitorDataReceivedNotif(loadData) {
                pcMonitorWidget.loadData = loadData
            }

            function onPcMonitorDisconnectedNotif() {
                console.log("MainView, pc monitor disconnected")
                pcMonitorWidget.loadData = ""
            }
        }
    }
}
