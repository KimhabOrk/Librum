import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Librum.style
import "../multiComboBox"

Item
{
    id: root
    property alias selectionPopup: selectionPopup
    
    property var model
    property int maxPopupHeight
    property int defaultIndex
    
    property bool multiSelect: false
    property int headerToBoxSpacing: 2
    property int popupSpacing: 5
    property string backgroundColor: Style.colorBackground
    property int radius: 4
    
    property string headerText
    property int headerFontWeight: Font.Bold
    property double headerFontSize: 10.5
    property color headerFontColor: Style.colorLightText3
    
    property string titleEmptyText: "Any"
    property int titleFontWeight: Font.Normal
    property double titleFontSize: 11
    property color titleFontColor: Style.colorLightText3
    property int titleSpacing: 0
    
    property string imagePath
    property int imageSpacing: 4
    property int imageSize: 6
    
    signal clicked
    
    implicitHeight: 47
    
    
    ColumnLayout
    {
        id: mainLayout
        anchors.fill: parent
        spacing: root.headerToBoxSpacing
        
        
        Label
        {
            id: header
            Layout.fillWidth: true
            visible: root.headerText.length > 0
            text: root.headerText
            font.family: Style.defaultFontFamily
            font.pointSize: root.headerFontSize
            font.weight: root.headerFontWeight
            color: root.headerFontColor
        }
        
        Pane
        {
            id: container
            Layout.fillWidth: true
            Layout.fillHeight: true
            verticalPadding: 6
            horizontalPadding: 8
            background: Rectangle
            {
                color: root.backgroundColor
                border.width: 1
                border.color: Style.colorLightBorder
                radius: root.radius
            }
            
            
            RowLayout
            {
                id: inContainerLayout
                anchors.fill: parent
                spacing: root.imageSpacing
                
                
                Label
                {
                    id: title
                    Layout.fillWidth: true
                    Layout.alignment: root.centerTitle ? Qt.AlignHCenter : Qt.AlignLeft
                    leftPadding: root.titleSpacing
                    rightPadding: root.titleSpacing
                    text: selectionPopup.selectedContents === "" ? root.titleEmptyText : selectionPopup.selectedContents
                    font.pointSize: root.titleFontSize
                    font.family: Style.defaultFontFamily
                    font.weight: root.titleFontWeight
                    color: root.titleFontColor
                    elide: Text.ElideRight
                }
                
                Image
                {
                    id: icon
                    Layout.alignment: Qt.AlignRight
                    sourceSize.width: root.imageSize
                    source: root.imagePath
                    rotation: 180
                    fillMode: Image.PreserveAspectFit
                    
                    NumberAnimation
                    {
                        id: closeAnim
                        target: icon
                        property: "rotation"
                        to: 0
                        duration: 175
                        easing.type: Easing.InOutQuad
                    }
                    
                    NumberAnimation
                    {
                        id: openAnim
                        target: icon
                        property: "rotation"
                        to: -180
                        duration: 175
                        easing.type: Easing.InOutQuad
                    }
                }
            }
        }
    }
    
    MouseArea
    {
        anchors.fill: parent
        
        onClicked:
        {
            selectionPopup.opened ? selectionPopup.close() : selectionPopup.open()
        }
    }
    
    MComboBoxPopup
    {
        id: selectionPopup
        y: mainLayout.y + mainLayout.height + root.popupSpacing
        backgroundColor: root.backgroundColor
        width: parent.width
        multiSelect: root.multiSelect
        
        onOpenedChanged:
        {
            if(opened)
                closeAnim.start();
            else
                openAnim.start();
        }
    }
    
//    MMultiComboBoxPopup
//    {
//        id: multiSelectionPopup
//        property string content
        
//        model: root.model
//        maxHeight: root.maxPopupHeight
//        defaultIndex: root.defaultIndex
        
//        y: mainLayout.y + mainLayout.height + root.popupSpacing
//        backgroundColor: root.backgroundColor
//        width: parent.width
        
//        onItemsChanged:
//        {
//            let temp = "";
//            for(let i = 0; i < selectedItems.length; i++)
//            {
//                temp += selectedItems[i];
                
//                if(i < selectedItems.length - 1)
//                    temp += ", "
//            }
            
//            content = temp;
//        }
        
//        onOpenedChanged:
//        {
//            if(opened)
//                closeAnim.start();
//            else
//                openAnim.start();
//        }
//    }
    
    
    function giveFocus()
    {
        root.forceActiveFocus();
    }
}