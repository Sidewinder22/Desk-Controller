qt_add_library(DeskControllerContent STATIC)

qt_add_qml_module(DeskControllerContent
    URI "content"
    VERSION 1.0
    QML_FILES
        App.qml
        AppMenu.qml
        Footer.qml
        HomePage.qml
        MainView.qml
        PCMonitor.qml
        RoomMonitor.qml
        SideBar.qml
        TopToolBar.qml
)
