import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3


Item {
    id: root
    width: parent.fill
    height: parent.fill
    anchors {
        fill: parent
    }
    // sends username and the chatwindow object to the client
    Component.onCompleted: chatServer.registerClient(userName.text,this);

    /*
        @ alias userName: gives access to the userName.text outside of ChatWindow.qml
        @ alias messageToSend: gives access to messageInputField.text outside of ChatWindow.qml
        @ alias messageDisplay: gives access to chatTranscriptText.text outside of ChatWindow.qml
    */
    property alias userName: userName.text // allows individual names to be set for the userName
    property alias messageToSend: messageInputField.text // allow access to individual textInput field
    property alias messageDisplay: chatTranscriptText.text

    /*
        @ string mUser: used to set the username of the individual ChatWindow object
        @ string mText: used to hold the message the user wants to send
        @ string userColor: used to pass the specific html font color for each user
    */
    property string mUser: ""
    property string mText: ""
    property string userColor: ""

    /*
        @ function sendMessageToServer(): called when the send button is clicked, this function sends the strings mText, mUser, and mColor to the chat server and resets the text in the messageInputField
    */


    function sendMessageToServer(){
        mText = messageInputField.text
        mUser = userName.text
        if(mText.length){
            messageInputField.text = ""
            chatServer.sendMessage(mText, mUser, userColor)
        }
        else{
            console.log("there is no message to send")
        }
    }

    RegisterUserMenu { }

    Label {
        id: userName
        font.pointSize: 15
        text: "Name"
        color: userColor
        y: 40
    }
    Row {
        id: firstRow
        width: parent.width
        height: 40
        anchors.top: userName.bottom
        Button {
            id: sendButton
            height: parent.height
            text: "Send"
            onClicked: {
                sendMessageToServer()
            }
        }
        TextField {
            id: messageInputField
            width: parent.width
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
                color: "blue"
                padding: 10

            }
        }
    }
}


