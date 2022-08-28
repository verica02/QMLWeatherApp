import QtQuick 2.15

Rectangle {

    //consts that will be used in the following code
    property string dayOfWeek: " "
    property string tempMin: "--.- °C"
    property string tempMax: "--.- °C"
    property bool lineVisible: true
    property real scaleFactor: 1.0

    color:"transparent"

    function setIcon(value){
        imgWeather.source = "qrc:/images/"+value+"-s.png"
    }

    Text{
        id:txtDayOfWeek
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: imgWeather.top
        anchors.bottomMargin: 10
        color: "#FA9727"
        font.bold: true
        font.pointSize: 15
        font.family: fontOpenSansLight.name
        //from property
        text: dayOfWeek

    }

    Image{
        id: imgWeather
        anchors.centerIn:parent
        source: "qrc:/images/1-s.png"
        //from propery
        scale:scaleFactor
    }

    Rectangle{
       height:25
       width:parent.width
       anchors.top:imgWeather.bottom
       anchors.topMargin: 10 * scaleFactor
       anchors.horizontalCenter: parent.horizontalCenter
       color:"transparent"

       Text{
           id:txtTempMin
           anchors.right: parent.horizontalCenter
           anchors.rightMargin:15
           anchors.verticalCenter: parent.verticalCenter
           color:"#3ecdfd"
           font.bold:true
           font.pointSize: 13
           font.family: fontOpenSansLight.name
           text:tempMin
       }

       Text{
           id:txtTempMax
           anchors.left: parent.horizontalCenter
           anchors.leftMargin:15
           anchors.verticalCenter: parent.verticalCenter
           color:"#fb5255"
           font.bold:true
           font.pointSize: 13
           font.family: fontOpenSansLight.name
           text:tempMax
       }

       Rectangle{
           id:verticalLine
           height:parent.height - 30
           width: 1
           anchors.verticalCenter: parent.verticalCenter
           anchors.right: parent.right
           border.width: 1
           border.color: "white"
           visible: lineVisible


       }


    }
}
