import bb.cascades 1.0

NavigationPane {
    id: nav
    Page {
        actions: [
            InvokeActionItem {
                ActionBar.placement: ActionBarPlacement.OnBar
                title: "RaphaelJS"
                imageSource: "file:///usr/share/icons/bb_action_open.png"
                query {
                    invokeTargetId: "sys.browser"
                    uri: "http://raphaeljs.com/"
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
                    data = app.encodeQString(qsTr("shareRaphael"))
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
                hintText: qsTr("value1")
                inputMode: TextFieldInputMode.NumbersAndPunctuation
            }
            TextField {
                id: valor2
                hintText: qsTr("value2")
                inputMode: TextFieldInputMode.NumbersAndPunctuation
            }
            TextField {
                id: valor3
                hintText: qsTr("value3")
                inputMode: TextFieldInputMode.NumbersAndPunctuation
            }
            Button {
                text: qsTr("chart")
                horizontalAlignment: HorizontalAlignment.Fill
                onClicked: {
                    var page = graph.createObject();
                    page.value1 = valor1.text;
                    page.value2 = valor2.text;
                    page.value3 = valor3.text;
                    nav.push(page);
                }
            }
        }
        attachedObjects: [
            ComponentDefinition {
                id: graph
                Page {
                    function generarGrafico(){
                        grafico.postMessage(value1+';'+value2+';'+value3); 
                    }
                    objectName: "raphaelJS"
                    property int value1
                    property int value2
                    property int value3
                    WebView {
                        id: grafico
                        url: "local:///assets/raphael/index.html"
                        minWidth: DisplayInfo.width
                        minHeight: DisplayInfo.height
                    }
                }
            }
        ]
    }
    onPushTransitionEnded: {
        if (page.objectName == 'raphaelJS')
        {
            page.generarGrafico();
        }
    }
    onPopTransitionEnded: {
        page.destroy();
    }
}