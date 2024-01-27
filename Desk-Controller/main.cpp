#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    // QQuickStyle::setStyle("Fusion");
    QQuickStyle::setStyle("Material");
    // QQuickStyle::setStyle("Universal");
    // QQuickStyle::setStyle("Imagine");

    QQmlApplicationEngine engine;
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("Desk-Controller", "Main");

    return app.exec();
}
