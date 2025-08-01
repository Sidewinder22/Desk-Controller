qt_add_library(Content STATIC)

qt_add_qml_module(Content
    URI "content"
    VERSION 1.0
    QML_FILES
        App.qml
        Bars.qml
        Footer.qml
        HomePage.qml
        MainView.qml
        MonitorView.qml
        PCMonitorWidget.qml
        MonitorStatusWidget.qml
        RoomMonitor.qml
        RpiMonitorWidget.qml
        SideBar.qml
)
