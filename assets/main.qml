import bb.cascades 1.0

TabbedPane {
    showTabsOnActionBar: false
    Menu.definition: MenuDefinition {
        helpAction: HelpActionItem {
            onTriggered: {
                aboutSheet.open();
            }
        }
    }
    Tab {
        title: "Chart.js"
        Chart {
            
        }
    }
    Tab {
        title: "BonsaiJS"
        Bonsai {
            
        }
    }
    Tab {
        title: "D3js"
        D3 {
        
        }
    }
    Tab {
     	title: "RaphaelJS"
     	Raphael {
          
        }   
    }
    Tab {
        title: "Flotr"
        Flotr {
            
        }
    }
    attachedObjects: [
        Sheet {
            id: aboutSheet
            content: About{
            
            }
        }
    ]
}