pragma Singleton
import QtQuick

QtObject {
    readonly property int width: 1440
    readonly property int height: 1080

    readonly property string nullIpAddress: "IP: -.-.-.-"
    readonly property string ipAddressName: "IP: "

    readonly property string headerToolBarConnectedLabel: "Status: Connected"
    readonly property string headerToolBarDisconnectedLabel: "Status: Disconnected"
}
