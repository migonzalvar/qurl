// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

// http://people.igalia.com/spena/QML-exercise.html

Rectangle {
    id: main
    width: 360
    height: 360

    Rectangle {
        id: mainBar
        width: main.width
        height: 40
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0

        TextInput {
            id: urlTextInput
            width: parent.width-10-10-button.width
            height: 20
            text: qsTr("URL")
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.top: parent.top
            anchors.topMargin: 10
            font.pixelSize: 12
        }

        Rectangle {
            id: button
            color: "red"
            radius: 3
            width: 60
            height: 20
            anchors.top: parent.top
            anchors.topMargin: 10
            anchors.right: parent.right
            anchors.rightMargin: 10
            Text {
                id: buttonText
                text: "Buscar"
                horizontalAlignment: Text.AlignHCenter
                anchors.fill: parent
                MouseArea {
                    id: buttonArea
                    anchors.fill: parent
                    onClicked: console.log("clicky")//page.state = ' '
                    }
                }
            }
        }

    Rectangle {
        id: resultRectangle
        width: main.width
        color: "#eee"
        anchors.bottom: main.bottom
        anchors.bottomMargin: 0
        anchors.top: mainBar.bottom
        anchors.topMargin: 0

        Text {
            id: resultText
            text: qsTr("text")
            anchors.rightMargin: 10
            anchors.leftMargin: 10
            anchors.bottomMargin: 10
            anchors.topMargin: 10
            anchors.fill: parent
            font.pixelSize: 12
        }

    }
}
