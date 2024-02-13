
-- ### This function creates a patch list per bank by user definition


patchList = function(mod, event)



    myCombo1 = panel:getComponent("PATCH-SELECT")
        
    
    comboValue = panel:getModulatorByName("BANK-SELECT"):getModulatorValue()


	
          
    if comboValue==00 then -- Set names for BANK A

		
		panel:getModulatorByName("PATCH-SELECT"):setModulatorValue(0,false,true,false)

           
        myCombo1:setProperty ("uiComboContent", "A01:A.Piano 1=000\nA02:A.Piano 2=001\nA03:Mellow Piano=002\nA04:Pop Piano 1=003\nA05:Pop Piano 2=004\nA06:Pop Piano 3=005\nA07: MIDIed Grand=006\nA08:Country Bar=007\nA09:Glist EPiano=008\nA10:MIDI EPiano=009\nA11:SA Rhodes=010\nA12:Dig Rhodes 1=011\nA13:Dig Rhodes 2=012\nA14:Stiky Rhodes=013\nA15:Guitr Rhodes=014\nA16:Nylon Rhodes=015\nA17:Clav 1=016\nA18:Clav 2=017\nA19:Marimba=018\nA20:Marimba SW=019\nA21:Warm Vibe=020\nA22:Vibe=021\nA23:Wave Bells=022\nA24:Vibrobell=023\nA25:Pipe Organ 1=024\nA26:Pipe Organ 2=025\nA27:Pipe Organ 3=026\nA28:E.Organ 1=027\nA29:E.Organ 2=028\nA30:Jazz Organ 1=029\nA31:Jazz Organ 2=030\nA32:Metal Organ=031\nA33:Nylon Gtr 1=032\nA34:Flanged Nyln=033\nA35:Steel Guitar=034\nA36:PickedGuitar=035\nA37:12 strings=036\nA38:Velo Harmnix=037\nA39:Nylon+Steel=038\nA40:SwitchOnMute=039\nA41:JC Strat=040\nA42:Stratus=041\nA43:Syn Strat=042\nA44:Pop Strat=043\nA45:Clean Strat=044\nA46:Funk Gtr=045\nA47:Syn Guitar=046\nA48:Overdrive=047\nA49:Fretless=048\nA50:St Fretless=049\nA51:Woody Bass 1=050\nA52:Woody Bass 2=051\nA53:Analog Bs 1=052\nA54:House Bass=053\nA55:Hip Bass=054\nA56:RockOut Bass=055\nA57:Slap Bass=056\nA58:Thumpin Bass=057\nA59:Pick Bass=058\nA60:Wonder Bass=059\nA61:Yowza Bass=060\nA62:Rubber Bs 1=061\nA63:Rubber Bs 2=062\nA64:Stereoww Bs=063\n", false)
            
    
	end



	if comboValue==01 then -- Set names for BANK B


  		panel:getModulatorByName("PATCH-SELECT"):setModulatorValue(0,false,true,false)
        

		myCombo1:setProperty ("uiComboContent", "B01:Pizzicato=064\nB02:Real Pizz=065\nB03:Harp=066\nB04:SoarinString=067\nB05:Warm Strings=068\nB06:Marcato=069\nB07:St Strings=070\nB08:Orch Strings=071\nB09:Slow Strings=072\nB10:Velo Strings=073\nB11:BrightStrngs=074\nB12:TremoloStrng=075\nB13:Orch Stab 1=076\nB14:Brite Stab=077\nB15:JP-8 Strings=078\nB16:String Synth=079\nB17:Wire Strings=080\nB18:New Age Vox=081\nB19:Arasian Morn=082\nB20:Beauty Vox=083\nB21:Vento Voxx=084\nB22:Pvox Oooze=085\nB23:GlassVoices=086\nB24:Space Ahh=087\nB25:Trumpet=088\nB26:Trombone=089\nB27:Harmon Mute1=090\nB28:Harmon Mute2=091\nB29:TeaJay Brass=092\nB30:Brass Sect 1=093\nB31:Brass Sect 2=094\nB32:Brass Swell=095\nB33:Brass Combo=096\nB34:Stab Brass=097\nB35:Soft Brass=098\nB36:Horn Brass=099\nB37:French Horn=100\nB38:AltoLead Sax=101\nB39:Alto Sax=102\nB40:Tenor Sax 1=103\nB41:Tenor Sax 2=104\nB42:Sax Section=105\nB43:Sax Tp Tb=106\nB44:FlutePiccolo=107\nB45:Flute mod=108\nB46:Ocarina=109\nB47:OverblownPan=110\nB48:Air Lead=111\nB49:Steel Drum=112\nB50:Log Drum=113\nB51:Box Lead=114\nB52:Soft Lead=115\nB53:Whistle=116\nB54:Square Lead=117\nB55:Touch Lead=118\nB56:NightShade=119\nB57:Pizza Hutt=120\nB58:EP+Exp Pad=121\nB59:JP-8 Pad=122\nB60:Puff=123\nB61:SpaciosSweep=124\nB62:Big n Beefy=125\nB63:RevCymBend=126\nB64:Analog Seq=127\n", false)
       

 	end



    if comboValue==02 then -- Set names for USER

       
		panel:getModulatorByName("PATCH-SELECT"):setModulatorValue(0,false,true,false)


		myCombo1:setProperty ("uiComboContent", "I01:JV Strings=000\nI02:BrightGuitar=001\nI03:Von Greece=002\nI04:Brass Sect.=003\nI05:SA Rhodes !!=004\nI06:Pan Pipe=005\nI07:Slap !!!=006\nI08:DooWah Diddy=007\nI09:A.Piano 3=008\nI10:Turbo Sax=009\nI11:Orch Stab 2=010\nI12:Analog Pad 1=011\nI13:Great Church=012\nI14:Rubber Bs 3=013\nI15:Analog Brass=014\nI16:X/Y/Z=015\nI17:Lumber Jacow=016\nI18:Nylon Gtr 2=017\nI19:YASURAGI=018\nI20:House Hunter=019\nI21:Might Pad=020\nI22:SAW Lead=021\nI23:Ice Hall=022\nI24:Organarimba=023\nI25:Spr Trumpet=024\nI26:Min On Mute=025\nI27:P-P-P-Puff=026\nI28:Fantasia JV=027\nI29:Glasswaves=028\nI30:El.Piano=029\nI31:Jazz Organ 3=030\nI32:5-Strng Bass=031\nI33:Mute TP mod=032\nI34:JV Heaven=033\nI35:Tria Bells=034\nI36:Analog Bs 2=035\nI37:THE STRINGS=036\nI38:Hammer Bell=037\nI39:Fine Organ=038\nI40:Stackoid=039\nI41:Huff N Stuff=040\nI42:Autumn Breez=041\nI43:Toy Box=042\nI44:Anlog Horn=043\nI45:Orch  Stab 3=044\nI46:Reincarnate=045\nI47:Wave Bells 2=046\nI48:Whistle Lead=047\nI49:UTAKATA=048\nI50:Analog Pad 2=049\nI51:Dist Line=050\nI52:Super Vibe=051\nI53:Stratusphere=052\nI54:Voicey PiZZ=053\nI55:Black Brass=054\nI56:Glass Pad=055\nI57:Reso Pad=056\nI58:Hardy Winery=057\nI59:Steel Pizz=058\nI60:WhistlinAtom=059\nI61:ChuChu Vox=060\nI62:Artic Winds=061\nI63:DistanceCall=062\nI64:REVERSE MAD=063\n", false)
    

	end

	
	if comboValue==03 then -- Set names dor CARD

		
		panel:getModulatorByName("PATCH-SELECT"):setModulatorValue(0,false,true,false)

           
        myCombo1:setProperty ("uiComboContent", "C01:=64\nC02:=65\nC03:=66\nC04:=67\nC05:=68\nC06:=69\nC07:=70\nC08:=71\nC09:=72\nC10:=73\nC11:=74\nC12:=75\nC13:=76\nC14:=77\nC15:=78\nC16:=79\nC17:=80\nC18:=81\nC19:=82\nC20:=83\nC21:=84\nC22:=85\nC23:=86\nC24:=87\nC25:=88\nC26:=89\nC27:=90\nC28:=91\nC29:=92\nC30:=93\nC31:=94\nC32:=95\nC33:=96\nC34:=97\nC35:=98\nC36:=99\nC37:=100\nC38:=101\nC39:=102\nC40:=103\nC41:=104\nC42:=105\nC43:=106\nC44:=107\nC45:=108\nC46:=109\nC47:=110\nC48:=111\nC49:=112\nC50:=113\nC51:=114\nC52:=115\nC53:=116\nC54:=117\nC55:=118\nC56:=119\nC57:=120\nC58:=121\nC59:=122\nC60:=123\nC61:=124\nC62:=125\nC63:=126\nC64:=127\n", false)
    
    
    end


end