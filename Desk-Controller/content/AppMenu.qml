import QtQuick
import QtQuick.Controls

MenuBar {
    Menu {
        title: qsTr("&File")
        Action { text: qsTr("&New...") }
        Action { text: qsTr("&Open...") }
        MenuSeparator { }
        Action {
            text: qsTr("&Quit...")
            onTriggered: {
                Qt.quit()
            }
        }
    }

    Menu {
        title: qsTr("&Edit")
        Action { text: qsTr("&Copy...") }
    }
}
