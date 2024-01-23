import QtQuick
import QtQuick.Controls

Item {

    Drawer {
        id: drawer
        width: 0.66 * window.width
        height: window.height

        // visible at the startup
        visible: true

        Button {
            id: label1
            height: 50

            text: "System Monitor"
            anchors.top: parent.top
            anchors.left: parent.left

            onClicked: {
            welcomeLabel.text = "Hello"
            }
        }

        Button {
            id: label2
            width: label1.width
            height: 50
            text: "Anoter Label"
            anchors.top: label1.bottom
            anchors.left: parent.left

            onClicked: {
            welcomeLabel.text = "Hello, another content label"
            }
        }
    }

}
