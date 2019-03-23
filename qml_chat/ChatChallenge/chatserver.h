#ifndef CHATSERVER_H
#define CHATSERVER_H

#include <QObject>
#include <QString>

class ChatServer : public QObject
{
    Q_OBJECT

public:
    explicit ChatServer(QObject *parent = nullptr);

    /**
    * @pre none
    * @post a new client will be registered into clients and the register signal is emmited
    * @param name, a string used to map the user to the object
    */
    Q_INVOKABLE void registerClient(QString name);

    /**
    * @pre none
    * @post sends message, user, and mColor to main.qml
    * @param message, a string containing the message the user typed into the text input
    * @param user, a string containing the users name
    * @param mColor, a string containing the color that is used to format the users name with a color
    */
    Q_INVOKABLE void sendMessage(QString message, QString user, QString mColor);

signals:
    /**
    * @pre none
    * @post called by sendMessage to emit a signal that can be caught in qml
    * @param message, a string containing the message the user typed into the text input
    * @param user, a string containing the users name
    * @param mColor, a string containing the color that is used to format the users name with a color
    */
    void messageSignal(QString message, QString user, QString mColor);

    /**
    * @pre none
    * @post called by registerClient to emit a signal containing the users name
    * @param url, a string representing a URL
    */
    void registerSignal(QString name);

private:
    std::map<QString, QObject*>clients;
};

#endif // CHATSERVER_H
