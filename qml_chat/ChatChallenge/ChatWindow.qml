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
    Component.onCompleted: chatServer.registerClient(userName.text,this);

    // Add your chat transcript box, message input box, and message sending button here

    property alias userName: userName.text // allows individual names to be set for the userName
    property alias messageToSend: mTextInput.text // allow access to individual textInput field
    property alias messageDisplay: chatTranscriptText.text
    property string mUser: ""
    property string mText: ""
    signal sendMessage(string message) // This signal will be fired by the send button and will be used to update both of the text edits to contain the message




    Label {
        id: userName
        font.pointSize: 15
        text: "Name"
    }
    Row {
        id: firstRow
        width: parent.width

        height: 40
        anchors.top: userName.bottom
        Rectangle {
            id: firstRowRectangle
            border.color: "black"
            border.width: 1



        }
        Button {
            id: sendButton
            height: parent.height
            text: "Send"
            onClicked: {
                mText = mTextInput.text
                mUser = userName.text
                mTextInput.text = ""
                chatServer.sendMessage(mText, mUser)

            }
        }
        TextField {
            id: mTextInput
            width: 400
            height: parent.height
            color: "black"
            placeholderText: "Enter message..."

        }

    }
    Row {
        id: secondRow
        width: parent.width
        height: parent.height
        anchors.top: firstRow.bottom

        Rectangle {
            color: "dodgerblue"
            opacity: 0.15

        }
        ScrollView {
            id: chatTranscriptScroll
            x: sendButton.width
            width: parent.width
            TextEdit {
                id: chatTranscriptText
                width: chatTranscriptScroll.width
                readOnly: true
                textFormat: Text.RichText
                wrapMode: TextEdit.Wrap

            }
        }

    }

}


