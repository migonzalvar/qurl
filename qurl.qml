// qurl.qml - URL viewer
//
// Written in 2012 by Miguel González <migonzalvar@gmail.com>
//
// To the extent possible under law, the author(s) have dedicated all
// copyright and related and neighboring rights to this software to the
// public domain worldwide. This software is distributed without any
// warranty.
//
// You should have received a copy of the CC0 Public Domain Dedication along
// with this software. If not, see human-readable summary of the Legal Code
// in <http://creativecommons.org/publicdomain/zero/1.0/>.

import QtQuick 1.1
import QtDesktop 0.1


Rectangle {
    id: main
    width: 600
    height: 480

    property bool loading: false

    function refresh() {
        var xhr = new XMLHttpRequest;
        loading = true
        console.debug(combo.selectedText, urlTextInput.text)
        xhr.open(combo.selectedText, urlTextInput.text);
        xhr.onreadystatechange = function() {
            if (xhr.status == 200) {
                if (xhr.readyState === XMLHttpRequest.DONE) {
                    try {
                        var a = JSON.parse(xhr.responseText);
                        resultText.text = JSON.stringify(a, null, '  ');
                    } catch (e) {
                        resultText.text = ("Parsing errors"
                                + '\n---- Raw reponse ----\n'
                                + xhr.responseText)
                    }
                }
            }
            else
            {
                var headers =  xhr.getAllResponseHeaders() ? xhr.getAllResponseHeaders(): "No response";
                resultText.text = ('Network errors (Error '
                                   + xhr.status.toString() + ')'
                                   + '\n---- Headers ----\n'
                                   + headers)
            }
            loading = false
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

    ProgressBar {
        width: parent.width
        height: 6
        indeterminate: true
        visible: loading
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
