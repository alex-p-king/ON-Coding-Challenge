import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.5


Page {
    id: root
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

    RegisterUserMenu {
        width: parent.width - 5
        x: 5
    }
    Label {
        id: userName
        font.pointSize: 15
        font.family: "Helvetica"
        text: "Name"
        color: userColor
        y: 40
        x: 5
    }
    Row {
        id: firstRow
        width: parent.width - 5
        height: 40
        anchors.top: userName.bottom
        x: 5
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
            font.family: "Helvetica"
            font.pointSize: 12
            Keys.onReturnPressed: sendMessageToServer()
            Keys.onEnterPressed: sendMessageToServer()
        }
    }
    Pane {
        id: chatTranscriptContainer
        width: root.width
        height: parent.height - 110
        anchors.top: firstRow.bottom
        ScrollView {
            id: chatTranscriptScroll
            anchors.fill: parent
            clip: true
            TextArea {
                id: chatTranscriptText
                readOnly: true
                textFormat: Text.RichText
                wrapMode: TextEdit.Wrap
                color: "darkslateblue"
                font.family: "Helvetica"
                font.pointSize: 12
                padding: 10
            }
        }
    }
}


