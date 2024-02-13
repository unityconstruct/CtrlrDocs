
-- This function set the inital value of combo from user selection


storeComputer = function()


    uiCombo = panel:getComponent("STORE-PATCH")

    myCombo1 = panel:getComponent("STORE-PATCH")        

    
    storeSet = panel:getModulatorByName("STORE-PLACE"):getModulatorValue()

    
    if storeSet==0 then

        uiCombo: setProperty ("componentVisibleName", "SAVE PATCH ON", false)

        panel:getModulatorByName("STORE-PATCH"):setModulatorValue(0,false,false,false)

        myCombo1:setProperty ("uiComboContent", "I01=000\nI02=001\nI03=002\nI04=003\nI05=004\nI06=005\nI07=006\nI08=007\nI09=008\nI10=009\nI11=010\nI12=011\nI13=012\nI14=013\nI15=014\nI16=015\nI17=016\nI18=017\nI19=018\nI20=019\nI21=020\nI22=021\nI23=022\nI24=023\nI25=024\nI26=025\nI27=026\nI28=027\nI29=028\nI30=029\nI31=030\nI32=031\nI33=032\nI34=033\nI35=034\nI36=035\nI37=036\nI38=037\nI39=038\nI40=039\nI41=040\nI42=041\nI43=042\nI44=043\nI45=044\nI46=045\nI47=046\nI48=047\nI49=048\nI50=049\nI51=050\nI52=051\nI53=052\nI54=053\nI55=054\nI56=055\nI57=056\nI58=057\nI59=058\nI60=059\nI61=060\nI62=061\nI63=062\nI64=063\n", false)

    end


    if storeSet==1 then

        uiCombo: setProperty ("componentVisibleName", "SAVE PATCH ON", false)

        panel:getModulatorByName("STORE-PATCH"):setModulatorValue(0,false,false,false)
    
        myCombo1:setProperty ("uiComboContent", "C01=000\nC02=001\nC03=002\nC04=003\nC05=004\nC06=005\nC07=006\nC08=007\nC09=008\nC10=009\nC11=010\nC12=011\nC13=012\nC14=013\nC15=014\nC16=015\nC17=016\nC18=017\nC19=018\nC20=019\nC21=020\nC22=021\nC23=022\nC24=023\nC25=024\nC26=025\nC27=026\nC28=027\nC29=028\nC30=029\nC31=030\nC32=031\nC33=032\nC34=033\nC35=034\nC36=035\nC37=036\nC38=037\nC39=038\nC40=039\nC41=040\nC42=041\nC43=042\nC44=043\nC45=044\nC46=045\nC47=046\nC48=047\nC49=048\nC50=049\nC51=050\nC52=051\nC53=052\nC54=053\nC55=054\nC56=055\nC57=056\nC58=057\nC59=058\nC60=059\nC61=060\nC62=061\nC63=062\nC64=063\n", false)

    end


    if storeSet==2 then

        uiCombo: setProperty ("componentVisibleName", "NOT USED", false)

        panel:getModulatorByName("STORE-PATCH"):setModulatorValue(-1,false,false,false)

        myCombo1:setProperty ("uiComboContent", "", false)

    end


end