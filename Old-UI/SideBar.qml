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
                setupModule.visible = true
                systemMonitorModule.visible = false
                moduleModule.visible = false
            }
        }

        Button {
            id: label2
            height: 50

            text: "System Monitor"
            anchors.top: label1.bottom
            anchors.left: parent.left

            onClicked: {
                setupModule.visible = false
                moduleModule.visible = false
                systemMonitorModule.visible = true
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
                setupModule.visible = false
                systemMonitorModule.visible = false
                moduleModule.visible = true
            }
        }
    }
}
