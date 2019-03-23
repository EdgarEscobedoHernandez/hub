import QtQuick 2.0
import QtQuick.Controls 2.5

import "../../"

Rectangle {
    id: root
    width: 65
    height: width

    property bool selected: false
    property string icon: "qrc:/src/img/logo/logo"
    objectName: "-1"

    GeneralResources{
        id: res
    }

    color: selected ? res.color_sidebarSecondary : "transparent"
    border.width: 0

    Rectangle{
        id: innerRectangle

        anchors.fill: parent
        anchors.margins: res.margin
        radius: res.radius
        color: selected ? res.color_buttonSelected : res.color_sidebarSecondary

        Image{
            anchors.fill: parent
            anchors.margins: res.margin_icon
            fillMode: Image.PreserveAspectFit
            sourceSize.width: width
            sourceSize.height: height
            source: icon
        }

        Behavior on color{
            ColorAnimation {
                property: "color"
                duration: 250
            }
        }
    }

    MouseArea{
        anchors.fill: parent
        hoverEnabled: true

        onEntered: {
            cursorShape = Qt.PointingHandCursor
        }

        onExited: {
            cursorShape = Qt.ArrowCursor
        }

        onClicked: {
            selected = true
            newOneSelected(root.objectName)
        }
    }

    Behavior on color{
        ColorAnimation {
            property: "color"
            duration: 250
        }
    }

    //This signal will be use to handle exclusion between buttons
    signal newOneSelected(string objectName)
}
