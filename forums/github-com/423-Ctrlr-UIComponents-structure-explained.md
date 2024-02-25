1. CtrlrDocument is the JUCE top-level component where every sub component are constructed for Ctrlr.
2. The Main Ctrlr component is CtrlrEditor, CtrlrEditor holds the menuBar and CtrlrPanelEditor
3. CtrlPanelEditor is a classStretchableLayoutManager layout manager element divided in 3 layouts :
ctrlrPanelViewport (0), spacerComponent(1), ctrlrPanelProperties(2)

Note : spacerComponent is just the little 8px draggable spacer-bar that separates ctrlPanelEditor in two parts, ctrlrPanelViewPort and ctrlrPanelProperties

4. ctrlrPanelViewport contains another component called ctrlrViewPort which is aimed at displaying scrollbars if ctrlrPanelViewport is smaller than its child ctrlrPanelCanvas
5. ctrlrPanelProperties contains the ctrlrPanelComponentProperties where you set all the component properties of the selected component. it can also hold the ctrlrPanelResourcesEditor, or the ctrlrPanelUtilities for the XML text of the current component.
6. Last but not least ctrlrPanelCanvas which is the layout we are all working on and contains all the components/modulators we need for our panels.

Hope it helps to understand a little bit better the file and UI structure of Ctrlr.