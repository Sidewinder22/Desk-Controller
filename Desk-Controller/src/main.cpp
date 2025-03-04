#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>
#include <QQmlContext>

#include "app_environment.h"
#include "import_qml_plugins.h"
#include "Backend.hpp"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    QGuiApplication::setApplicationName("Desk-Controller");

    Backend *backend = new Backend(&app);
    engine.rootContext()->setContextProperty("backend", backend);

    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("Main", "Main");

    return app.exec();
}
