#include <QtDebug>

#include "chatserver.h"

ChatServer::ChatServer(QObject *parent) :
    QObject(parent)
{
}

void ChatServer::registerClient(QString  name)
{
    /*your implementation here*/
    clients = {
        {name, this}
    };
    emit registerSignal(name);
}

void ChatServer::sendMessage(QString message, QString user, QString mColor)
{
    emit messageSignal(message, user, mColor);
}

