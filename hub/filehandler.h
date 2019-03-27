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
};

#endif // FILEHANDLER_H
