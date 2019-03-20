import QtQuick 2.9
import QtQuick.Window 2.2

Window {
    id: window1
    visible: true
    width: 500
    height: 500
    title: qsTr("Chat Window 1")

    Connections {
        target: chatServer
        onMessageSignal: {
            console.log("the message being sent by the signal is: " + message)

            //whenever a message signal is caught update chat 1 and chat 2 to show the new message
            chat1.messageDisplay = chat1.messageDisplay + "\n" + "<b><font color='" + mColor + "'>" + user + ": " + "</b><font>" + message
            chat2.messageDisplay = chat2.messageDisplay + "\n" + "<b><font color='" + mColor + "'>" + user + ": " + "</b><font>" + message
        }
        onRegisterSignal: {
            console.log("Registering: " + name )
        }
    }


    ChatWindow {
        id: chat1
        userName: "User 1"
        userColor: "dodgerblue"



        // Set this chat instance's specific properties here



    }

    Window {
        id: window2
        visible: true
        width: 500
        height: 500
        title: qsTr("Chat Window 2")

        ChatWindow {
            id: chat2
            userColor: "red"
            userName: "User 2"
            // Set this chat instance's specific properties here



        }
    }
}
