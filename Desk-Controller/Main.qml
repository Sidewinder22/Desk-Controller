import QtQuick
import QtQuick.Controls

ApplicationWindow {
    id: root
    width: 900
    height: 600
    visible: true
    title: qsTr("Desk Controller")

    SideBar { }

    Setup {
        id: setupModule
        visible: true
    }

    SystemMonitor {
        id: systemMonitorModule
        visible: false
        anchors.fill: parent
    }

    Module {
        id: moduleModule
        visible: false
        anchors.fill: parent
    }
}
