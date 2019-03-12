import QtQuick 2.9

Item {
    id: root
    anchors {
        fill: parent
    }

    Text {
        id: tempText
        text: "This is where you will implement your chat UI"
        anchors {
            centerIn: root
        }
    }

    Component.onCompleted: chatServer.registerClient();

    // Add your chat transcript box, message input box, and message sending button here
}
