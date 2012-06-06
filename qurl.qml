// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import QtDesktop 0.1

// http://people.igalia.com/spena/QML-exercise.html
// http://www.meteogalicia.es/meteosix-api/findPlaces?location=santi&API_KEY=

Rectangle {
    id: main
    width: 600
    height: 480

    function refresh() {
        var xhr = new XMLHttpRequest;
        console.debug(combo.selectedText, urlTextInput.text)
        xhr.open(combo.selectedText, urlTextInput.text);
        xhr.onreadystatechange = function() {
            if (xhr.readyState == XMLHttpRequest.DONE) {
                var a = JSON.parse(xhr.responseText);
                resultText.text = JSON.stringify(a, null, '  ')
            }
        }
        xhr.send();
    }

    ListModel {
        id: choices
        ListElement { text: "GET" }
        ListElement { text: "POST" }
    }

    Rectangle {
        id: mainBar
        width: main.width
        height: 50
        anchors {
            top: parent.top
            topMargin: 0
            left: parent.left
            leftMargin: 0
        }

        Row {
            spacing: 10
            anchors {
                topMargin: 10; rightMargin: 10; bottomMargin: 10; leftMargin: 10
                fill: parent
            }

            TextField {
                id: urlTextInput
                width: mainBar.width-10-20-button.width-20-combo.width
                placeholderText: "The URL goes here"

                Keys.onReturnPressed: refresh()
            }

            ComboBox {
                id: combo;
                model: choices;
                width: 60
            }


            Button {
                id: button
                width: 60
                text: "GO"

                onClicked: refresh()
            }
        }
    }

    Rectangle {
        id: resultRectangle
        width: main.width
        anchors {
            top: mainBar.bottom; topMargin: 0
            bottom: main.bottom; bottomMargin: 0
        }

        TextArea {
            id: resultText
            readOnly: true
            wrapMode: TextEdit.WrapAnywhere
            anchors {
                topMargin: 0; rightMargin: 10; bottomMargin: 10; leftMargin: 10
                fill: parent
            }
            text: ""
        }
    }
}
