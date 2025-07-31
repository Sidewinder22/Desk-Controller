import QtQuick
import QtQuick.Controls

Column {
    id: sideMenu
    anchors.left: parent.left
    anchors.top: parent.top
    anchors.bottom: parent.bottom
    anchors.topMargin: 40
    height: parent.height

    Button {
        text: "Main View"
        width: 90

        onClicked: {
            if (stackView.depth > 1) {
                stackView.pop()
            }
        }
    }
    Button {
        text: "PC Monitor"
        width: 90

        onClicked: {
            stackView.pop()
            stackView.push(monitorView)
        }
    }
    Button {
        text: "Third"
        width: 90

        onClicked: {
            stackView.pop()
            stackView.push(roomMonitor)
        }
    }
}
