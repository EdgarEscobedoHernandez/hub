#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QApplication>
#include <QtWebEngine>
#include <QQuickStyle>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QApplication app(argc, argv);

    QQuickStyle::setStyle("Fusion");
    QtWebEngine::initialize();
    app.setWindowIcon(QIcon(":/src/img/logo/logo.svg"));

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
