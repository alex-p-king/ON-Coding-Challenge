import QtQuick 2.9
import QtQuick.Dialogs 1.2
import QtQuick.Controls 2.5

Item {
    property alias registerUserDialog: rUser
    Dialog {
        id: rUser
        TextField {
            id: newUserInput
            width: 300
            height: 300
            color: "black"
            placeholderText: "Enter message..."

        }
    }

}
