import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    id: window2
    visible: true
    width: 500
    height: 500
    minimumHeight: 200
    minimumWidth: 200
    title: qsTr("Chat Window 2")
    /*
        @ onMessageSignal: recieves the message, user, and color from the chatserver and updates to display html formatted messages
        @ onRegisterSignal: triggered whenever a new user is registered, this block logs the user being registered to the console
    */
    Connections {
        target: chatServer
        onMessageSignal: {
            console.log("the message being sent by the signal is: " + message)
            chat1.messageDisplay = chat1.messageDisplay + "\n" + "<b><font color='" + mColor + "'>" + user + ": " + "</b><font>" + message
            chat2.messageDisplay = chat2.messageDisplay + "\n" + "<b><font color='" + mColor + "'>" + user + ": " + "</b><font>" + message
        }
        onRegisterSignal: {
            console.log("Registering: " + name )
        }
    }
    ChatWindow {
        id: chat2
        userColor: "red"
        userName: "User 2"
    }


    Window {
        id: window1
        visible: true
        width: 500
        height: 500
        minimumHeight: 200
        minimumWidth: 200
        title: qsTr("Chat Window 1")

        ChatWindow {
            id: chat1
            userName: "User 1"
            userColor: "dodgerblue"
            focus: true

        }
    }
}
