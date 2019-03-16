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
    RowLayout {
        id: firstRow
        width: parent.width
        height: 40
        anchors.top: userName.bottom
        Rectangle {
            id: firstRowRectangle
            border.color: "black"
            border.width: 1
            anchors.fill: parent


        }
        TextInput {
            id: mTextInput
            height: parent.height
            color: "black"
            anchors.fill: parent
        }
        Button {
            id: sendButton
            text: "Send"
            onClicked: {

//              //chatTranscriptText.text = chatTranscriptText.text + "\n" + mText
                mText = mTextInput.text
                mUser = userName.text
                mTextInput.text = ""
                chatServer.sendMessage(mText, mUser)

            }
            Layout.alignment: Qt.AlignRight
        }
    }
    RowLayout {
        id: secondRow
        width: parent.width
        height: parent.height
        anchors.top: firstRow.bottom
        Layout.margins: 10

        Rectangle {
            color: "dodgerblue"
            opacity: 0.15
            anchors.fill: parent

        }
        ScrollView {
            id: chatTranscriptScroll
            anchors.fill: parent
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


