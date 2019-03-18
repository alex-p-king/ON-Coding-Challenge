#include <QtDebug>

#include "chatserver.h"

ChatServer::ChatServer(QObject *parent) :
    QObject(parent)
{
}

void ChatServer::registerClient(std::string  name)
{
    /*your implementation here*/
    qDebug() << "registering ";
    clients = {
        {name, this}
    };
    emit registerSignal(name);
}

void ChatServer::sendMessage(QString message, QString user)
{
    emit messageSignal(message, user);
}

