// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

// http://people.igalia.com/spena/QML-exercise.html

Rectangle {
    id: main
    width: 800
    height: 600


    Rectangle {
        id: mainBar
        width: main.width
        height: 40
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0

        Rectangle {

            x: 10
            y: 10
            width: parent.width-10-20-button.width
            height: 20

            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.top: parent.top
            anchors.topMargin: 10

            border.width: 1

            TextInput {
                id: urlTextInput
                anchors.fill: parent
                anchors.margins: 2
                font.pixelSize: 12
                text: "http://www.meteogalicia.es/meteosix-api/findPlaces?location=santi&API_KEY="
            }
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
                text: "GO"
                horizontalAlignment: Text.AlignHCenter
                anchors.fill: parent
                MouseArea {
                    id: buttonArea
                    anchors.fill: parent
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

            anchors.rightMargin: 10
            anchors.leftMargin: 10
            anchors.bottomMargin: 10
            anchors.topMargin: 10
            anchors.fill: parent

            font.pixelSize: 12

            text: ""

        }
    }
}
