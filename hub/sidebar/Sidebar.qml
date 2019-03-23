import QtQuick 2.0
import QtQuick.Layouts 1.12

import "./sidebar_button"
import "../"

Rectangle{

    width: 50

    color: res.color_sidebar

    property alias button: button

    GeneralResources{
        id: res
    }

    ColumnLayout{
        anchors.fill: parent


        SidebarButton{
            id: button
            width: parent.width
        }

        RowLayout{}
    }

}
