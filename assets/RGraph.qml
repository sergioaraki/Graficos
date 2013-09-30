import bb.cascades 1.0

NavigationPane {
    id: nav
    Page {
        actions: [
            InvokeActionItem {
                ActionBar.placement: ActionBarPlacement.OnBar
                title: "RGraph"
                imageSource: "file:///usr/share/icons/bb_action_open.png"
                query {
                    invokeTargetId: "sys.browser"
                    uri: "http://www.rgraph.net/"
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
                    data = app.encodeQString(qsTr("shareRGraph"))
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
                text: qsTr("chartPie")
                horizontalAlignment: HorizontalAlignment.Fill
                onClicked: {
                    var page = pie.createObject();
                    page.value1 = valor1.text;
                    page.value2 = valor2.text;
                    page.value3 = valor3.text;
                    nav.push(page);
                }
            }
            Button {
                text: qsTr("chartLines")
                horizontalAlignment: HorizontalAlignment.Fill
                onClicked: {
                    var page = lines.createObject();
                    page.value1 = valor1.text;
                    page.value2 = valor2.text;
                    page.value3 = valor3.text;
                    nav.push(page);
                }
            }
            Button {
                text: qsTr("chartBars")
                horizontalAlignment: HorizontalAlignment.Fill
                onClicked: {
                    var page = bars.createObject();
                    page.value1 = valor1.text;
                    page.value2 = valor2.text;
                    page.value3 = valor3.text;
                    nav.push(page);
                }
            }
        }
        attachedObjects: [
            ComponentDefinition {
                id: pie
                Page {
                    function generarGrafico(){
                        graph1.postMessage(value1+';'+value2+';'+value3); 
                    }
                    objectName: "rgraph"
                    property int value1
                    property int value2
                    property int value3
                    WebView {
                        id: graph1
                        url: "local:///assets/rgraph/pie.html"
                        minWidth: DisplayInfo.width
                        minHeight: DisplayInfo.height
                    }
                }
            },
            ComponentDefinition {
                id: lines
                Page {
                    function generarGrafico(){
                        graph2.postMessage(value1+';'+value2+';'+value3); 
                    }
                    objectName: "rgraph"
                    property int value1
                    property int value2
                    property int value3
                    WebView {
                        id: graph2
                        url: "local:///assets/rgraph/lines.html"
                        minWidth: DisplayInfo.width
                        minHeight: DisplayInfo.height
                    }
                }
            },
            ComponentDefinition {
                id: bars
                Page {
                    function generarGrafico(){
                        graph3.postMessage(value1+';'+value2+';'+value3); 
                    }
                    objectName: "rgraph"
                    property int value1
                    property int value2
                    property int value3
                    WebView {
                        id: graph3
                        url: "local:///assets/rgraph/bars.html"
                        minWidth: DisplayInfo.width
                        minHeight: DisplayInfo.height
                    }
                }
            }
        ]
    }
    onPushTransitionEnded: {
        if (page.objectName == 'rgraph')
        {
            page.generarGrafico();
        }
    }
    onPopTransitionEnded: {
        page.destroy();
    }
}