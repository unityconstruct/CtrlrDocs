function showHideExtraControls(toShow)
	
	if toShow then

		panel:getCanvas():getLayerByName("AdditionalLayout"):setPropertyInt("uiPanelCanvasLayerVisibility", 1)
		panel:getCanvas():getLayerByName("AdditionalControls"):setPropertyInt("uiPanelCanvasLayerVisibility", 1)
	else

		panel:getCanvas():getLayerByName("AdditionalLayout"):setPropertyInt("uiPanelCanvasLayerVisibility", 0)
		panel:getCanvas():getLayerByName("AdditionalControls"):setPropertyInt("uiPanelCanvasLayerVisibility", 0)
	end
end