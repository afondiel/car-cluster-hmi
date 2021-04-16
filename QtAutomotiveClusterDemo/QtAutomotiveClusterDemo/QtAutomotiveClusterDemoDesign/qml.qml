/****************************************************************************
**
** Copyright (C) 2013 Digia Plc and/or its subsidiary(-ies).
** Contact: http://www.qt-project.org/legal
**
** This file is part of the examples of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:BSD$
** You may use this file under the terms of the BSD license as follows:
**
** "Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are
** met:
**   * Redistributions of source code must retain the above copyright
**     notice, this list of conditions and the following disclaimer.
**   * Redistributions in binary form must reproduce the above copyright
**     notice, this list of conditions and the following disclaimer in
**     the documentation and/or other materials provided with the
**     distribution.
**   * Neither the name of Digia Plc and its Subsidiary(-ies) nor the names
**     of its contributors may be used to endorse or promote products derived
**     from this software without specific prior written permission.
**
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
**
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick 1.1

Rectangle {

    // parent rectangle
    id: rectangle1
    property  bool startFlag: false
    property real dialOpacity : 0
    property real  rpmValue: 0
    property real  speedValue: 0
    property int  gear: 0
    property int fuelValue: 30

    property bool turn_rightFlag: false
    property bool turn_leftFlag: false
    property bool beamFlag: false
    property bool oilFlag: false
    property bool batteryFlag: false
    property bool fuelFlag: false
    property bool parkingFlag: false
    property bool brakeFlag: false


    x: 0
    y: 0
    width: 800
    height: 480
    radius: 0
    gradient: Gradient {
        GradientStop {
            position: 0.675
            color: "#0a0404"
        }

        GradientStop {
            position: 0.888
            color: "#000000"
        }

        GradientStop {
            position: 0.954
            color: "#1acb81"
        }

    }
    visible: true
    border.width: 0
    border.color: "#130101"
    z: 2

    // start dial glowing effect
    ParallelAnimation{
        id: dialEffectStart
        running: false
        NumberAnimation{target: speed_active; property:  "opacity"; to: 1.0; duration: 1000}
        NumberAnimation{target: rpm_active; property:  "opacity"; to: 1.0; duration: 1000}
        NumberAnimation{target: totalDistance; property: "opacity"; to: 1.0; duration: 1000}
        NumberAnimation{target: digitRectangle; property: "opacity"; to: 1.0; duration: 1000}
        NumberAnimation{target: line; property: "opacity"; to: 1.0; duration: 1000}

        NumberAnimation{target: totalDistance; property: "x"; to: 27; duration: 800}
        NumberAnimation{target: totalDistance; property: "y"; to: 400; duration: 800}
        NumberAnimation{target: destination; property: "opacity"; to: 1.0; duration: 1000}
        NumberAnimation{target: destination; property: "x"; to: 200; duration: 800}
        NumberAnimation{target: destination; property: "y"; to: 400; duration: 800}
        NumberAnimation{target: time; property: "opacity"; to: 1.0; duration: 1000}
        NumberAnimation{target: time; property: "x"; to: 400; duration: 800}
        NumberAnimation{target: time; property: "y"; to: 400; duration: 800}
        NumberAnimation{target: date; property: "opacity"; to: 1.0; duration: 1000}
        NumberAnimation{target: date; property: "x"; to: 600; duration: 800}
        NumberAnimation{target: date; property: "y"; to: 400; duration: 800}
        NumberAnimation{target: turn_left; property: "opacity"; to: 0.1; duration: 800}
        NumberAnimation{target: turn_right; property: "opacity"; to: 0.1; duration: 800}

    }

    // decrease active effect of dial
    ParallelAnimation{
        id: dialEffectStop
        running: false
        NumberAnimation{target: speed_active; property:  "opacity"; to: 0; duration: 1500}
        NumberAnimation{target: rpm_active; property:  "opacity"; to: 0; duration: 1500}
        NumberAnimation{target: totalDistance; property: "opacity"; to: 0; duration: 100}
        NumberAnimation{target: digitRectangle; property: "opacity"; to: 0; duration: 1000}
        NumberAnimation{target: line; property: "opacity"; to: 0; duration: 1000}

        NumberAnimation{target: totalDistance; property: "x"; to: 363; duration: 200}
        NumberAnimation{target: totalDistance; property: "y"; to: 131; duration: 200}
        NumberAnimation{target: destination; property: "opacity"; to: 0; duration: 100}
        NumberAnimation{target: destination; property: "x"; to: 363; duration: 200}
        NumberAnimation{target: destination; property: "y"; to: 131; duration: 200}
        NumberAnimation{target: time; property: "opacity"; to: 0; duration: 100}
        NumberAnimation{target: time; property: "x"; to: 363; duration: 200}
        NumberAnimation{target: time; property: "y"; to: 131; duration: 200}
        NumberAnimation{target: date; property: "opacity"; to: 0; duration: 100}
        NumberAnimation{target: date; property: "x"; to: 363; duration: 200}
        NumberAnimation{target: date; property: "y"; to: 131; duration: 200}
        NumberAnimation{target: turn_left; property: "opacity"; to: 1; duration: 800}
        NumberAnimation{target: turn_right; property: "opacity"; to: 1; duration: 800}

    }
    // decrease all indicators opacity
    SequentialAnimation{
        id: indicatorAnimatedDim
        running: false
        NumberAnimation{ target:straightBeam; property: "opacity"; to: 0.2; duration: 100}
        NumberAnimation{ target:oilIndication; property: "opacity"; to: 0.2; duration: 100}
        NumberAnimation{ target:battery_low; property: "opacity"; to: 0.2; duration: 100 }
        NumberAnimation{ target:petrol_indicator; property: "opacity"; to: 0.2; duration: 100 }
        NumberAnimation{ target:parkingLight; property: "opacity"; to: 0.2; duration: 100 }
        NumberAnimation{ target:brakeDamage; property: "opacity"; to: 0.2; duration: 100 }

    }
    //increase all indicator opacity
    SequentialAnimation{
        id: indicatorAnimateFocus
        running: false
        NumberAnimation{ target:straightBeam; property: "opacity"; to: 1; duration: 100}
        NumberAnimation{ target:oilIndication; property: "opacity"; to: 1; duration: 100}
        NumberAnimation{ target:battery_low; property: "opacity"; to: 1; duration: 100 }
        NumberAnimation{ target:petrol_indicator; property: "opacity"; to: 1; duration: 100 }
        NumberAnimation{ target:parkingLight; property: "opacity"; to: 1; duration: 100 }
        NumberAnimation{ target:brakeDamage; property: "opacity"; to: 1; duration: 100 }

    }


    //feed dummy data for indication and warning message
    SequentialAnimation{
        id: dummyAnimation
        running: false
        NumberAnimation{ target:straightBeam; property: "opacity"; to: 0.9; duration: 100}
        NumberAnimation{ target:straightBeam; property: "opacity"; to: 1; duration: 6000}
        NumberAnimation{ target:straightBeam; property: "opacity"; to: 0.2; duration: 100}

        NumberAnimation{ target:oilIndication; property: "opacity"; to: 0.9; duration: 100}
        NumberAnimation{ target:oil; property: "visible"; to: 1; duration: 100}
        NumberAnimation{ target:oil; property: "x"; to: 310; duration: 300}
        NumberAnimation{ target:oilIndication; property: "opacity"; to: 1; duration: 6000}
        NumberAnimation{ target:oil; property: "visible"; to: 0; duration: 100}
        NumberAnimation{ target:oilIndication; property: "opacity"; to: 0.2; duration: 100}
        NumberAnimation{ target:oil; property: "visible"; to: 0; duration: 100}
        NumberAnimation{ target:oil; property: "x"; to: -150; duration: 3000}

        NumberAnimation{ target:battery_low; property: "opacity"; to: 0.9; duration: 100}
        NumberAnimation{ target:battery; property: "visible"; to: 1; duration: 100}
        NumberAnimation{ target:battery; property: "x"; to: 335; duration: 300}
        NumberAnimation{ target:battery_low; property: "opacity"; to: 1; duration: 6000}
        NumberAnimation{ target:battery_low; property: "opacity"; to: 0.2; duration: 100}
        NumberAnimation{ target:battery; property: "visible"; to: 0; duration: 100}
        NumberAnimation{ target:battery; property: "x"; to: -150; duration: 3000}

        NumberAnimation{ target:petrol_indicator; property: "opacity"; to: 0.9; duration: 100 }
        NumberAnimation{ target:fuelLeak; property: "visible"; to: 1; duration: 100}
        NumberAnimation{ target:fuelLeak; property: "x"; to: 305; duration: 300}
        NumberAnimation{ target:petrol_indicator; property: "opacity"; to: 0.9; duration: 6000 }
        NumberAnimation{ target:petrol_indicator; property: "opacity"; to: 0.2; duration: 100 }
        NumberAnimation{ target:fuelLeak; property: "visible"; to: 0; duration: 100}
        NumberAnimation{ target:fuelLeak; property: "x"; to: -150; duration: 3000}

        NumberAnimation{ target:parkingLight; property: "opacity"; to: 0.9; duration: 100 }
        NumberAnimation{ target:parkingLight; property: "opacity"; to: 1; duration: 3000 }
        NumberAnimation{ target:parkingLight; property: "opacity"; to: 0.2; duration: 100 }


        NumberAnimation{ target:brakeDamage; property: "opacity"; to: 0.9; duration: 100 }
        NumberAnimation{ target:brake; property: "visible"; to: 1; duration: 100}
        NumberAnimation{ target:brake; property: "x"; to: 330; duration: 300}
        NumberAnimation{ target:brakeDamage; property: "opacity"; to: 1; duration: 6000 }
        NumberAnimation{ target:brakeDamage; property: "opacity"; to: 0.2; duration: 100 }
        NumberAnimation{ target:brake; property: "visible"; to: 0; duration: 100}
        NumberAnimation{ target:brake; property: "x"; to: -150; duration: 3000}


    }


    // left turn indicator on with opacity control
    SequentialAnimation{
        id: leftIndicatorOn
        running: false
        NumberAnimation{target: turn_left; property: "opacity"; to: 1; duration: 150}
    }
    SequentialAnimation{
        id: leftIndicatorOff
        running: false
        NumberAnimation{target: turn_left; property: "opacity"; to: 0.1; duration: 150}
    }

    // right turn indicator on with opacity control
    SequentialAnimation{
        id: rightIndicatorOn
        running: false
        NumberAnimation{target: turn_right; property: "opacity"; to: 1; duration: 150}
    }
    SequentialAnimation{
        id: rightIndicatorOff
        running: false
        NumberAnimation{target: turn_right; property: "opacity"; to: 0.1; duration: 150}
    }

    // feed dummy data to speedometer and rpm meter
    function rpmSpeedMeter()
    {
        rpm_dial.value = rpmValue
        speed_dial.value = speedValue
        if(gear == 0){
        rpmValue = rpmValue + 5
        speedValue = speedValue + 2
            gear = 1
        }
        else if(gear == 1){
            if(rpmValue > 60)
            {
                rpmValue = 30;
                speedValue = speedValue - 5
                gear = 2
            }
            rpmValue = rpmValue + 2.5
            speedValue = speedValue + 1.5


        }
        else if(gear == 2){
            if(rpmValue > 70)
            {
                rpmValue = 50;
                speedValue = speedValue - 4
                gear = 3
            }
            rpmValue = rpmValue + 2
            speedValue = speedValue + 1


        }
        else if(gear == 3){
            if(rpmValue > 80)
            {
                rpmValue = 60;
                speedValue = speedValue - 3
                indicatorflash.running = true
                gear = 4
            }
            rpmValue = rpmValue + 1.5
            speedValue = speedValue + 0.5


        }
        else if(gear == 4){
            if(rpmValue > 90)
            {
                rpmValue = 70;
                speedValue = speedValue - 1
                gear = 4
            }
            rpmValue = rpmValue + 1
            speedValue = speedValue + 0.3


        }
        if(speedValue >100)
        {
            rpmValue = speedValue = gear = 0
        }
    }

    Timer{
        id:rpmAndspeedUpdate
        interval: 200
        running: false
        repeat: true
        onTriggered: {
            rpmSpeedMeter()
        }
    }


    Timer{
        id: leftTurn
        interval: 300
        running: false
        repeat: true
        onTriggered: {
            if(turn_leftFlag ==  false){
            leftIndicatorOn.start()}
            if(turn_leftFlag == true){
                leftIndicatorOff.start()}
            turn_leftFlag = !turn_leftFlag
        }

    }


    Timer{
        id: rightTurn
        interval: 300
        running: false
        repeat: true
        onTriggered: {
            if(turn_rightFlag ==  false){
            rightIndicatorOn.start()}
            if(turn_rightFlag == true){
                rightIndicatorOff.start()}
            turn_rightFlag = !turn_rightFlag
        }

    }

    // rpm dial object from RpmDial qml
    RpmDial  {
        id: rpm_dial
        x: 43
        y: 98
        visible: true
        z: 7
        opacity: 1
        anchors.verticalCenterOffset: 8
        anchors.horizontalCenterOffset: -207
        anchors.centerIn: parent
       // value: slider.x * 100 / (container.width - 34)

        Image {
            id: rpmOverlay
            x: 123
            y: 129
            z: 7
            opacity: 1
            source: "pics/overlay_active.png"
        }
   }

    // speed dial import from speedDial qml
    SpeedDial  {
        id: speed_dial
        x: 477
        y: 86
        value: 0
        z: 7
        opacity: 1
        anchors.verticalCenterOffset: -4
        anchors.horizontalCenterOffset: 227
        anchors.centerIn: parent
        //value: slider.x * 100 / (container.width - 34)
        //value: 50

        Image {
            id: speedOverlay
            x: 123
            y: 137
            z: 7
            opacity: 1
            source: "pics/overlay_active.png"
        }
    }

     // Fuel meter indicator from FuelMeter qml
    FuelMeter {
        id: fuelMeter1
        x: 321
        y: 110
        smooth: true
        value: fuelValue
        Timer{
            id:f_meter
            interval: 7000
            running: true
            repeat: true
            onTriggered: {
                     if(fuelValue > 59){fuelValue = 1}
                     if(fuelValue > 0 ){
                     fuelValue = fuelValue - 1
                     fuelMeter1.value = fuelValue}

            }
        }
    }
    // engine start and stop button with flipable property
    Flipable {
         id: flipable
         width: 50
         height: 64
         z: 7

         property bool flipped: false
         x: 375
         y: 311

         front: Image { source: "pics/Engine_start_stop_inactive.png"; anchors.centerIn: parent }
         back: Image { source: "pics/Engine_start_stop_active.png"; anchors.centerIn: parent }

         transform: Rotation {
             id: rotation
             origin.x: flipable.width/2
             origin.y: flipable.height/2
             axis.x: 0; axis.y: 1; axis.z: 0     // set axis.y to 1 to rotate around y-axis
             angle: 0    // the default angle
         }

         states: State {
             name: "back"
             PropertyChanges { target: rotation; angle: 180}
             when: flipable.flipped;
         }

         transitions: Transition {
             NumberAnimation { target: rotation; property: "angle"; duration: 4 }
         }

         MouseArea {
             anchors.rightMargin: -2
             anchors.bottomMargin: 0
             anchors.leftMargin: 2
             anchors.topMargin: 0
             anchors.fill: parent
             onClicked:{ flipable.flipped = !flipable.flipped
                 startFlag = !startFlag
                 if(startFlag == true)
                 {
                     indicatorAnimateFocus.stop()               // stop indicator animation
                     dialEffectStop.stop()                      // stop dial animation
                     dialEffectStart.start()                    // start dial effect animation
                     indicatorAnimatedDim.start()               // startindictor effect animation
                     rpmAndspeedUpdate.running = true           // start rpmAndspeedUpdate timer
                     digitalSpeedUpdate.running = true          // start digitalSpeedUpdate timer
                     dummyAnimation.start()
                 }
                 if(startFlag == false)
                 {
                     dialEffectStart.stop()                     // stop dial effect animation
                     indicatorAnimatedDim.stop()                // stop indicator animation
                     indicatorAnimateFocus.start()              // start indicator focus annimation
                     dialEffectStop.start()                     // start dial effect stop animation
                     rpmAndspeedUpdate.running = false
                     digitalSpeedUpdate.running = true
                     dummyAnimation.stop()
                      leftTurn.running = false
                     rightTurn.running = false
                     rpm_dial.value = 0
                     speed_dial.value = 0
                     rpmValue = 0
                     speedValue = 0
                     oil.visible = 0
                     fuelLeak.visible = 0
                     brake.visible = 0
                     battery.visible = 0
                 }

                rpmOverlay.visible = startFlag
                 speedOverlay.visible = startFlag
             }
         }
     }

    Image {
         id: rpm_active
         x: 22
         y: 79
         z: 11
         opacity: 0
         visible: true
         source: "pics/rpm_active.png"
     }

    Image {
         id: speed_active
         x: 457
         y: 75
         z: 12
         opacity: 0
         visible: true
         source: "pics/speed_active1.png"
     }
    Image {
        id: turn_left
        x: 335
        y: 208
        smooth: true
        z: 6
        source: "pics/turn_indicator_left.png"
    }

    Image {
        id: turn_right
        x: 419
        y: 208
        smooth: true
        z: 6
        source: "pics/turn_indicator.png"
    }

    Image {
        id: petrol_indicator
        x: 682
        y: 33
        z: 5
        scale: 0.4
        source: "pics/petrol.png"
    }

    Image {
        id: parkingLight
        x: 629
        y: 27
        z: 5
        source: "pics/parkingLight.png"
    }

    Image {
        id: straightBeam
        x: 112
        y: 27
        z: 5
        source: "pics/High_Beam_Indicator.png"
    }

    Image {
        id: brakeDamage
        x: 737
        y: 126
        z: 5
        source: "pics/Brake_failure.png"
    }

    Image {
        id: battery_low
        x: 53
        y: 65
        scale: 0.8
        rotation: 90
        z: 9
        source: "pics/battery_low1.png"
    }

    Image {
        id: oilIndication
        x: 0
        y: 142
        z: 5
        source: "pics/oilIndicator.png"
    }
    Image {
        id: line
        x: -49
        y: 20
        visible: true
        opacity: 0
        source: "pics/dropDown.png"
    }

     Text {
         id: totalDistance
         x: 363
         y: 131
         color: "#a5bcc6"
         text: "Distance: 5000"
         smooth: true
         opacity: 0
         style: Text.Raised
         font.bold: true
         z: 10
         font.pixelSize: 15
     }

     Text {
         id: destination
         x: 363
         y: 131
         color: "#a5bcc6"
         text: "Destination: 51 Street"
         smooth: true
         opacity: 0
         style: Text.Raised
         font.pixelSize: 15
         font.bold: true
         z: 10
     }

     Text {
         id: time
         x: 363
         y: 131
         color: "#a5bcc6"
         text: "Time: 12:45:07"
         smooth: true
         opacity: 0
         style: Text.Raised
         font.pixelSize: 15
         font.bold: true
         z: 10
     }

     Text {
         id: date
         x: 363
         y: 131
         color: "#a5bcc6"
         text: " Date: 28:02:2017"
         smooth: true
         opacity: 0
         style: Text.Raised
         font.pixelSize: 15
         font.bold: true
         z: 10
     }
     Text {
         id: oil
         x: -178
         y: 0
         color: "#e61414"
         text: "Engine Oil Low Level"
         smooth: true
         font.bold: true
         verticalAlignment: Text.AlignVCenter
         horizontalAlignment: Text.AlignHCenter
         visible: false
         font.pixelSize: 15
     }

     Text {
         id: brake
         x: -178
         y: 0
         color: "#f52323"
         text: "Brake Pad Warning"
         font.bold: true
         horizontalAlignment: Text.AlignHCenter
         verticalAlignment: Text.AlignVCenter
         visible: false
         font.pixelSize: 15
     }

     Text {
         id: fuelLeak
         x: -178
         y: 0
         color: "#c70a0a"
         text: "Fuel Tank Leakage Warning"
         smooth: true
         font.bold: true
         verticalAlignment: Text.AlignVCenter
         horizontalAlignment: Text.AlignHCenter
         visible: false
         font.pixelSize: 15
     }

     Text {
         id: battery
         x: -178
         y: 0
         color: "#f21616"
         text: "Battery Low"
         smooth: true
         font.bold: true
         verticalAlignment: Text.AlignVCenter
         horizontalAlignment: Text.AlignHCenter
         visible: false
         font.pixelSize: 15
     }




     MouseArea {
         id: right
         x: 758
         y: 187
         width: 42
         height: 262
         onClicked:{

             leftTurn.running = false
             leftIndicatorOff.start()
             rightTurn.running = true
     }
     }

     MouseArea {
         id: left
         x: 0
         y: 208
         width: 39
         height: 249
         onClicked: {
             rightTurn.running = false
             rightIndicatorOff.start()
             leftTurn.running = true
     }
}



Rectangle {
    id: digitRectangle
    x: 315
    y: 80
    width: 162
    height: 30
    color: "#00000000"
    radius: 25
    smooth: true
    opacity: 0
    border.color: "#ebe6e6"
    border.width: 3

    Text {
        id: digitalSpeed
        y: -1
        color: "#03bee7"
        text: speedValue
        smooth: true
        anchors.left: parent.left
        anchors.leftMargin: 15
        z: 11
        opacity: 1
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.family: "Verdana"
        style: Text.Sunken
        font.bold: false
        font.pixelSize: 25
        Timer{
            id:digitalSpeedUpdate
            interval: 200
            running: false
            repeat: true
            onTriggered: {
                digitalSpeed.text = (speedValue + (2 * speedValue/10)).toFixed(1)
            }

        }
    }

    Text {
        id: speedUnit
        x: 82
        y: 1
        color: "#04b4db"
        text: "Km/h"
        smooth: true
        anchors.right: parent.right
        anchors.rightMargin: 20
        z: 9
        opacity: 1
        font.bold: false
        style: Text.Sunken
        font.family: "Arial"
        font.pixelSize: 25
    }
}

}

