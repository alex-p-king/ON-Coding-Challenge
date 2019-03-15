import QtQuick 2.9
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3

Item {
    id: root
    width: parent.fill
    height: parent.fill

    anchors {
        fill: parent
    }
    Component.onCompleted: chatServer.registerClient();

    // Add your chat transcript box, message input box, and message sending button here
    Label {
        id: userName
        font.pointSize: 15
        text: "Name"
    }
    RowLayout {
        id: firstRow
        width: parent.width
        height: 40
        anchors.top: userName.bottom
        Rectangle {
            id: firstRowRectangle
            color: "tomato"
            anchors.fill: parent
            opacity: 0.15

        }
        TextInput {
            id: textInput
            height: parent.height
            color: "black"
            text: "this is dummy text"
            Layout.fillWidth: parent
        }
        Button {
            id: sendButton
            text: "Send"
            onClicked: console.log("Send Button Clicked")
            Layout.alignment: Qt.AlignRight
        }
    }
    RowLayout {
        width: parent.width
        height: 200

        Rectangle {
            color: "dodgerblue"
            opacity: 0.15
            anchors.fill: parent
        }

    }
}

