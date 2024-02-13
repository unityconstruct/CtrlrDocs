function patchInitT4()


    local x=utils.questionWindow("Initialize Tone 4?", "This action will reset all parameters of Tone 4", "Yes", "No")

                      
    if x==true then

    -- Init Tone 4
   
    panel:getModulatorByName("T4-WAVEGROUP"):setModulatorValue(0,false,true,false) -- set the same value for this modulator, sending it to the synth                
        os.execute(sleep(20))
    panel:getModulatorByName("T4-WAVE-INT"):setModulatorValue(0,false,true,false) -- set the same value for this modulator, sending it to the synth            
        os.execute(sleep(20))
    panel:getModulatorByName("T4-SWITCH"):setModulatorValue(1,false,true,false) -- set the same value for this modulator, sending it to the synth        
        os.execute(sleep(20))
    panel:getModulatorByName("T4-FXM-SW"):setModulatorValue(0,false,true,false) -- set the same value for this modulator, sending it to the synth
        os.execute(sleep(20))
    panel:getModulatorByName("T4-FXM-DEPTH"):setModulatorValue(0,false,true,false) -- set the same value for this modulator, sending it to the synth    
        os.execute(sleep(20))
    panel:getModulatorByName("T4-VELOCITY-LOWER"):setModulatorValue(0,false,true,false) -- set the same value for this modulator, sending it to the synth    
        os.execute(sleep(20))
    --panel:getModulatorByName("T4-VELOCITY-UPPER"):setModulatorValue(127,false,true,false) -- set the same value for this modulator, sending it to the synth    
        os.execute(sleep(20))
    panel:getModulatorByName("T4-VOL-SW"):setModulatorValue(1,false,true,false) -- set the same value for this modulator, sending it to the synth        
        os.execute(sleep(20))
    panel:getModulatorByName("T4-HOLD-SW"):setModulatorValue(1,false,true,false) -- set the same value for this modulator, sending it to the synth
        os.execute(sleep(20))

   
    panel:getModulatorByName("T4-MOD-MOD1-DESTINY"):setModulatorValue(0,false,true,false)
        os.execute(sleep(20))
    panel:getModulatorByName("T4-MOD-MOD1-SENSITIVITY"):setModulatorValue(0,false,true,false)
        os.execute(sleep(20))
    panel:getModulatorByName("T4-MOD-MOD2-DESTINY"):setModulatorValue(0,false,true,false)
        os.execute(sleep(20))
    panel:getModulatorByName("T4-MOD-MOD2-SENSITIVITY"):setModulatorValue(0,false,true,false)
        os.execute(sleep(20))
    panel:getModulatorByName("T4-MOD-MOD3-DESTINY"):setModulatorValue(0,false,true,false)        
        os.execute(sleep(20))
    panel:getModulatorByName("T4-MOD-MOD3-SENSITIVITY"):setModulatorValue(0,false,true,false)
        os.execute(sleep(20))
    panel:getModulatorByName("T4-MOD-MOD4-DESTINY"):setModulatorValue(0,false,true,false)               
        os.execute(sleep(20))
    panel:getModulatorByName("T4-MOD-MOD4-SENSITIVITY"):setModulatorValue(0,false,true,false)
         os.execute(sleep(20))
        
    
    panel:getModulatorByName("T4-AFT-MOD1-DESTINY"):setModulatorValue(0,false,true,false)
        os.execute(sleep(20))
    panel:getModulatorByName("T4-AFT-MOD1-SENSITIVITY"):setModulatorValue(0,false,true,false)
        os.execute(sleep(20))
    panel:getModulatorByName("T4-AFT-MOD2-DESTINY"):setModulatorValue(0,false,true,false)        
        os.execute(sleep(20))
    panel:getModulatorByName("T4-AFT-MOD2-SENSITIVITY"):setModulatorValue(0,false,true,false)
        os.execute(sleep(20))
    panel:getModulatorByName("T4-AFT-MOD3-DESTINY"):setModulatorValue(0,false,true,false)
        os.execute(sleep(20))
    panel:getModulatorByName("T4-AFT-MOD3-SENSITIVITY"):setModulatorValue(0,false,true,false)        
        os.execute(sleep(20))
    panel:getModulatorByName("T4-AFT-MOD4-DESTINY"):setModulatorValue(0,false,true,false)
        os.execute(sleep(20))
    panel:getModulatorByName("T4-AFT-MOD4-SENSITIVITY"):setModulatorValue(0,false,true,false)
        os.execute(sleep(20))

        
    panel:getModulatorByName("T4-EXP-MOD1-DESTINY"):setModulatorValue(0,false,true,false)       
        os.execute(sleep(20))
    panel:getModulatorByName("T4-EXP-MOD1-SENSITIVITY"):setModulatorValue(0,false,true,false)     
        os.execute(sleep(20))
    panel:getModulatorByName("T4-EXP-MOD2-DESTINY"):setModulatorValue(0,false,true,false)
        os.execute(sleep(20))
    panel:getModulatorByName("T4-EXP-MOD2-SENSITIVITY"):setModulatorValue(0,false,true,false)       
        os.execute(sleep(20))
    panel:getModulatorByName("T4-EXP-MOD3-DESTINY"):setModulatorValue(0,false,true,false)        
        os.execute(sleep(20))
    panel:getModulatorByName("T4-EXP-MOD3-SENSITIVITY"):setModulatorValue(0,false,true,false)       
        os.execute(sleep(20))
    panel:getModulatorByName("T4-EXP-MOD4-DESTINY"):setModulatorValue(0,false,true,false)     
        os.execute(sleep(20))
    panel:getModulatorByName("T4-EXP-MOD4-SENSITIVITY"):setModulatorValue(0,false,true,false)
        os.execute(sleep(20))

   
    panel:getModulatorByName("T4-LFO1-WAVEFORM"):setModulatorValue(0,false,true,false)      
        os.execute(sleep(20))
    panel:getModulatorByName("T4-LFO1-OFFSET"):setModulatorValue(2,false,true,false)               
        os.execute(sleep(20))
    panel:getModulatorByName("T4-LFO1-SYNCRO-SW"):setModulatorValue(1,false,true,false)     
        os.execute(sleep(20))
    panel:getModulatorByName("T4-LFO1-RATE"):setModulatorValue(60,false,true,false)        
        os.execute(sleep(20))
    panel:getModulatorByName("T4-LFO1-DELAY"):setModulatorValue(0,false,true,false)        
        os.execute(sleep(20))
    panel:getModulatorByName("T4-LFO1-FADETYPE-SW"):setModulatorValue(0,false,true,false)     
        os.execute(sleep(20))
    panel:getModulatorByName("T4-LFO1-FADETIME"):setModulatorValue(0,false,true,false)      
        os.execute(sleep(20))
    panel:getModulatorByName("T4-LFO1-PITCHDEPTH"):setModulatorValue(0,false,true,false)       
        os.execute(sleep(20))
    panel:getModulatorByName("T4-LFO1-TVFDEPTH"):setModulatorValue(0,false,true,false)        
        os.execute(sleep(20))
    panel:getModulatorByName("T4-LFO1-TVADEPTH"):setModulatorValue(0,false,true,false)
        os.execute(sleep(20))

 
    panel:getModulatorByName("T4-LFO2-WAVEFORM"):setModulatorValue(0,false,true,false)     
        os.execute(sleep(20))
    panel:getModulatorByName("T4-LFO2-OFFSET"):setModulatorValue(2,false,true,false)     
        os.execute(sleep(20))
    panel:getModulatorByName("T4-LFO2-SYNCRO-SW"):setModulatorValue(1,false,true,false)    
        os.execute(sleep(20))
    panel:getModulatorByName("T4-LFO2-RATE"):setModulatorValue(60,false,true,false)
        os.execute(sleep(20))
    panel:getModulatorByName("T4-LFO2-DELAY"):setModulatorValue(0,false,true,false)   
        os.execute(sleep(20))
    panel:getModulatorByName("T4-LFO2-FADETYPE-SW"):setModulatorValue(0,false,true,false)       
        os.execute(sleep(20))
    panel:getModulatorByName("T4-LFO2-FADETIME"):setModulatorValue(0,false,true,false)       
        os.execute(sleep(20))
    panel:getModulatorByName("T4-LFO2-PITCHDEPTH"):setModulatorValue(0,false,true,false)   
        os.execute(sleep(20))
    panel:getModulatorByName("T4-LFO2-TVFDEPTH"):setModulatorValue(0,false,true,false)   
        os.execute(sleep(20))
    panel:getModulatorByName("T4-LFO2-TVADEPTH"):setModulatorValue(0,false,true,false)
        os.execute(sleep(20))


    panel:getModulatorByName("T4-PITCH-PITCHCOARSE"):setModulatorValue(0,false,true,false)             
        os.execute(sleep(20))
    panel:getModulatorByName("T4-PITCH-FINEPITCH"):setModulatorValue(0,false,true,false)       
        os.execute(sleep(20))
    panel:getModulatorByName("T4-PITCH-RANDOMPITCH"):setModulatorValue(0,false,true,false) 
        os.execute(sleep(20))
    panel:getModulatorByName("T4-PITCH-KFPITCH"):setModulatorValue(12,false,true,false)      
        os.execute(sleep(20))
    panel:getModulatorByName("T4-PITCH-VELOCITYLEVEL"):setModulatorValue(0,false,true,false)              
        os.execute(sleep(20))
    panel:getModulatorByName("T4-PITCH-T1VELOCITY"):setModulatorValue(7,false,true,false)     
        os.execute(sleep(20))
    panel:getModulatorByName("T4-PITCH-T4VELOCITY"):setModulatorValue(7,false,true,false)     
        os.execute(sleep(20))
    panel:getModulatorByName("T4-PITCH-KFTIME"):setModulatorValue(7,false,true,false)     
        os.execute(sleep(20))
    panel:getModulatorByName("T4-PITCH-ENVDEPTH"):setModulatorValue(0,false,true,false)
        os.execute(sleep(20))

   
    panel:getModulatorByName("T4-PITCH-ENV-T1"):setModulatorValue(0,false,true,false)      
        os.execute(sleep(20))
    panel:getModulatorByName("T4-PITCH-ENV-L1"):setModulatorValue(0,false,true,false)
        os.execute(sleep(20))
    panel:getModulatorByName("T4-PITCH-ENV-T2"):setModulatorValue(0,false,true,false)       
        os.execute(sleep(20))
    panel:getModulatorByName("T4-PITCH-ENV-L2"):setModulatorValue(0,false,true,false)     
        os.execute(sleep(20))
    panel:getModulatorByName("T4-PITCH-ENV-T3"):setModulatorValue(0,false,true,false)    
        os.execute(sleep(20))
    panel:getModulatorByName("T4-PITCH-ENV-L3"):setModulatorValue(0,false,true,false)   
        os.execute(sleep(20))
    panel:getModulatorByName("T4-PITCH-ENV-T4"):setModulatorValue(0,false,true,false)  
        os.execute(sleep(20))
    panel:getModulatorByName("T4-PITCH-ENV-L4"):setModulatorValue(0,false,true,false)
        os.execute(sleep(20))


    panel:getModulatorByName("T4-TVF-FILTERMODE"):setModulatorValue(1,false,true,false)    
        os.execute(sleep(20))
    panel:getModulatorByName("T4-TVF-CUTOFFFREQ"):setModulatorValue(127,false,true,false)      
        os.execute(sleep(20))
    panel:getModulatorByName("T4-TVF-RESONANCE"):setModulatorValue(0,false,true,false)        
        os.execute(sleep(20))
    panel:getModulatorByName("T4-TVF-RESONANCETYPE"):setModulatorValue(0,false,true,false)       
        os.execute(sleep(20))
    panel:getModulatorByName("T4-TVF-KFCUTOFF"):setModulatorValue(5,false,true,false)
        os.execute(sleep(20))
    panel:getModulatorByName("T4-TVF-VELOCITYCURVE"):setModulatorValue(0,false,true,false)
        os.execute(sleep(20))
    panel:getModulatorByName("T4-TVF-ENVVELOCITY"):setModulatorValue(0,false,true,false)
        os.execute(sleep(20))
    panel:getModulatorByName("T4-TVF-T1VELOCITY"):setModulatorValue(7,false,true,false)                
        os.execute(sleep(20))
    panel:getModulatorByName("T4-TVF-T4VELOCITY"):setModulatorValue(7,false,true,false)
        os.execute(sleep(20))
    panel:getModulatorByName("T4-TVF-KFTIME"):setModulatorValue(7,false,true,false)      
        os.execute(sleep(20))
    panel:getModulatorByName("T4-TVF-ENVDEPTH"):setModulatorValue(0,false,true,false)      
           os.execute(sleep(20))


    panel:getModulatorByName("T4-TVF-ENV-T1"):setModulatorValue(0,false,true,false)
        os.execute(sleep(20))
    panel:getModulatorByName("T4-TVF-ENV-L1"):setModulatorValue(0,false,true,false) 
        os.execute(sleep(20))
    panel:getModulatorByName("T4-TVF-ENV-T2"):setModulatorValue(0,false,true,false)
        os.execute(sleep(20))
    panel:getModulatorByName("T4-TVF-ENV-L2"):setModulatorValue(0,false,true,false)
        os.execute(sleep(20))
    panel:getModulatorByName("T4-TVF-ENV-T3"):setModulatorValue(0,false,true,false)     
        os.execute(sleep(20))
    panel:getModulatorByName("T4-TVF-ENV-L3"):setModulatorValue(0,false,true,false)    
        os.execute(sleep(20))
    panel:getModulatorByName("T4-TVF-ENV-T4"):setModulatorValue(0,false,true,false)
        os.execute(sleep(20))
    panel:getModulatorByName("T4-TVF-ENV-L4"):setModulatorValue(0,false,true,false)
        os.execute(sleep(20))


    panel:getModulatorByName("T4-LEVEL"):setModulatorValue(127,false,true,false)
        os.execute(sleep(20))
    panel:getModulatorByName("T4-TVA-KFLEVEL"):setModulatorValue(7,false,true,false)  
        os.execute(sleep(20))
    panel:getModulatorByName("T4-PAN"):setModulatorValue(0,false,true,false)
         os.execute(sleep(20))

    
    panel:getModulatorByName("T4-TVA-KFPAN"):setModulatorValue(7,false,true,false)    
        os.execute(sleep(20))
    panel:getModulatorByName("T4-TVA-TONEDELAY"):setModulatorValue(0,false,true,false)      
        os.execute(sleep(20))
    panel:getModulatorByName("T4-TVA-DELAYTIME"):setModulatorValue(0,false,true,false)        
        os.execute(sleep(20))
    panel:getModulatorByName("T4-TVA-VELOCITYCURVE"):setModulatorValue(0,false,true,false)
        os.execute(sleep(20))
    panel:getModulatorByName("T4-TVA-VELOCITYLEVEL"):setModulatorValue(32,false,true,false)
        os.execute(sleep(20))
    panel:getModulatorByName("T4-TVA-T1VELOCITY"):setModulatorValue(7,false,true,false)
        os.execute(sleep(20))
    panel:getModulatorByName("T4-TVA-T4VELOCITY"):setModulatorValue(7,false,true,false)      
        os.execute(sleep(20))
    panel:getModulatorByName("T4-TVA-KFTIME"):setModulatorValue(7,false,true,false)
        os.execute(sleep(20))


    panel:getModulatorByName("T4-TVA-ENV-T1"):setModulatorValue(0,false,true,false)
        os.execute(sleep(20))
    panel:getModulatorByName("T4-TVA-ENV-L1"):setModulatorValue(127,false,true,false)
        os.execute(sleep(20))
    panel:getModulatorByName("T4-TVA-ENV-T2"):setModulatorValue(0,false,true,false)    
        os.execute(sleep(20))
    panel:getModulatorByName("T4-TVA-ENV-L2"):setModulatorValue(127,false,true,false)
        os.execute(sleep(20))
    panel:getModulatorByName("T4-TVA-ENV-T3"):setModulatorValue(0,false,true,false)
        os.execute(sleep(20))
    panel:getModulatorByName("T4-TVA-ENV-L3"):setModulatorValue(127,false,true,false)
        os.execute(sleep(20))
    panel:getModulatorByName("T4-TVA-ENV-T4"):setModulatorValue(50,false,true,false)
        os.execute(sleep(20))


    panel:getModulatorByName("T4-DRY"):setModulatorValue(127,false,true,false)
        os.execute(sleep(20))
    panel:getModulatorByName("T4-REVERB"):setModulatorValue(0,false,true,false)
        os.execute(sleep(20))
    panel:getModulatorByName("T4-CHORUS"):setModulatorValue(0,false,true,false)
        os.execute(sleep(20))
    panel:getModulatorByName("T4-BUS"):setModulatorValue(0,false,true,false)
        os.execute(sleep(20))

    end


    if x==false then
    
        return
    
    end

       
end