import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3

/*
    @ registerUserContainer: this is the primary identifier of the RegisterUserMenu component. this component allows the user to
                             graphically change their username and register with the chatserver.
*/

Item {
    id: registerUserMenuContainer

    /*
         @ function changeUser(): changes the username and registers it with the chatserver class
    */
    function changeUser(){
        if(registerUserTextField.text.length > 0 && registerUserTextField.text.length < 31){
            userName.text = registerUserTextField.text
            chatServer.registerClient(userName.text,this)
            popup.close()
        }
        else {
            console.log("new username must be at least 1 character and no more than 30 characters")
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
