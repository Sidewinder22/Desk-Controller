import QtQuick
import DeskController

Window {
    id: window

    width: Constants.width
    height: Constants.height

    visible: true
    // visibility: Qt.WindowFullScreen
    title: "Desk-Controller"

    HomePage {
        id: mainScreen
        anchors.fill: parent
    }
}
