import QtQuick
import QtQuick.Controls

ApplicationWindow {
    id: root
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Label {
        id: welcomeLabel
        text: "Hello world!"

        anchors {
            horizontalCenter: parent.horizontalCenter
            verticalCenter: parent.verticalCenter
        }
    }

    SideBar { }
}
