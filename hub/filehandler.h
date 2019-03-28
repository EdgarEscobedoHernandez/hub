#ifndef FILEHANDLER_H
#define FILEHANDLER_H

#include <QObject>

class FileHandler : public QObject
{
    Q_OBJECT

public:
    FileHandler(QObject *parent = nullptr);
    virtual ~FileHandler() {}
    Q_INVOKABLE bool cleanWhatsappStorage(QString path);///<This only receives the path until the persistant/[number of service]
    Q_INVOKABLE QString fromUrlToPath(QString url);///This transforms the given url to a path
};

#endif // FILEHANDLER_H
