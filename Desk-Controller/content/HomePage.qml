import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Page {
    id: root

    header: Bars { }

    StackView {
        id: stackView
        initialItem: mainView
        anchors.left: sideBar.right
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.top: parent.top
    }

    MainView {
        id: mainView
    }

    PCMonitor {
        id: pcMonitor
    }

    RoomMonitor {
        id: roomMonitor
    }

    SideBar {
        id: sideBar
    }

    footer: Footer {
        id: footer
    }
}
