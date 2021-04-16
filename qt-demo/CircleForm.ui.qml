import QtQuick 2.4

Item {
    width: 200
    height: 200
    property alias buttonColor: button.color
    property alias displayText: display.text

    Rectangle {
        id: button
        color: "#7edd40"
        radius: width * 0.5
        anchors.fill: parent

        Text {
            id: display
            x: 60
            y: 77
            width: 80
            height: 46
            text: "Text"
            font.bold: true
            font.family: "Tahoma"
            font.pixelSize: 30
        }
    }
}

/*##^##
Designer {
    D{i:1;anchors_height:200;anchors_width:200;anchors_x:91;anchors_y:74}
}
##^##*/

