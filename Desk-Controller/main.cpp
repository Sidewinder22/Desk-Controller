#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>
#include <QQmlContext>
#include "Backend.hpp"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQuickStyle::setStyle("Fusion");
    // QQuickStyle::setStyle("Material");
    // QQuickStyle::setStyle("Universal");
    // QQuickStyle::setStyle("Imagine");

    QQmlApplicationEngine engine;

    Backend *backend = new Backend(&app);
    engine.rootContext()->setContextProperty("backend", backend);

    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("Desk-Controller", "Main");

    return app.exec();
}
