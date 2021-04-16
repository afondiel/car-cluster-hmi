import QtQuick 2.0
import QtQuick.Window 2.0

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello world")

    Background {
        id: background
        anchors.fill: parent
        target: sender

        Sender {
            id: sender
            x: 38
            y: 124
            displayText: "Sender"
            buttonColor: "#1677f1"
            target: receiver
        }

        Receiver {
            id: receiver
            x: 384
            y: 124
            displayText: "Receiver"
            buttonColor: "#dd4040"
            width: sender.width

        }
    }
}

/*##^##
Designer {
    D{i:1;anchors_x:162;anchors_y:66}
}
##^##*/
