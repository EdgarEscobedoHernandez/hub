import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Layouts 1.12

import "./sidebar"
import "./webview"

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")


    RowLayout{
        anchors.fill: parent
        spacing: 0
        Sidebar{
            id: sidebar
            Layout.fillHeight: true
        }

        WebView{
            Layout.fillWidth: true
            Layout.fillHeight: true

            button: sidebar.button
        }
    }

    GeneralResources{
        id: res
    }

}
