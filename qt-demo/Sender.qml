import QtQuick 2.0

Circle {
    id: sendButton
    property int counter: 0
    property Receiver target: null // the Component "receiver"

    // create the signal to be sent to receiver component
    signal send( string value)
    onTargetChanged: send.connect(target.receive)

    MouseArea {
        anchors.fill : parent
        onClicked: {
            counter++
            parent.send(counter)
        }

        onPressed: parent.buttonColor = "yellow"
        onReleased: parent.buttonColor = "orange"

    }

}
