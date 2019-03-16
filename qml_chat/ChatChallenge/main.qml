import QtQuick 2.9
import QtQuick.Window 2.2

Window {
    id: window1
    visible: true
    width: 500
    height: 500
    title: qsTr("Chat Window 1")


    ChatWindow {
        id: chat1
        userName: "User 1"


        // Set this chat instance's specific properties here
        onSendMessage: {
            chat1.messageDisplay = chat1.messageDisplay +  "\n" + "<b>" + chat1.userName + ": " + "</b>" + mText
            chat2.messageDisplay = chat2.messageDisplay + "\n" + "<b>" + chat1.userName + ": " + "</b>" + mText
        }


    }

    Window {
        id: window2
        visible: true
        width: 500
        height: 500
        title: qsTr("Chat Window 2")

        ChatWindow {
            id: chat2
            userName: "User 2"
            // Set this chat instance's specific properties here
            onSendMessage: {
                chat1.messageDisplay = chat1.messageDisplay +  "\n" + "<b>" + chat2.userName + ": " + "</b>" + mText
                chat2.messageDisplay = chat2.messageDisplay + "\n" + "<b>" + chat2.userName + ": " + "</b>" + mText
            }


        }
    }
}
