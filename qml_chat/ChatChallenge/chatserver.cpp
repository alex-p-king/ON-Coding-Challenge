#include <QtDebug>

#include "chatserver.h"

ChatServer::ChatServer(QObject *parent) :
    QObject(parent)
{
}

void ChatServer::registerClient()
{
    /*your implementation here*/
    qDebug() << "registering";
}

void ChatServer::sendMessage(QString message, QString user)
{
    emit messageSignal(message, user);
}

