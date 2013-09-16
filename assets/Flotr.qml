import bb.cascades 1.0

NavigationPane {
    id: nav
    Page {
        actions: [
            InvokeActionItem {
                ActionBar.placement: ActionBarPlacement.OnBar
                title: "Flotr"
                imageSource: "file:///usr/share/icons/bb_action_open.png"
                query {
                    invokeTargetId: "sys.browser"
                    uri: "http://solutoire.com/flotr/"
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
                    data = app.encodeQString(qsTr("shareFlotr"))
                }
            }
        ]
        Container {
            leftPadding: 20
            rightPadding: 20
            topPadding: 20
            layout: StackLayout {
            
            }
            TextField {
                id: valor1
                hintText: qsTr("maxValue")
                inputMode: TextFieldInputMode.NumbersAndPunctuation
            }
            Button {
                text: qsTr("chart")
                horizontalAlignment: HorizontalAlignment.Fill
                onClicked: {
                    var page = graph.createObject();
                    page.value1 = valor1.text;
                    nav.push(page);
                }
            }
        }
        attachedObjects: [
            ComponentDefinition {
                id: graph
                Page {
                    function generarGrafico(){
                        grafico.postMessage(value1); 
                    }
                    objectName: "flotrJS"
                    property int value1
                    WebView {
                        id: grafico
                        url: "local:///assets/flotr/index.html"
                        minWidth: DisplayInfo.width
                        minHeight: DisplayInfo.height
                    }
                }
            }
        ]
    }
    onPushTransitionEnded: {
        if (page.objectName == 'flotrJS')
        {
            page.generarGrafico();
        }
    }
    onPopTransitionEnded: {
        page.destroy();
    }
}