import QtQuick 2.0
import QtWebEngine 1.8
import Qt.labs.platform 1.1
import "../sidebar/sidebar_button"

Rectangle {
    width: 640
    height: 480

    property SidebarButton button

    WebEngineView{
        anchors.fill: parent
        //url: "https://www.trello.com"
        url: "https://web.whatsapp.com"

        profile:  WebEngineProfile{
            httpUserAgent: "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36"

            onDownloadRequested: {
                var path = StandardPaths.writableLocation(StandardPaths.DownloadLocation)
                console.log("Path de descarga:", path)
                download.path = StandardPaths.writableLocation(StandardPaths.DownloadLocation)
                download.accept()
            }
        }

        onIconChanged: {
            if(button !== null && button !== undefined){
                button.icon = icon
            }
        }

        onNewViewRequested: {
            Qt.openUrlExternally(request.requestedUrl)
        }

    }


}


