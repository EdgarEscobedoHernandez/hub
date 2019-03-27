import QtQuick 2.0
import QtQuick.Layouts 1.12
import QtQuick.Dialogs 1.2

import "../"

Dialog {



    property string icon: "qrc:/src/img/logo/logo.svg"
    property string title: "hub"
    property string description: "Deposita tu hermoso mensaje aquí"
    property int duration: 1000

    contentItem: Rectangle{
        anchors.fill: parent
        id: rootNotification
        radius: res.radius



        GeneralResources{
            id: res
        }

        RowLayout{
            anchors.fill: parent
            anchors.margins: res.margin

            Image{
                Layout.fillHeight: true
                Layout.fillWidth: false
                source: icon
                sourceSize.height: height
                fillMode: Image.PreserveAspectFit
            }

            ColumnLayout{
                Layout.fillWidth: true
                Layout.fillHeight: true
                Text{
                    Layout.fillWidth: true
                    text: title
                }

                Text{
                    width: parent.width
                    text: description
                    elide: Text.ElideLeft
                }
            }
        }



    }

    function show(){
        showAnimation.start()
        timer.start()
    }

    Timer{
        id: timer
        interval: duration
        repeat: false
        triggeredOnStart: false
        onTriggered: hideAnimation.start()
    }



    NumberAnimation{
        onStarted: {
            rootNotification.visible = true
        }

        id: showAnimation
        from: 0
        to: 1
        duration: 150
        target: rootNotification
        properties: "opacity"
    }

    NumberAnimation{
        id: hideAnimation
        from: 1
        to: 0
        duration: 150
        target: rootNotification
        properties: "opacity"
        onStopped: rootNotification.visible = false
    }

}
