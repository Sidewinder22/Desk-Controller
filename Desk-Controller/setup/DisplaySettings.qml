import QtQuick
import QtQuick.Controls

Item {

    Rectangle {
        x: 150
        y: 100
        width: 600
        height: 450
        color: "#9bcad4"
        border.color: "lightsteelblue"
        border.width: 4
        radius: 8

        Label {
            text: "Settings"
            y: 30
            anchors.horizontalCenter: parent.horizontalCenter

            font.pixelSize: 18
            font.bold: true
        }
    }
}
