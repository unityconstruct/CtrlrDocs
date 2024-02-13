--************************************************
--************************************************
--This function refresh all patch parameters******
--************************************************
--************************************************

callBackAll = function()


    mySysex = CtrlrMidiMessage({0xF0, 0x41, 0x10, 0x46, 0x11, 0x00, 0x08, 0x20, 0x00, 0x00, 0x01, 0x0F, 0x02, 0x46, 0xF7})
    
    panel:sendMidiMessageNow(mySysex)


end