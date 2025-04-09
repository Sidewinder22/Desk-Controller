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

        onClicked: {
            if (stackView.depth > 1) {
                stackView.pop()
            }
        }
    }
    Button {
        text: "PC Monitor"
        onClicked: {
            stackView.pop()
            stackView.push(monitorView)
        }
    }
    Button {
        text: "Third"
        onClicked: {
            stackView.pop()
            stackView.push(roomMonitor)
        }
    }
}
