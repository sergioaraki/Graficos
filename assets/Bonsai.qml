import bb.cascades 1.0

NavigationPane {
    id: nav
    Page {
        actions: [
            InvokeActionItem {
                ActionBar.placement: ActionBarPlacement.OnBar
                title: "BonsaiJS"
                imageSource: "file:///usr/share/icons/bb_action_open.png"
                query {
                    invokeTargetId: "sys.browser"
                    uri: "http://bonsaijs.org/"
                }
            },
            InvokeActionItem {
                ActionBar.placement: ActionBarPlacement.OnBar
                title: qsTr("share")
                imageSource: "asset:///images/ic_share.png"
                query {
                    mimeType: "text/plain"
                    invokeActionId: "bb.action.SHARE"
                }
                onTriggered: {
                    data = app.encodeQString(qsTr("shareBonsai"))
                }
            }
        ]
        Container {
            leftPadding: 20
            rightPadding: 20
            topPadding: 20
            layout: StackLayout {
            
            }
            Button {
                text: qsTr("graphPie");
                horizontalAlignment: HorizontalAlignment.Fill
                onClicked: {
                    var page = pie.createObject();
                    nav.push(page);
                }
            }
            Button {
                text: qsTr("demo");
                horizontalAlignment: HorizontalAlignment.Fill
                onClicked: {
                    var page = demo.createObject();
                    nav.push(page);
                }
            }
        }
        attachedObjects: [
            ComponentDefinition {
                id: pie
                Page {
                    objectName: "bonsaiJS"
                    WebView {
                        id: graph
                        url: "local:///assets/bonsai/pie.html"
                        minWidth: DisplayInfo.width
                        minHeight: DisplayInfo.height
                    }
                }
            },
            ComponentDefinition {
                id: demo
                Page {
                    objectName: "bonsaiJS"
                    WebView {
                        id: graph2
                        url: "local:///assets/bonsai/demo.html"
                        minWidth: DisplayInfo.width
                        minHeight: DisplayInfo.height
                    }
                }
            }
        ]
    }
    onPopTransitionEnded: {
        page.destroy();
    }
}