import QtQuick
import QtQuick.Controls

ApplicationWindow {
    id: root
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Loader {
        id: moduleWindowLoader
        source: "SystemMonitor.qml"
    }

    Connections {
        id: mainConnections
        target: moduleWindowLoader.item

        function onMessage(msg) {
            console.log(msg)
        }
    }

    SideBar { }
}
