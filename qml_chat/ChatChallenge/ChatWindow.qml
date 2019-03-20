import QtQuick 2.9
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.2

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
    property string userColor: "" // used to set the specific color of the chat label
    signal sendMessage(string message) // This signal will be fired by the send button and will be used to update both of the text edits to contain the message

    MenuBar {
        Menu {
            id: menu
            title: qsTr("File")
            Action {text: qsTr("Register User")
                onTriggered: {
                    popup.open()

                }
            }

        }
    }
    Popup {
        id: popup
        width: rUser.implicitWidth + 10
        height: rUser.implicitHeight + 50
        modal: true
        focus: true
        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside
        Row {
            anchors.centerIn: parent
            Button {
                id: newUserButton
                height: rUser.implicitHeight
                width: 50
                text: "Submit"
                onClicked: {
                    if(rUser.text.length){
                        userName.text = rUser.text
                        chatServer.registerClient(userName.text,this)
                        popup.close()
                    }
                    else {
                        console.log("new username must be at least 1 character")
                    }

                }
            }
            TextField {
                id: rUser
                width: 150
                height: 40
                color: "black"
                placeholderText: "Enter a new username"

            }

        }

    }



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
                chatServer.sendMessage(mText, mUser, userColor)

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
                color: "blue"

            }
        }

    }

}


