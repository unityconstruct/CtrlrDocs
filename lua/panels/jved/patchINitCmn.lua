function patchInitCmn()


    local x=utils.questionWindow("Initialize Common Parameters?", "This action will reset all common parameters of patch", "Yes", "No")

                      
    if x==true then

    -- Init Panel Options

    panel:getModulatorByName("COPY-SELECT"):setModulatorValue(0,false,false,false)
        os.execute(sleep(20))
    panel:getModulatorByName("CHORUS-SW"):setModulatorValue(1,false,true,false)
        os.execute(sleep(20))
    panel:getModulatorByName("REVERB-SW"):setModulatorValue(1,false,true,false)
        os.execute(sleep(20))
    panel:getModulatorByName("COMMON-OUTMODE"):setModulatorValue(0,false,true,false)
        os.execute(sleep(20))
    

    -- Init Common

    panel:getModulatorByName("NAME-01"):setModulatorValue(09,false,true,false)
        os.execute(sleep(20))			
    panel:getModulatorByName("NAME-02"):setModulatorValue(14,false,true,false)
        os.execute(sleep(20))
    panel:getModulatorByName("NAME-03"):setModulatorValue(09,false,true,false)
        os.execute(sleep(20))
    panel:getModulatorByName("NAME-04"):setModulatorValue(20,false,true,false)
        os.execute(sleep(20))
    panel:getModulatorByName("NAME-05"):setModulatorValue(09,false,true,false)
        os.execute(sleep(20))
    panel:getModulatorByName("NAME-06"):setModulatorValue(01,false,true,false)
        os.execute(sleep(20))
    panel:getModulatorByName("NAME-07"):setModulatorValue(12,false,true,false)
        os.execute(sleep(20))
    panel:getModulatorByName("NAME-08"):setModulatorValue(00,false,true,false)
        os.execute(sleep(20))
    panel:getModulatorByName("NAME-09"):setModulatorValue(04,false,true,false)
        os.execute(sleep(20))
    panel:getModulatorByName("NAME-10"):setModulatorValue(01,false,true,false)
        os.execute(sleep(20))
    panel:getModulatorByName("NAME-11"):setModulatorValue(20,false,true,false)
        os.execute(sleep(20))
    panel:getModulatorByName("NAME-12"):setModulatorValue(01,false,true,false)
        os.execute(sleep(20))

    
    panel:getModulatorByName("VELOCITY-VELOCITY-SW"):setModulatorValue(0,false,true,false)
        os.execute(sleep(20))


    panel:getModulatorByName("REVERB-TYPE"):setModulatorValue(3,false,true,false)
        os.execute(sleep(20))
    panel:getModulatorByName("REVERB-LEVEL"):setModulatorValue(100,false,true,false)
        os.execute(sleep(20))
    panel:getModulatorByName("REVERB-TIME"):setModulatorValue(60,false,true,false)
        os.execute(sleep(20))
    panel:getModulatorByName("REVERB-FEEDBACK"):setModulatorValue(0,false,true,false)
        os.execute(sleep(20))


    panel:getModulatorByName("CHORUS-TYPE"):setModulatorValue(0,false,true,false)
        os.execute(sleep(20))
    panel:getModulatorByName("CHORUS-LEVEL"):setModulatorValue(60,false,true,false)
        os.execute(sleep(20))
    panel:getModulatorByName("CHORUS-DEPTH"):setModulatorValue(80,false,true,false)
        os.execute(sleep(20))
    panel:getModulatorByName("CHORUS-RATE"):setModulatorValue(60,false,true,false)
        os.execute(sleep(20))
    panel:getModulatorByName("CHORUS-FEEDBACK"):setModulatorValue(0,false,true,false)
        os.execute(sleep(20))
    panel:getModulatorByName("CHORUS-OUTPUT-SW"):setModulatorValue(0,false,true,false)
        os.execute(sleep(20))


    panel:getModulatorByName("COMMON-ANALOGFEEL"):setModulatorValue(0,false,true,false)
        os.execute(sleep(20))
    panel:getModulatorByName("COMMON-PATCHLEVEL"):setModulatorValue(127,false,true,false)
        os.execute(sleep(20))
    panel:getModulatorByName("COMMON-PATCHPAN"):setModulatorValue(0,false,true,false)
        os.execute(sleep(20))


    panel:getModulatorByName("BENDRANGE-DOWN"):setModulatorValue(-2,false,true,false)
        os.execute(sleep(20))
    panel:getModulatorByName("BENDRANGE-UP"):setModulatorValue(2,false,true,false)
        os.execute(sleep(20))


    panel:getModulatorByName("COMMON-KEYASSIGN-SW"):setModulatorValue(0,false,true,false)
        os.execute(sleep(20))
    panel:getModulatorByName("COMMON-LEGATO-SW"):setModulatorValue(0,false,true,false)
        os.execute(sleep(20))


    panel:getModulatorByName("PORTAMENTO-SW"):setModulatorValue(0,false,true,false)
        os.execute(sleep(20))
    panel:getModulatorByName("PORTAMENTO-MODE-SW"):setModulatorValue(1,false,true,false)
        os.execute(sleep(20))
    panel:getModulatorByName("PORTAMENTO-TYPE-SW"):setModulatorValue(0,false,true,false)
        os.execute(sleep(20))
    panel:getModulatorByName("PORTAMENTO-TIME"):setModulatorValue(50,false,true,false)
        os.execute(sleep(20))

    end


    if x==false then
    
        return
    
    end


end