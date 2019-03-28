#include "filehandler.h"
#include <QFile>
#include <QUrl>

FileHandler::FileHandler(QObject *parent) : QObject(parent)
{

}

bool FileHandler::cleanWhatsappStorage(QString path)
{
    QFile file;
    return file.remove(path + "/Service Worker/Database/000003.log");
}

QString FileHandler::fromUrlToPath(QString url)
{
    QUrl u(url);
    QString path = u.path();
    return path;
}
