pragma Singleton
import QtQuick

QtObject {
    readonly property int width: 1280
    readonly property int height: 1024

    readonly property string nullIpAddress: "IP: -.-.-.-"
    readonly property string ipAddressName: "IP: "

    readonly property string headerToolBarConnectedLabel: "Status: Connected"
    readonly property string headerToolBarDisconnectedLabel: "Status: Disconnected"
}
