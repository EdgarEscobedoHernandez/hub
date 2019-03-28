import QtQuick 2.12
import Qt.labs.platform 1.1

//TRAY ICON
SystemTrayIcon{
    id: trayIcon
    iconSource: "qrc:/src/img/logo/tray-icon.svg"
    tooltip: qsTr("hub")
    visible: true

    menu: Menu{
        MenuItem{
            text: qsTr("Show")

            onTriggered: {
                root.requestActivate()
            }
        }

        MenuItem{
            text: qsTr("Quit")
            onTriggered: {
                Qt.quit()
            }
        }
    }

}
