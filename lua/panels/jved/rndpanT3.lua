rndpanT3 = function(mod, event) -- Set the name of slide PAN / RANDOM PAN

	
	slide = panel:getComponent("T3-PAN")
	       
    panValue = panel:getModulatorByName("T3-PAN"):getModulatorValue()


	if panValue==64 then --Set the name of slide EFX/MIX Send
          
		slide:setProperty ("componentVisibleName", "RANDOM PAN", false)

	else

		slide:setProperty ("componentVisibleName", "PAN", false)

	end


end