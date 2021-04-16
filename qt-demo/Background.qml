import QtQuick 2.4

BackgroundForm {
    property Circle target: null
    focus: true

    Keys.onPressed:{
        if(event.key == Qt.Key_Plus) target.width = target.width + 10
        if(event.key == Qt.Key_Minus) target.width = target.with - 10

    }

    Rectangle {
        id: rectangle
        color: "#c2f5cb"
        anchors.fill: parent
    }


}
