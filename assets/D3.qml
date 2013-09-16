import bb.cascades 1.0

NavigationPane {
    id: nav
    Page {
        actions: [
            InvokeActionItem {
                ActionBar.placement: ActionBarPlacement.OnBar
                title: "D3js"
                imageSource: "file:///usr/share/icons/bb_action_open.png"
                query {
                    invokeTargetId: "sys.browser"
                    uri: "http://d3js.org/"
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
                    data = app.encodeQString(qsTr("shareD3"))
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
                text: qsTr("demo");
                horizontalAlignment: HorizontalAlignment.Fill
                onClicked: {
                    var page = graph.createObject();
                    nav.push(page);
                }
            }
        }
        attachedObjects: [
            ComponentDefinition {
                id: graph
                Page {
                    objectName: "d3JS"
                    WebView {
                        id: grafico
                        url: "local:///assets/d3/index.html"
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