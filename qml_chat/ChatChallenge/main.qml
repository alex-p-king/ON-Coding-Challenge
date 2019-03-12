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
            // Set this chat instance's specific properties here
        }
    }
}
