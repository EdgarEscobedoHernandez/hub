import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.5

import "./sidebar"
import "./webview"
import "./trayicon"

ApplicationWindow {
    id: root
    visible: true
    width: 640
    height: 480
    title: qsTr("hub")



    menuBar: MenuBar{
        Menu{
            title: qsTr("Window")
            Action{
                text: qsTr("Minimize")
                shortcut: "Ctrl+M"
                onTriggered: {
                    root.showMinimized()
                }
            }
        }
    }

    TrayIcon
    {

    }

    RowLayout{
        anchors.fill: parent
        spacing: 0

        Sidebar{
            id: sidebar
            Layout.fillHeight: true
        }

        WebView{
            webEngineView.url: "https://web.whatsapp.com"
            Layout.fillWidth: true
            Layout.fillHeight: true
            button: sidebar.whatsappButton
            visible: sidebar.whatsappButton.selected
        }

        WebView{
            webEngineView.url: "https://www.trello.com"
            Layout.fillWidth: true
            Layout.fillHeight: true
            button: sidebar.trelloButton
            visible: sidebar.trelloButton.selected
        }

        WebView{
            webEngineView.url: "https://www.gmail.com"
            Layout.fillWidth: true
            Layout.fillHeight: true
            button: sidebar.gmailButton
            visible: sidebar.gmailButton.selected
        }

        WebView{
            webEngineView.url: "https://www.gmail.com"
            Layout.fillWidth: true
            Layout.fillHeight: true
            button: sidebar.gmailButton2
            visible: sidebar.gmailButton2.selected
        }
    }

    Component.onCompleted: {
        sidebar.whatsappButton.selected = true
    }

    GeneralResources{
        id: res
    }



}
