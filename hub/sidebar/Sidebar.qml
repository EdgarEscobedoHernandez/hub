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



        RowLayout{}
    }


    function newOneSelected(objectName){
        switch(objectName){
        case "1":
            trelloButton.selected = false; gmailButton.selected = false; break;
        case "2":
            gmailButton.selected = false; whatsappButton.selected = false; break;
        case "3":
            trelloButton.selected = false; whatsappButton.selected = false; break;
        }
    }

}
