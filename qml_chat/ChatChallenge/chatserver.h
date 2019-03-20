#ifndef CHATSERVER_H
#define CHATSERVER_H

#include <QObject>
#include <QString>

class ChatServer : public QObject
{
    Q_OBJECT

public:
    explicit ChatServer(QObject *parent = nullptr);

    Q_INVOKABLE void registerClient(QString name);
    Q_INVOKABLE void sendMessage(QString message, QString user, QString mColor);

signals:
    void messageSignal(QString message, QString user, QString mColor);
    void registerSignal(QString name);

private:
    std::map<QString, QObject*>clients;
};

#endif // CHATSERVER_H
