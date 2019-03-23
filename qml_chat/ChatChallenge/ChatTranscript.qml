import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.5


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
