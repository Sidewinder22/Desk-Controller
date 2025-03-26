import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Pane {
    ColumnLayout {
        anchors.fill: parent
        spacing: 10

        Label {
            text: "Main View"
        }

        TextArea {
            id: loadDataField
            placeholderText: "Load data..."
            Layout.fillWidth: true
        }

        Connections {
            target: backend

            function onLoadDataReceived(loadData) {
                console.log("MainView, pc monitor connected")
                loadDataField.text = loadData
            }

            function onPcMonitorDisconnected() {
                console.log("MainView, pc monitor disconnected")
                loadDataField.text = ""
                loadDataField.placeholderText = "Load data..."
            }
        }
    }
}
