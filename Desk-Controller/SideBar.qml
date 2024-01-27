import QtQuick
import QtQuick.Controls

Item {

    Drawer {
        id: drawer

        // visible at the startup
        visible: true

        Button {
            id: label1
            height: 50
            width: label2.width

            text: "Setup"
            anchors.top: parent.top
            anchors.left: parent.left

            onClicked: {
                moduleWindowLoader.source = "Setup.qml"
            }
        }

        Button {
            id: label2
            height: 50

            text: "System Monitor"
            anchors.top: label1.bottom
            anchors.left: parent.left

            onClicked: {
                moduleWindowLoader.source = "SystemMonitor.qml"
            }
        }

        Button {
            id: label3
            width: label2.width
            height: 50

            text: "Module"
            anchors.top: label2.bottom
            anchors.left: parent.left

            onClicked: {
                moduleWindowLoader.source = "Module.qml"
            }
        }
    }
}
