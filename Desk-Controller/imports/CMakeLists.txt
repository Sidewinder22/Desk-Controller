set_source_files_properties(Constants.qml
    PROPERTIES
        QT_QML_SINGLETON_TYPE true
)

set_source_files_properties(AppSettings.qml
    PROPERTIES
        QT_QML_SINGLETON_TYPE true
)

qt_add_library(Imports STATIC)

qt_add_qml_module(Imports
    URI "DeskController"
    VERSION 1.0
    QML_FILES
        AppSettings.qml
        Constants.qml
)
