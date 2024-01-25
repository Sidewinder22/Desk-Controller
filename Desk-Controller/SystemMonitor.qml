import QtQuick
import QtQuick.Controls

Item {
    width: 640
    height: 480

    Loader {
        anchors.centerIn: parent
        sourceComponent: systemMonitor
    }

    Component {
        id: systemMonitor

        Label {
            id: systemMonitorLabel
            text: "### System Monitor ###"
        }
    }
}
