import QtQuick 2.9
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.2

Item {
    id: registerUserMenuRoot
    /*
        @ function changeUser(): changes the username and registers it with the chatserver class
    */
    function changeUser(){
        if(registerUserTextField.text.length){
            userName.text = registerUserTextField.text
            chatServer.registerClient(userName.text,this)
            popup.close()
        }
        else {
            console.log("new username must be at least 1 character")
        }
    }
    MenuBar {
        Menu {
            id: menu
            title: qsTr("File")
            Action
            {text: qsTr("Register User")
                onTriggered: {
                    popup.open()
                }
            }
        }
    }
    Popup {
        id: popup
        width: 400
        height: 50
        modal: true
        focus: true
        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside
        Row {
            width: popup.width
            height: popup.height
            anchors.centerIn: parent
            Button {
                id: newUserButton
                height: 50
                width: 100
                text: "Submit"
                onClicked: {
                    changeUser()
                }
            }
            TextField {
                id: registerUserTextField
                width: 300
                height: 50
                text: ""
                color: "black"
                placeholderText: "Enter a new username"
                focus: true
            }
        }
    }
}