import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.5
import QtQuick.Window 2.12

import "./sidebar"
import "./webview"
import "./trayicon"
import "./notifications"

import hub.services 1.0

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
        id: trayIcon
    }

    RowLayout{
        anchors.fill: parent
        spacing: 0

        Sidebar{
            id: sidebar
            Layout.fillHeight: true
        }

        WebView{
            serviceType: Services.WHATSAPP
            Layout.fillWidth: true
            Layout.fillHeight: true
            button: sidebar.whatsappButton
            visible: sidebar.whatsappButton.selected
            objectName: "1"
            Component.onCompleted: loadURL("https://web.whatsapp.com")
            onPossibleNotification: root.possibleNotification(service)
        }

        WebView{            
            serviceType: Services.TRELLO
            Layout.fillWidth: true
            Layout.fillHeight: true
            button: sidebar.trelloButton
            visible: sidebar.trelloButton.selected
            objectName: "2"
            Component.onCompleted: loadURL("https://www.trello.com")
            onPossibleNotification: root.possibleNotification(service)
        }

        WebView{
            serviceType: Services.GMAIL
            Layout.fillWidth: true            
            Layout.fillHeight: true
            button: sidebar.gmailButton
            visible: sidebar.gmailButton.selected
            objectName: "3"
            Component.onCompleted: loadURL("https://www.gmail.com")
            onPossibleNotification: root.possibleNotification(service)
        }

        WebView{
            serviceType: Services.GMAIL
            Layout.fillWidth: true
            Layout.fillHeight: true
            button: sidebar.gmailButton2
            visible: sidebar.gmailButton2.selected
            objectName: "4"
            Component.onCompleted: loadURL("https://www.gmail.com")
            onPossibleNotification: root.possibleNotification(service)
        }
    }

    Component.onCompleted: {
        sidebar.whatsappButton.selected = true
    }

    GeneralResources{
        id: res
    }

    //Funcion para las notificaciones
    function possibleNotification(service){

        //Si la ventana tiene la atención actualmente entonces no se muestra ningún mensaje
        if(root.active){
            return
        }

        trayIcon.iconSource = "qrc:/src/img/logo/tray-icon-notify.svg"
    }

    onVisibilityChanged: {
        if(visible){
            trayIcon.iconSource = "qrc:/src/img/logo/tray-icon.svg"
        }
    }
}
