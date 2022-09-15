import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Timeline 1.0
import "controls"

Window{
    id: window
    width: 1000
    height: 600
    maximumWidth: 1000
    maximumHeight : 600
    x : Screen.width / 2 - width / 2
    y : Screen.height / 2 - height / 2
    visible: true
    color: "#00ffffff"
    title: qsTr("Top FR Music")

    // SET FLAGS
    flags: Qt.WindowCloseButtonHint | Qt.WindowMinimizeButtonHint | Qt.CustomizeWindowHint  | Qt.WindowTitleHint | Qt.Window | Qt.FramelessWindowHint

    // SET MATERIAL STYLE
    Material.theme: Material.Dark
    Material.accent: Material.LightBlue
    FontLoader { id: alfaSlabOneFont; source: "../images/fonts/Alfa_Slab_One/AlfaSlabOne.ttf" }

    // Internal functions
    QtObject{
        id: internal


        function searchAlbums(){
            blockLoader.visible = true
            backend.search("albums")
        }
        function searchSingles(){
            blockLoader.visible = true
            backend.search("singles")
        }

    }

    Image {
        id: background
        x: 0
        y: 35
        anchors.fill: parent
        source: "../images/bg.jpg"
        fillMode: Image.Tile



        Rectangle {
            id: recHome
            x: 285
            y: 35
            width: 431
            height: 565
            visible: true
            color: "#00ffffff"

            Rectangle {
                id: recLogo
                x: 60
                height: 207
                opacity: 0
                visible: true
                color: "#92626262"
                radius: 10
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.margins: 60
                anchors.leftMargin: 105
                anchors.topMargin: 31
                anchors.rightMargin: 105

                Image{
                    id: imgLogo
                    x: 78
                    y: 23
                    width: 163
                    height: 140
                    source: "../images/logo.png"
                    anchors.horizontalCenterOffset: 0
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    anchors.topMargin: 15
                }

                Text{
                    id: lblNameApp
                    x: 79
                    y: 158
                    width: 214
                    height: 63
                    text: qsTr("Top FR Music")
                    anchors.verticalCenter: parent.verticalCenter
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font { family: alfaSlabOneFont.name; pointSize: 17}
                    anchors.verticalCenterOffset: 72
                    anchors.horizontalCenterOffset: -2
                    color: "#ffffff"
                    anchors.horizontalCenter: parent.horizontalCenter

                }
            }

            Button {
                id: btnAlbumsShow
                y: 269
                width: 165
                height: 46
                opacity: 1
                text: qsTr("Top Albums")
                font { family: alfaSlabOneFont.name; pointSize: 15}
                anchors.left: parent.left
                anchors.bottom: parent.bottom
                anchors.leftMargin: 30
                anchors.bottomMargin: 253
                z: 0
                onClicked: internal.searchAlbums()
            }
            Button {
                id: btnSinglesShow
                y: 266
                width: 165
                height: 46
                opacity: 1
                text: qsTr("Top Singles")
                font { family: alfaSlabOneFont.name; pointSize: 15}
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                anchors.rightMargin: 30
                z: 0
                anchors.bottomMargin: 253
                onClicked: internal.searchSingles()
            }

            BlockLoader {
                id: blockLoader
                x: 174
                y: 375
                width: 69
                height: 34
                opacity: 1
                visible: false
                spacing: 4
                verticalBlockCount: 2
                horizontalBlockCount: 3
            }

            Rectangle {
                id: recNameOfRec
                x: 68
                y: 489
                height: 40
                opacity: 1
                color: "#92626262"
                radius: 10
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.margins: 60
                anchors.rightMargin: 59
                anchors.topMargin: 503
                anchors.leftMargin: 61

                Text {
                    id: lblNameOfRec
                    x: 75
                    y: -39
                    width: 250
                    height: 40
                    color: "#ffffff"
                    text: qsTr("By CorentinMre")
                    anchors.verticalCenter: parent.verticalCenter
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.pointSize: 10
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }

            Rectangle {
                id: recError
                x: 75
                y: 498
                height: 34
                visible: false
                color: "#ff065b"
                radius: 10
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.margins: 60
                Text {
                    id: lblError
                    x: 75
                    y: -39
                    color: "#ffffff"
                    text: qsTr("The player profile is private")
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.pointSize: 10
                }

                Rectangle {
                    id: rectangle
                    x: 219
                    y: -11
                    width: 20
                    height: 19
                    color: "#92626262"
                    radius: 10

                    Button {
                        id: btnCloseError
                        x: 0
                        y: -3
                        width: 20
                        height: 26
                        opacity: 1
                        text: "\u2715"
                        flat: true
                        down: false
                        font.italic: false
                        font.pointSize: 17
                        z: 0
                        font.family: "ChromiumAATTest"
                        font.bold: false
                        onClicked: recError.visible = false
                    }
                }

                anchors.rightMargin: 102
                anchors.topMargin: 439
                anchors.leftMargin: 102
            }






        }




        Rectangle {
            id: recSingles
            visible: false
            color: "#00ffffff"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.topMargin: 35
            anchors.bottomMargin: 0
            Flickable {
                id: flickableSingles
                x: 8
                y: 14
                width: 547
                height: 543
                maximumFlickVelocity: 1200
                ScrollBar.vertical: ScrollBar {
                    visible: flickableSingles.moving || flickableSingles.moving
                    position: 0.2
                    contentItem: Rectangle {
                        color: "#92626262"
                        radius: width / 2
                        implicitWidth: 6
                        implicitHeight: 100
                    }
                    size: 0.3
                    orientation: Qt.Vertical
                }
                Column {
                    x: 15
                    y: 3
                    spacing: 2
                    Repeater {
                        id: repeaterSingles
                        Rectangle {
                            width: 530
                            height: 70
                            color: "#00000000"
                            border.color: "#92626262"
                            Image {
                                x: 5
                                y: 8
                                width: 55
                                height: 55
                                source: modelData["coverUrl"].replace("https","http")
                            }

                            Text {
                                x: 70
                                y: 30
                                width: 450
                                height: 55
                                lineHeightMode: Text.ProportionalHeight
                                minimumPointSize: 5
                                fontSizeMode: Text.Fit
                                color: "#ffffff"
                                font { family: alfaSlabOneFont.name; pointSize: 12}
                                text: modelData["rang"] + " - " + modelData["titre"] + "  |  " + modelData["artiste"]
                            }
                        }
                        model: [{"rang": "1", "titre":"letoff", "artiste": "Naza" ,"coverUrl": "../images/logo.png"}]
                    }
                }
                contentHeight: (70 + 3) * repeaterSingles.model.length - 3
                clip: true
            }

            ToolSeparator {
                id: toolSeparator7
                x: 0
                y: -8
                width: 25
                height: 573
            }
            anchors.rightMargin: 0
            anchors.leftMargin: 437
        }

        Rectangle {
            id: recAlbums
            visible: false
            color: "#00ffffff"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.leftMargin: 0
            anchors.bottomMargin: 0
            anchors.topMargin: 35
            anchors.rightMargin: 437

            Flickable {
                id: flickableAlbums
                x: 8
                y: 14
                contentHeight: (70 + 3) * repeaterAlbums.model.length - 3
                width: 547
                height: 543
                maximumFlickVelocity: 1200
                clip: true

                ScrollBar.vertical: ScrollBar {
                    size: 0.3
                    position: 0.2
                    orientation: Qt.Vertical
                    visible: flickableAlbums.moving || flickableAlbums.moving

                    contentItem: Rectangle {
                        implicitWidth: 6
                        implicitHeight: 100
                        radius: width / 2
                        color: "#92626262"
                    }
                }
                Column {
                    x: 15
                    y: 3
                    Repeater {
                        id: repeaterAlbums
                        Rectangle {
                            width: 530
                            height: 70
                            color: "#00000000"
                            border.color: "#92626262"
                           // Button{
                             //   anchors.fill: parent
                               // flat: true
                               // onClicked: internal.getStats(modelData["steamid"])
                            Image {
                                x: 5
                                y: 8
                                width: 55
                                height: 55
                                source: modelData["coverUrl"].replace("https","http")
                            }

                            Text {
                                x: 70
                                y: 30
                                width: 450
                                height: 55
                                fontSizeMode: Text.Fit
                                color: "#ffffff"
                                minimumPointSize: 5
                                font { family: alfaSlabOneFont.name; pointSize: 12}
                                text: modelData["rang"] + " - " + modelData["titre"] + "  |  " + modelData["artiste"]
                            }
                        }
                        model: [{"rang": "1", "titre":"letoff", "artiste": "Naza" ,"coverUrl": "../images/logo.png"}]//https://avatars.akamai.steamstatic.com/07c6992293fe0088dc1826fffcfcf7bd89ff2ba9_medium.jpg
                    }
                    spacing: 2
                }
            }

            ToolSeparator {
                id: toolSeparator6
                x: 555
                y: 0
                width: 25
                height: 573
            }
        }

        Rectangle {
            id: recTopBar
            x: 0
            y: 0
            width: 400
            height: 35
            color: "#151515"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top


            Image {
                id: iconApp
                width: 36
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                source: "../images/logo.png"
                anchors.leftMargin: 3
                anchors.bottomMargin: 3
                anchors.topMargin: 3
                fillMode: Image.PreserveAspectFit
            }

            Rectangle {
                id: recBtns
                x: 330
                width: 70
                height: 35
                visible: true
                color: "#00ffffff"
                anchors.right: parent.right
                anchors.top: parent.top

                Button {
                    id: btnMin
                    width: 35
                    height: 47
                    opacity: 1
                    text: qsTr("—")
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    font.underline: false
                    font.strikeout: false
                    flat: true
                    font.italic: true
                    font.bold: true
                    font.family: "LED Real"
                    font.pointSize: 15
                    anchors.leftMargin: 0
                    z: 0
                    onClicked: window.showMinimized()
                }

                Button {
                    id: btnClose
                    x: 35
                    width: 35
                    height: 47
                    opacity: 1
                    text: "\u2715"
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right
                    down: false
                    flat: true
                    font.italic: false
                    font.bold: false
                    font.pointSize: 17
                    font.family: "ChromiumAATTest"
                    anchors.rightMargin: 0
                    z: 0
                    onClicked: window.close()
                }
            }

            Label {
                id: lblNameOfGame
                color: "#c3cbdd"
                text: qsTr("Top FR Music Of The Week")
                anchors.fill: parent
                verticalAlignment: Text.AlignVCenter
                anchors.rightMargin: 70
                anchors.leftMargin: 45
                font.pointSize: 10
            }

            DragHandler {
                onActiveChanged: if(active){
                                     window.startSystemMove()
                                 }
            }

        }


        PropertyAnimation{
            id: moveRecHomeForAlbums
            target: recHome
            properties: "x"
            to: 575
            duration: 1000
            easing.type: Easing.OutQuint
        }
        PropertyAnimation{
            id: moveRecHomeForSingles
            target: recHome
            properties: "x"
            to: 0
            duration: 1000
            easing.type: Easing.OutQuint
        }


    }//end backgroundImage

    Timeline {
        id: timeline
        animations: [
            TimelineAnimation {
                id: timelineAnimation
                running: true
                duration: 1000
                loops: 1
                to: 1000
                from: 0
            }
        ]
        startFrame: 0
        endFrame: 2000
        enabled: true

        KeyframeGroup {
            target: recLogo
            property: "opacity"
            Keyframe {
                frame: 0
                value: 0
            }

            Keyframe {
                frame: 436
                value: 1
            }
        }

        KeyframeGroup {
            target: btnAlbumsShow
            property: "opacity"
            Keyframe {
                frame: 0
                value: 0
            }

            Keyframe {
                frame: 628
                value: 1
            }
        }

        KeyframeGroup {
            target: recNameOfRec
            property: "opacity"
            Keyframe {
                frame: 0
                value: 0
            }

            Keyframe {
                frame: 763
                value: 1
            }
        }

        KeyframeGroup {
            target: btnSinglesShow
            property: "opacity"
            Keyframe {
                value: 0
                frame: 0
            }

            Keyframe {
                value: 1
                frame: 627
            }
        }

    }


    Connections {
        target: backend


        function onAlbumsFound(data){
            blockLoader.visible = false
            recSingles.visible = false
            recAlbums.visible = true
            repeaterAlbums.model = data
            moveRecHomeForAlbums.running = true
        }

        function onSinglesFound(data){
            blockLoader.visible = false
            recAlbums.visible = false
            recSingles.visible = true
            repeaterSingles.model = data
            moveRecHomeForSingles.running = true
        }





    }

}
/*##^##
Designer {
    D{i:0;formeditorZoom:0.75}D{i:46}
}
##^##*/
