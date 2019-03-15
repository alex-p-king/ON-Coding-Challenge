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
    property string mText: ""
    function sendMessage(message) {
        chatTranscriptText.text = chatTranscriptText.text + "\n" + message
    }



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
            signal send(string message)
            onClicked: {
                mText=mTextInput.text
                console.log("the value of mText is: " + mText)
                chatTranscriptText.text = chatTranscriptText.text + "\n" + mText
                mTextInput.text = ""
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


