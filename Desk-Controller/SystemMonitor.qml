import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
    width: 640
    height: 480

    signal setup(string ip, int port);

    onSetup: (ip, port) => {
        console.log("onShowSM, ip: " + ip + ", port: " + port);
        ipAddressAndPort = ip + ":" + port;
    }

    property string ipAddressAndPort: "0.0.0.0:0";

    Loader {
        anchors.centerIn: parent
        sourceComponent: systemMonitor
    }

    Component {
        id: systemMonitor

        ColumnLayout {
            id: columnLayout
            spacing: 10

            Label {
                id: systemMonitorLabel
                text: "### System Monitor ###"
            }

            Label {
                id: ipAddressAndPortLabel
                text: systemMonitorModule.ipAddressAndPort
                Layout.alignment: Qt.AlignCenter
            }
        }
    }
}
