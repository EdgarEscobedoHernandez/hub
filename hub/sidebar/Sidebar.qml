import QtQuick 2.0
import QtQuick.Layouts 1.12

import "./sidebar_button"
import "../"

Rectangle{

    width: 50

    color: res.color_sidebar
    id: root
    property alias whatsappButton: whatsappButton
    property alias trelloButton: trelloButton
    property alias gmailButton: gmailButton
    property alias gmailButton2: gmailButton2

    property var buttons: [whatsappButton, trelloButton, gmailButton, gmailButton2]

    GeneralResources{
        id: res
    }

    ColumnLayout{
        anchors.fill: parent


        SidebarButton{
            objectName: "1"
            id: whatsappButton
            width: parent.width
            onNewOneSelected: root.newOneSelected(objectName)
        }

        SidebarButton{
            objectName: "2"
            id: trelloButton
            width: parent.width
            onNewOneSelected: root.newOneSelected(objectName)
        }

        SidebarButton{
            objectName: "3"
            id: gmailButton
            width: parent.width
            onNewOneSelected: root.newOneSelected(objectName)
        }

        SidebarButton{
            objectName: "4"
            id: gmailButton2
            width: parent.width
            onNewOneSelected: root.newOneSelected(objectName)
        }


        RowLayout{}
    }


    function newOneSelected(objectName){
        for(var i = 0; i < buttons.length; ++i){
            if(buttons[i].objectName !== objectName){
                buttons[i].selected = false;
            }
        }
    }

}
