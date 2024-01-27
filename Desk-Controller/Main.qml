import QtQuick
import QtQuick.Controls

ApplicationWindow {
    id: root
    width: 900
    height: 600
    visible: true
    title: qsTr("Desk Controller")

    Loader {
        id: moduleWindowLoader
        source: "Setup.qml"
    }

    Connections {
        id: mainConnections
        target: moduleWindowLoader.item
    }

    SideBar { }
}
