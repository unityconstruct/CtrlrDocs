
--### This function initialize specific modulators when the panel is load ###


function timerInitCallback(timerId)

    -- Load program timer

if timerId == 1 then
    
    
    -- Init Panel Tables


    tableTone1 = {}
    tableTone2 = {}
    tableTone3 = {}
    tableTone4 = {}
    tableCommon = {}


    -- Init Panel Modulators

    panel:getModulatorByName("T1-SWITCH"):setModulatorValue(0,false,false,false)
    panel:getModulatorByName("T2-SWITCH"):setModulatorValue(0,false,false,false)
    panel:getModulatorByName("T3-SWITCH"):setModulatorValue(0,false,false,false)
    panel:getModulatorByName("T4-SWITCH"):setModulatorValue(0,false,false,false)
    
    panel:getModulatorByName("T1-WAVEGROUP"):setModulatorValue(0,false,false,false)
    panel:getModulatorByName("T2-WAVEGROUP"):setModulatorValue(0,false,false,false)
    panel:getModulatorByName("T3-WAVEGROUP"):setModulatorValue(0,false,false,false)
    panel:getModulatorByName("T4-WAVEGROUP"):setModulatorValue(0,false,false,false)

    panel:getModulatorByName("T1-WAVE-INT"):setModulatorValue(0,false,false,false)
    panel:getModulatorByName("T2-WAVE-INT"):setModulatorValue(0,false,false,false)
    panel:getModulatorByName("T3-WAVE-INT"):setModulatorValue(0,false,false,false)
    panel:getModulatorByName("T4-WAVE-INT"):setModulatorValue(0,false,false,false)

    panel:getModulatorByName("T1-VOL-SW"):setModulatorValue(0,false,false,false)
    panel:getModulatorByName("T2-VOL-SW"):setModulatorValue(0,false,false,false)
    panel:getModulatorByName("T3-VOL-SW"):setModulatorValue(0,false,false,false)
    panel:getModulatorByName("T4-VOL-SW"):setModulatorValue(0,false,false,false)

    panel:getModulatorByName("T1-HOLD-SW"):setModulatorValue(0,false,false,false)
    panel:getModulatorByName("T2-HOLD-SW"):setModulatorValue(0,false,false,false)
    panel:getModulatorByName("T3-HOLD-SW"):setModulatorValue(0,false,false,false)
    panel:getModulatorByName("T4-HOLD-SW"):setModulatorValue(0,false,false,false)

    panel:getModulatorByName("T1-FXM-SW"):setModulatorValue(0,false,false,false)
    panel:getModulatorByName("T2-FXM-SW"):setModulatorValue(0,false,false,false)
    panel:getModulatorByName("T3-FXM-SW"):setModulatorValue(0,false,false,false)
    panel:getModulatorByName("T4-FXM-SW"):setModulatorValue(0,false,false,false)		

    panel:getModulatorByName("T1-FXM-DEPTH"):setModulatorValue(1,false,false,false)
    panel:getModulatorByName("T2-FXM-DEPTH"):setModulatorValue(1,false,false,false)
    panel:getModulatorByName("T3-FXM-DEPTH"):setModulatorValue(1,false,false,false)
    panel:getModulatorByName("T4-FXM-DEPTH"):setModulatorValue(1,false,false,false)

    panel:getModulatorByName("T1-DRY"):setModulatorValue(127,false,false,false)
    panel:getModulatorByName("T2-DRY"):setModulatorValue(127,false,false,false)
    panel:getModulatorByName("T3-DRY"):setModulatorValue(127,false,false,false)
    panel:getModulatorByName("T4-DRY"):setModulatorValue(127,false,false,false)

    panel:getModulatorByName("T1-REVERB"):setModulatorValue(0,false,false,false)
    panel:getModulatorByName("T2-REVERB"):setModulatorValue(0,false,false,false)
    panel:getModulatorByName("T3-REVERB"):setModulatorValue(0,false,false,false)
    panel:getModulatorByName("T4-REVERB"):setModulatorValue(0,false,false,false)

    panel:getModulatorByName("T1-CHORUS"):setModulatorValue(0,false,false,false)
    panel:getModulatorByName("T2-CHORUS"):setModulatorValue(0,false,false,false)
    panel:getModulatorByName("T3-CHORUS"):setModulatorValue(0,false,false,false)
    panel:getModulatorByName("T4-CHORUS"):setModulatorValue(0,false,false,false)

    panel:getModulatorByName("T1-PAN"):setModulatorValue(0,false,false,false)
    panel:getModulatorByName("T2-PAN"):setModulatorValue(0,false,false,false)
    panel:getModulatorByName("T3-PAN"):setModulatorValue(0,false,false,false)
    panel:getModulatorByName("T4-PAN"):setModulatorValue(0,false,false,false)
    
    panel:getModulatorByName("T1-BUS"):setModulatorValue(0,false,false,false)
    panel:getModulatorByName("T2-BUS"):setModulatorValue(0,false,false,false)
    panel:getModulatorByName("T3-BUS"):setModulatorValue(0,false,false,false)
    panel:getModulatorByName("T4-BUS"):setModulatorValue(0,false,false,false)

    panel:getModulatorByName("T1-LEVEL"):setModulatorValue(0,false,false,false)
    panel:getModulatorByName("T2-LEVEL"):setModulatorValue(0,false,false,false)
    panel:getModulatorByName("T3-LEVEL"):setModulatorValue(0,false,false,false)
    panel:getModulatorByName("T4-LEVEL"):setModulatorValue(0,false,false,false)

    panel:getModulatorByName("NAME-01"):setModulatorValue(64,false,false,false)
    panel:getModulatorByName("NAME-02"):setModulatorValue(64,false,false,false)
    panel:getModulatorByName("NAME-03"):setModulatorValue(64,false,false,false)
    panel:getModulatorByName("NAME-04"):setModulatorValue(64,false,false,false)
    panel:getModulatorByName("NAME-05"):setModulatorValue(64,false,false,false)
    panel:getModulatorByName("NAME-06"):setModulatorValue(64,false,false,false)
    panel:getModulatorByName("NAME-07"):setModulatorValue(64,false,false,false)
    panel:getModulatorByName("NAME-08"):setModulatorValue(64,false,false,false)
    panel:getModulatorByName("NAME-09"):setModulatorValue(64,false,false,false)
    panel:getModulatorByName("NAME-10"):setModulatorValue(64,false,false,false)
    panel:getModulatorByName("NAME-11"):setModulatorValue(64,false,false,false)
    panel:getModulatorByName("NAME-12"):setModulatorValue(64,false,false,false)

    panel:getModulatorByName("CHORUS-SW"):setModulatorValue(1,false,true,false)
    panel:getModulatorByName("REVERB-SW"):setModulatorValue(1,false,true,false)
    panel:getModulatorByName("COMMON-OUTMODE"):setModulatorValue(0,false,true,false)

    panel:getModulatorByName("COPY-SELECT"):setModulatorValue(0,false,false,false)
    
    panel:getModulatorByName("STORE-PLACE"):setModulatorValue(0,false,false,false)		
    panel:getModulatorByName("STORE-PATCH"):setModulatorValue(0,false,false,false)

    panel:getModulatorByName("BANK-SELECT"):setModulatorValue(0,false,true,false)
            
    
    -- Stop Timer   
    
    timer:stopTimer(timerId)

end

end