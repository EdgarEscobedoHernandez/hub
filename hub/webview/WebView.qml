import QtQuick 2.0
import QtWebEngine 1.8
import Qt.labs.platform 1.1

import hub.services 1.0
import hub.file 1.0

import "../sidebar/sidebar_button"
import "../"

Rectangle {
    id: root
    width: 640
    height: 480

    property SidebarButton button
    property alias webEngineView: webEngineView
    property int serviceType: Services.WHATSAPP
    property bool downloading: false

    FileHandler{
        id: fileHandler
    }

    GeneralResources{
        id: res
    }

    WebEngineView{
        id: webEngineView
        anchors.fill: parent

        profile: WebEngineProfile{
            id: profile
            httpUserAgent: "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/73.0.3664.3 Chrome/73.0.3664.3 Safari/537.36"

            onDownloadRequested: {
                download.accept()
                downloading = true
            }

            onDownloadFinished: downloading = false
        }
        settings.localStorageEnabled: true

        /*profile:  WebEngineProfile{
            httpUserAgent: "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36"

            onDownloadRequested: {
                var path = StandardPaths.writableLocation(StandardPaths.DownloadLocation)
                console.log("Path de descarga:", path)
                download.path = StandardPaths.writableLocation(StandardPaths.DownloadLocation)
                download.accept()
            }
        }*/

        onIconChanged: {
            if(button !== null && button !== undefined){
                button.icon = icon
            }

            possibleNotification(serviceType)
        }

        onNewViewRequested: {
            Qt.openUrlExternally(request.requestedUrl)
        }



    }

    Rectangle{
        id: downloadNotification

        x: res.margin
        y: parent.height - height - res.margin

        height: 30
        width: 100
        radius: res.radius
        color: res.color_sidebarSecondary

        opacity: downloading ? 1 : 0

        Text {
            anchors.fill: parent
            text: downloading ? qsTr("Downloading...") : qsTr("Finished!")
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            color: res.color_buttonSelected
        }

        Behavior on opacity {
            NumberAnimation{
                duration: 150
            }
        }
    }

    function loadURL(url){

        //Si es un servicio de whatsapp se tiene que limpiar el storage por que si no no carga
        /*if(serviceType === Services.WHATSAPP){
            var success = fileHandler.cleanWhatsappStorage("./persistent/" + root.objectName)
            if(!success){
                console.log("No se pudo borrar el storage de whatsapp")
            }
        }*/

        profile.persistentStoragePath = "./persistent/" + root.objectName
        profile.cachePath = "./cache/" + root.objectName
        //profile.persistentCookiesPolicy = WebEngineProfile.ForcePersistentCookies
        //profile.storageName = root.objectName
        profile.offTheRecord = false
        webEngineView.url = url
    }

    signal possibleNotification(int service)
}


