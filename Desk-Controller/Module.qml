import QtQuick
import QtQuick.Controls

Item {
    width: 640
    height: 480

    Loader {
        anchors.centerIn: parent
        sourceComponent: module
    }

    Component {
        id: module

        Label {
            id: moduleLabel
            text: "### Module ###"
        }
    }
}
