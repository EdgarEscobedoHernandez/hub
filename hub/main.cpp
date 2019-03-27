#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QApplication>
#include <QtWebEngine>
#include <QQuickStyle>
#include <QWebEngineProfile>

#include "filehandler.h"
#include "services.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QApplication app(argc, argv);

    //REGISTROS
    qmlRegisterType<FileHandler>("hub.file", 1, 0, "FileHandler");
    qmlRegisterType<Services>("hub.services", 1, 0, "Services");

    QQuickStyle::setStyle("Fusion");
    QtWebEngine::initialize();
    //QWebEngineProfile::defaultProfile()->setHttpUserAgent("Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/73.0.3664.3 Chrome/73.0.3664.3 Safari/537.36");
    //QWebEngineProfile::defaultProfile()->setPersistentCookiesPolicy(QWebEngineProfile::ForcePersistentCookies);
    app.setWindowIcon(QIcon(":/src/img/logo/logo.svg"));

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
