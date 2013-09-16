import bb.cascades 1.0

Page {
    titleBar: TitleBar {
        title: qsTr("about")
        acceptAction: ActionItem {
            title: qsTr("exit")
            onTriggered: {
                aboutSheet.close();
            }
        }
    }
    Container {
        layout: StackLayout {
        }
        leftPadding: 20.0
        rightPadding: 20.0
        topPadding: 10.0
        bottomPadding: 10.0
        
        Label {
            text: qsTr("labelAbout")
            multiline: true
            content.flags: TextContentFlag.ActiveText
        }
    }
}
