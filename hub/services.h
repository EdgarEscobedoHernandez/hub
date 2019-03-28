#ifndef SERVICES_H
#define SERVICES_H

#include <QObject>

class Services : public QObject
{
    Q_OBJECT
    Q_ENUMS(SERVICES)

public:
    Services(QObject *parent = nullptr) : QObject (parent) {}
    virtual ~Services() {}


    enum SERVICES : int{
        WHATSAPP = 1,
        TRELLO = 2,
        GMAIL = 3
    };
};

#endif // SERVICES_H
