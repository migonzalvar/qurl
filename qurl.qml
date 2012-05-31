// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

// http://people.igalia.com/spena/QML-exercise.html

Rectangle {
    id: main
    width: 800
    height: 600

    function refresh() {
        var xhr = new XMLHttpRequest;
        xhr.open("GET", urlTextInput.text);
        xhr.onreadystatechange = function() {
            if (xhr.readyState == XMLHttpRequest.DONE) {
                var a = JSON.parse(xhr.responseText);
                resultText.text = JSON.stringify(a, null, '  ')
            }
        }
        xhr.send();
    }

    Rectangle {
        id: mainBar
        width: main.width
        height: 40
        anchors {
            top: parent.top
            topMargin: 0
            left: parent.left
            leftMargin: 0
        }

        Rectangle {

            x: 10
            y: 10
            width: parent.width-10-20-button.width
            height: 20
            anchors {
                top: parent.top
                topMargin: 10
                left: parent.left
                leftMargin: 10
            }

            border.width: 1

            TextInput {
                id: urlTextInput
                anchors {
                    fill: parent
                    margins: 2
                }
                font.pixelSize: 12
                text: "http://www.meteogalicia.es/meteosix-api/findPlaces?location=santi&API_KEY="
                onAccepted: refresh()
            }
        }

        Rectangle {
            id: button
            color: "red"
            radius: 3
            width: 60
            height: 20
            anchors {
                top: parent.top
                topMargin: 10
                right: parent.right
                rightMargin: 10
            }
            Text {
                id: buttonText
                text: "GO"
                horizontalAlignment: Text.AlignHCenter
                anchors.fill: parent
                MouseArea {
                    id: buttonArea
                    anchors.fill: parent
                    onClicked: refresh()
                }
            }
        }
    }

    Rectangle {
        id: resultRectangle
        width: main.width
        color: "#eee"
        anchors {
            bottom: main.bottom
            bottomMargin: 0
            top: mainBar.bottom
            topMargin: 0
        }

        Text {
            id: resultText

            anchors {
                rightMargin: 10
                leftMargin: 10
                bottomMargin: 10
                topMargin: 10
                fill: parent
            }

            font.pixelSize: 12

            text: ""

        }
    }
}
