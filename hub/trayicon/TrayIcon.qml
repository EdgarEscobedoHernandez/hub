import QtQuick 2.0
import Qt.labs.platform 1.1

//TRAY ICON
SystemTrayIcon{
    id: trayIcon
    visible: true

    iconSource: "qrc:/src/img/logo/tray-icon.svg"

    menu: Menu{
        MenuItem{
            text: qsTr("Show")

            onTriggered: {
                root.show()
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
