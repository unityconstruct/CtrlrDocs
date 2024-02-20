#!/usr/bin/lua

local sysex = "F0180F00551C1E00230010001500030020000900557365722053657475702020202020200001010000000000020000000100010000000100000002007F7F7F7F0000000000000E0000003E007F7F0100000005000100000000000000010001000200000000004A00470019001A0049004B005500480040004100420011001000010020014E004D001B001C00010003005200530001000000000000000000000000000100000001002800600000000A0014001E000100000003000000000000000000000000000100000000000A00000001000000010000000000000000000000000000007F000000030000000000000000007F7F1F0003017F0040007F7F0000010000000100000001007F0040007F7F0000010000000100000002007F0040007F"
local sysexHeader = ""
local function parseSysex(sysexString)
    local size = #sysexString
    if ((size % 2) ~= 0) then
        return {}
    end
    local dump = {}
    local get = ""
    for i=1,#sysex,2 do
        get = string.sub(sysex,i,i+1)
        dump[#dump+1] = get
        print(tostring(i)..": ["..tostring(get).."]")
    end
    return dump
end

SysexSpec = {}
function SysexSpec:new()
    setmetatable({},SysexSpec)
    self.PRESET_NAME_CHAR_0_899 = 1
    self.PRESET_NAME_CHAR_1_900 = 2
    self.PRESET_NAME_CHAR_2_901 = 3
    self.PRESET_NAME_CHAR_3_902 = 4
    self.PRESET_NAME_CHAR_4_903 = 5
    self.PRESET_NAME_CHAR_5_904 = 6
    self.PRESET_NAME_CHAR_6_905 = 7
    self.PRESET_NAME_CHAR_7_906 = 8
    self.PRESET_NAME_CHAR_8_907 = 9
    self.PRESET_NAME_CHAR_9_908 = 10
    self.PRESET_NAME_CHAR_10_909 = 11
    self.PRESET_NAME_CHAR_11_910 = 12
    self.PRESET_NAME_CHAR_12_911 = 13
    self.PRESET_NAME_CHAR_13_912 = 14
    self.PRESET_NAME_CHAR_14_913 = 15
    self.PRESET_NAME_CHAR_15_914 = 16
    self.PRESET_CTRL_A_915 = 17
    self.PRESET_CTRL_B_916 = 19
    self.PRESET_CTRL_C_917 = 21
    self.PRESET_CTRL_D_918 = 23
    self.PRESET_CTRL_E_919 = 25
    self.PRESET_CTRL_F_920 = 27
    self.PRESET_CTRL_G_921 = 29
    self.PRESET_CTRL_H_922 = 31
    self.PRESET_KBD_TUNE_923 = 33
    self.PRESET_CTRL_I_924 = 35
    self.PRESET_CTRL_J_925 = 37
    self.PRESET_CTRL_K_926 = 39
    self.PRESET_CTRL_L_927 = 41
    self.PRESET_CTRL_M_967 = 43
    self.PRESET_CTRL_N_968 = 45
    self.PRESET_CTRL_O_969 = 47
    self.PRESET_CTRL_P_970 = 49
    self.PRESET_RIFF_928 = 51
    self.PRESET_RIFF_ROM_ID_929 = 53
    self.PRESET_TEMPO_OFFSET_930 = 55
    self.PRESET_CORD_0_SOURCE_931 = 57
    self.PRESET_CORD_0_DEST_932 = 59
    self.PRESET_CORD_0_AMOUNT_933 = 61
    self.PRESET_CORD_1_SOURCE_934 = 63
    self.PRESET_CORD_1_DEST_935 = 65
    self.PRESET_CORD_1_AMOUNT_936 = 67
    self.PRESET_CORD_2_SOURCE_937 = 69
    self.PRESET_CORD_2_DEST_938 = 71
    self.PRESET_CORD_2_AMOUNT_939 = 73
    self.PRESET_CORD_3_SOURCE_940 = 75
    self.PRESET_CORD_3_DEST_941 = 77
    self.PRESET_CORD_3_AMOUNT_942 = 79
    self.PRESET_CORD_4_SOURCE_943 = 81
    self.PRESET_CORD_4_DEST_944 = 83
    self.PRESET_CORD_4_AMOUNT_945 = 85
    self.PRESET_CORD_5_SOURCE_946 = 87
    self.PRESET_CORD_5_DEST_947 = 89
    self.PRESET_CORD_5_AMOUNT_948 = 91
    self.PRESET_CORD_6_SOURCE_949 = 93
    self.PRESET_CORD_6_DEST_950 = 95
    self.PRESET_CORD_6_AMOUNT_951 = 97
    self.PRESET_CORD_7_SOURCE_952 = 99
    self.PRESET_CORD_7_DEST_953 = 101
    self.PRESET_CORD_7_AMOUNT_954 = 103
    self.PRESET_CORD_8_SOURCE_955 = 105
    self.PRESET_CORD_8_DEST_956 = 107
    self.PRESET_CORD_8_AMOUNT_957 = 109
    self.PRESET_CORD_9_SOURCE_958 = 111
    self.PRESET_CORD_9_DEST_959 = 113
    self.PRESET_CORD_9_AMOUNT_960 = 115
    self.PRESET_CORD_10_SOURCE_961 = 117
    self.PRESET_CORD_10_DEST_962 = 119
    self.PRESET_CORD_10_AMOUNT_963 = 121
    self.PRESET_CORD_11_SOURCE_964 = 123
    self.PRESET_CORD_11_DEST_965 = 125
    self.PRESET_CORD_11_AMOUNT_966 = 127

end

SysexDeviceInquiry = {}
function SysexDeviceInquiry:new()
    setmetatable({},SysexDeviceInquiry)
    self.SysexDump = {}
    self.isDumpPresent = false
    self.Request = "F07E000601F7"
    self.Response = "F07E00060218ffffddddssssssssF7"

    self.Command = "06"
    self.SubCommandResponse = "02"
    self.SubCommandRequest = "01"

    self.Param_ManufacturersSysexId_Index = 6
    self.Param_DeviceFamilycode_Index = 7
    self.Param_DeviceFamilyMemberCode_Index = 9
    self.Param_DeviceFamilyMemberCode_Index = 11
    self.Param_SoftwareRevisionLevel_Index = 13

    self.Param_ManufacturersSysexId_Size = 1
    self.Param_DeviceFamilycode_Size = 2
    self.Param_DeviceFamilyMemberCode_Size = 2
    self.Param_DeviceFamilyMemberCode_Size = 2
    self.Param_SoftwareRevisionLevel_Size = 4
    self.ManufacturersSysexId = "00"
    self.DeviceFamilycode = "0000"
    self.DeviceFamilyMemberCode = "0000"
    self.DeviceFamilyMemberCode = "0000"
    self.SoftwareRevisionLevel = "00000000"
    return self
end


local function parseDeviceInquiryResponse(sysexDeviceInquiryTable)
    sysexDeviceInquiryTable = sysexDeviceInquiryTable or {}
    local syx = sysexDeviceInquiryTable
    local sysexDeviceInquiry = SysexDeviceInquiry:new()
    local get = ""
    for i=0,sysexDeviceInquiry.Param_ManufacturersSysexId_Size-1,1 do
        get = get .. tostring(syx[sysexDeviceInquiry.Param_ManufacturersSysexId_Index+i])
    end
    sysexDeviceInquiry.SysexDump = syx
    sysexDeviceInquiry.ManufacturersSysexId = get
    -- sysexDeviceInquiry.ManufacturersSysexId = 

    -- if(#sysex % 2 ~= 0) then return {} end -- invalid message length
    -- sysexDeviceInquiry.ManufacturersSysexId = string.sub(
    --     sysex,
    --     sysexDeviceInquiry.Param_ManufacturersSysexId_Index,
    --     (sysexDeviceInquiry.Param_ManufacturersSysexId_Index+sysexDeviceInquiry.Param_ManufacturersSysexId_Size)
    -- )
    -- local dump = {}
    -- for i=1,#sysex,1 do
    --     dump[#dump+1] = 
    -- end
    return sysexDeviceInquiry
end

--[[ sysex dumps ]]--


SysexDumps = {}
---common object to house ALL data dump tables
---sysex should be parsed a table, with each cell holding one hex value (2chars): ie: 'F7'
---data can then be read using the index as a position locator in the sysex dump
---@return table - table storing all dump tables
function SysexDumps:new()
    setmetatable({},SysexDumps)

    --[[ field notes
        for each dump type, there's 2 fields:
         1. dump data in a table
         2. isDump function to return true if table has data
    ]]--

    --[[ Sysex non-realtime ]]--
    self.DeviceInquiry_0601 = {}
    self.isDeviceInquiry_0601 = function() return #self.DeviceInquiry_0601 > 0 end
    --[[ sysex parameter ]]--
    self.ParameterValue_0201 = {}
    self.isParameterValue_0201 = function() return #self.ParameterValue_0201 > 0 end
    self.ParameterMinMax_03 = {}
    self.isParameterMinMax_03 = function() return #self.ParameterMinMax_03 > 0 end
    --[[ configuration ]]--
    self.HardwareConfiguration_09 = {}
    self.isHardwareConfiguration_09 = function() return #self.HardwareConfiguration_09 > 0 end
    --[[ sysem name ]]--
    self.GenericName_0B = {}
    self.isGenericName_0B = function() return #self.GenericName_0B > 0 end
    --[[ prest dump closed loop ]]--
    self.PresetDumpHeaderClosed_1001 = {}
    self.isPresetDumpHeaderClosed_1001 = function() return #self.PresetDumpHeaderClosed_1001 > 0 end
    self.PresetDumpMessageClosed_1002 = {}
    self.isPresetDumpMessageClosed_1002 = function() return #self.PresetDumpMessageClosed_1002 > 0 end
    --[[ prest dump open loop ]]--
    self.PresetDumpHeaderOpen_1003 = {}
    self.isPresetDumpHeaderOpen_1003 = function() return #self.PresetDumpHeaderOpen_1003 > 0 end
    self.PresetDumpMessageOpen_1004 = {}
    self.isPresetDumpMessageOpen_1004 = function() return #self.PresetDumpMessageOpen_1004 > 0 end
    --[[ preset common ]]--
    self.PresetCommonParams_1010 = {}
    self.isPresetCommonParams_1010 = function() return #self.PresetCommonParams_1010 > 0 end
    self.PresetCommonGeneralParams_1011 = {}
    self.isPresetCommonGeneralParams_1011 = function() return #self.PresetCommonGeneralParams_1011 > 0 end
    self.PresetCommonArpParams_1012 = {}
    self.isPresetCommonArpParams_1012 = function() return #self.PresetCommonArpParams_1012 > 0 end
    self.PresetCommonEffectsParams_1013 = {}
    self.isPresetCommonEffectsParams_1013 = function() return #self.PresetCommonEffectsParams_1013 > 0 end
    self.PresetCommonLinkParams_1014 = {}
    self.isPresetCommonLinkParams_1014 = function() return #self.PresetCommonLinkParams_1014 > 0 end
    --[[ preset layer ]]--
    self.PresetLayerParameters_1020 = {}
    self.isPresetLayerParameters_1020 = function() return #self.PresetLayerParameters_1020 > 0 end
    self.PresetLayerCommonParams_1021 = {}
    self.isPresetLayerCommonParams_1021 = function() return #self.PresetLayerCommonParams_1021 > 0 end
    self.PresetLayerFilterParams_1022 = {}
    self.isPresetLayerFilterParams_1022 = function() return #self.PresetLayerFilterParams_1022 > 0 end
    self.PresetLayerLFOParams_1023 = {}
    self.isPresetLayerLFOParams_1023 = function() return #self.PresetLayerLFOParams_1023 > 0 end
    self.PresetLayerEnvelopeParams_1024 = {}
    self.isPresetLayerEnvelopeParams_1024 = function() return #self.PresetLayerEnvelopeParams_1024 > 0 end
    self.PresetLayerPatchcordParams_1035 = {}
    self.isPresetLayerPatchcordParams_1035 = function() return #self.PresetLayerPatchcordParams_1035 > 0 end
    --[[ setup ]]--
    self.SetupDump_1C = {}
    self.isSetupDump_1C = function() return #self.SetupDump_1C > 0 end

    --[[ not used 
    -- self.GenericDumpRequest_61000100 = {}
    -- self.PresetDumpRequest = {}
    -- self.isDumpRequest = function() return #self.DumpRequest > 0 end
    ]]--

    return self
end

local sysD = SysexDumps:new()
print("size: " .. #sysD.ParameterMinMax_03 .. " is: " .. tostring(sysD.isParameterMinMax_03()))







--[[ tests ]]--
local syxDumpTable = parseSysex(sysex)
print(table.concat(syxDumpTable,","))

-- local sysexDeviceInquiry_Test = SysexDeviceInquiry:new()
-- local thisvalue = sysexDeviceInquiry_Test.Param_ManufacturersSysexId_Index
-- print(thisvalue)

local sysexDump = parseSysex(sysex)

local sysexDeviceInquiry = parseDeviceInquiryResponse(sysexDump)

print(tostring(sysexDeviceInquiry.ManufacturersSysexId))






--[[ info ]]--

--[[ Sysex non-realtime ]]--
--[[
    DeviceInquiry_0602
    BulkTuning_0801
]]--


--[[ Sysex ]]--
--[[
ParameterValue_0201
ParameterMinMax_03
GenericName_0B

HardwareConfiguration_09
DumpRequest
PresetDumpHeaderClosed_1001
PresetDumpMessageClosed_1002
PresetDumpHeaderOpen_1003
PresetDumpMessageOpen_1004
PresetCommonParams_1010
PresetCommonGeneralParams_1011
PresetCommonArpParams_1012
PresetCommonEffectsParams_1013
PresetCommonLinkParams_1014
PresetLayerParameters_1020
PresetLayerCommonParams_1021
PresetLayerFilterParams_1022
PresetLayerLFOParams_1023
PresetLayerEnvelopeParams_1024
PresetLayerPatchcordParams_1035
]]--


--[[ Preset Dump SubCommands [10] ]]--
--[[
    00h (reserved)
    01h Preset Dump Header Closed Loop
    02h Preset Dump Data Message Closed Loop
    03h Preset Dump Header Open Loop
    04h Preset Dump Data Message Open Loop
    10h Preset Common Dump Data Message
    11h Preset Common General Dump Data Message
    12h Preset Common Arp Dump Data Message
    13h Preset Common Effects Dump Data Message (Master or Preset)
    14h Preset Common Links Dump Data Message
    20h Preset Layer Dump Data Message
    21h Preset Layer Common Dump Data Message
    22h Preset Layer Filter Dump Data Message
    23h Preset Layer LFO Dump Data Message
    24h Preset Layer Envelopes Dump Data Message
    25h Preset Layer PatchCords Dump Data Message
]]--
