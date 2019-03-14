import QtQuick 2.9
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3

Item {
    id: root
    anchors {
        fill: parent
    }
    Rectangle {
        anchors.fill: parent
        color: "tomato"
        opacity: 0.15
    }

    Text {
        id: tempText
        text: "This is where you will implement your chat UI"
        anchors {
            centerIn: root
        }
    }

    Component.onCompleted: chatServer.registerClient();

    // Add your chat transcript box, message input box, and message sending button here
    RowLayout {
        id: firstRow
        anchors.top: parent
        TextInput {
            Layout.preferredWidth: 400
            Layout.fillWidth: true
            height: parent.height
            color: "black"
            text: "this is dummy text"
        }
        Button {
            id: sendButton
            text: "Send"
            Layout.fillWidth: true
        }

    }
    RowLayout {
        anchors.top: firstRow.bottom
        TextArea {
            Layout.preferredWidth: 500
            Layout.fillHeight: true
            wrapMode: TextArea.Wrap
            text:   "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras sollicitudin magna
                    vitae accumsan sollicitudin. Nunc ornare justo eu neque hendrerit dapibus. Duis in justo sed sem
                    commodo aliquam. Quisque rhoncus turpis in tincidunt consectetur. In hac habitasse platea dictumst.
                    s luctus. Suspendisse eu est maximus, pellentesque risus in, sollicitudin justo. Proin pellentesque
                    turpis porta sem auctor volutpat sodales sit amet orci."
        }
    }
}
