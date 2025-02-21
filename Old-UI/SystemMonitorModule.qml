import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "systemMonitor" as SystemMonitor

Item {
    width: 900
    height: 600

    signal setupCompleted(string ip, int port);

    onSetupCompleted: (ip, port) => {
        console.log("onSetupCompleted, ip: " + ip + ", port: " + port);

        ipAddress = ip
        portNumber = port
    }

    property string ipAddress: "0.0.0.0"
    property int portNumber: 0;

    Loader {
        anchors.fill: parent
        sourceComponent: systemMonitor
    }

    Component {
        id: systemMonitor

        Item {
            id: item
            anchors.centerIn: parent

            SystemMonitor.SystemMonitorPanel {
                id: systemMonitorPanel
                ip: systemMonitorModule.ipAddress
                port: systemMonitorModule.portNumber
            }
        }
    }
}
