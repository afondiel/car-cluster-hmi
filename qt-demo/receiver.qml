import QtQuick 2.0

//The Component where the signal coming from
Circle {
    id: receiveButton

    function receive(value){
        displayText = value
        clicknotify.running = true
    }

    SequentialAnimation on buttonColor {
        id : clicknotify
        running: false

        ColorAnimation {
            from: "green"
            to: "red"
            duration: 250 // ms
        }
        ColorAnimation {
            from: "red"
            to: "green"
            duration: 250 // ms
        }

    }

}
