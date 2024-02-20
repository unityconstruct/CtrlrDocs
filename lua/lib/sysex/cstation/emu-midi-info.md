# emu midi info

## MIDI Device Inquiry Responses
### Family
|  |  |  |
| - | - | -
| MSB | 0x04 | (Musical Instruments) |
| LSB | 0x04 | (ROM Players) |
### Members
|  |  |  |
| - | - | - |
| MSB | 0x00 | (Proteus 2000 series) |
| LSB | 0x02 | Audity 2000 |
|  | 0x03 | Proteus 2000 |
|  | 0x04 | B-3 |
|  | 0x05 | XL-1 |
|  | 0x06 | Virtuoso 2000 |
|  | 0x07 | Mo’Phatt |
|  | 0x08 | B-3 Turbo |
|  | 0x09 | XL-1 Turbo |
|  | 0x0A | Mo’Phatt Turbo |
|  | 0x0B | Planet Earth |
|  | 0x0C | Planet Earth Turbo |
|  | 0x0D | XL-7 |
|  | 0x0E | MP-7 |
|  | 0x0F | Proteus 2500 |
|  | 0x10 | Orbit 3 |
|  | 0x11 | PK-6 |
|  | 0x12 | XK-6 |
|  | 0x13 | MK-6 |
|  | 0x14 | Halo |
|  | 0x15 | Proteus 1000 |
|  | 0x16 | Vintage Pro |


## Edit Buffer

There is only one edit buffer which is used by the current preset (the preset shown in the display). You can edit only one preset at a time via SysEx commands, although these presets can be edited  independently of the current preset edited using the Front Panel. Remote Preset selection is independent of the edit buffer. Changing the current preset erases the edit buffer.

### Received Channel Commands

Channels number (n) = 0-15. Message bytes are represented in hex. All other numbers are decimal. Running Status is supported.
 
| Command   | Message   | Comments  |
| - | - | - |
| Note Off   | 8n kk vv     |
| Note On   | 9n kk vv   | velocity 0 = note off |
| Key Aftertouch   | An kk vv   | kk = 0-127 vv = 0-127 |
| Program Change   | Cn vv   | 0-127 |
| Channel Aftertouch   | Dn vv   | 0-127 |
| Pitch Bend   | En ll mm   | l = lsb, m = msb |
| Real-time Controller   | Bn cc vv   | cc = 00-31, 64-95 |
| Footswitch   | Bn cc vv   | cc = 64-79, vv ≥ 64 = on |
| Volume   | Bn 07 vv   | 0-127 |
| Pan   | Bn 0A vv   | 0=left, 127=right, 64=center |
| All Sound Off   | Bn 78 00   | turns all sound off |
| Reset All Controllers   | Bn 79 00   | ignored in omni mode |
| All Notes Off   | Bn 7B 00   | ignored in omni mode |
| Omni Mode Off*   | Bn 7C 00   | forces all notes & controls off |
| Omni Mode On*   | Bn 7D 00   | forces all notes & controls off |
| Mono Mode On (Poly Off)*   | Bn 7E 00   | forces all notes & controls off |
| Poly Mode On (Mono Off)*   | Bn 7F 00   | forces all notes & controls off |
| Bank Select MSB   | Bn 00 bb   | bb = bank MSB (see page 180) |
| Bank Select LSB   | Bn 20 bb   | bb = bank LSB (see page 180) |

Special Notes
| From | To |
| - | - |
| From Omni Mode | Omni Off turns Poly On.  |
| From Poly Mode | Omni On turns Omni On; Mono On turns Mono On. |
| From Mono Mode | Mono Off turns Poly On; Omni On turns Omni On. |
| From Multi Mode | Omni On turns Omni On; Omni Off or Mono Off turns Poly On; Mono On turns Mono On.  |
| All other changes have no effect. |  |



### MIDI Implementation
NOTES:
 - XL-7 can transmit and receive ANY continuous controller number from 1 to 95. Because of XL-7’s  powerful synth engine, many of the standard MIDI controllers can be user programmed to provide the desired function. A “Yes” response in this chart means that a controller is programmed by default in XL-7.
    - Controller 79 is hard-coded to the Mix Output parameter.
        - 0=Use Preset, 1=Send 1, 2=Send 2, 3=Send 3, 4=Send 4
    - Controller 80 is hard-coded to the Arp Status parameter.
        - 0=Off, 1=On, 2=P (preset), 3=M (master)
    - Value of 0 = reset all except vol & pan; value of 127 = reset all.
        - Other: Pan: -64 = hard left, +63 = hard right






















### RAW Data

#### Special Notes	
From Omni Mode	Omni Off turns Poly On. 
From Poly Mode	Omni On turns Omni On; Mono On turns Mono On.
From Mono Mode	Mono Off turns Poly On; Omni On turns Omni On.
From Multi Mode	Omni On turns Omni On; Omni Off or Mono Off turns Poly On; Mono On turns Mono On. 
All other changes have no effect. 	

#### Received Channel Commands

Command 	Message 	Comments 
Note Off 	8n kk vv    
Note On 	9n kk vv 	velocity 0 = note off
Key Aftertouch 	An kk vv 	kk = 0-127 vv = 0-127
Program Change 	Cn vv 	0-127
Channel Aftertouch 	Dn vv 	0-127
Pitch Bend 	En ll mm 	l = lsb, m = msb
Real-time Controller 	Bn cc vv 	cc = 00-31, 64-95
Footswitch 	Bn cc vv 	cc = 64-79, vv ≥ 64 = on
Volume 	Bn 07 vv 	0-127
Pan 	Bn 0A vv 	0=left, 127=right, 64=center
All Sound Off 	Bn 78 00 	turns all sound off
Reset All Controllers 	Bn 79 00 	ignored in omni mode
All Notes Off 	Bn 7B 00 	ignored in omni mode
Omni Mode Off* 	Bn 7C 00 	forces all notes & controls off
Omni Mode On* 	Bn 7D 00 	forces all notes & controls off
Mono Mode On (Poly Off)* 	Bn 7E 00 	forces all notes & controls off
Poly Mode On (Mono Off)* 	Bn 7F 00 	forces all notes & controls off
Bank Select MSB 	Bn 00 bb 	bb = bank MSB (see page 180)
Bank Select LSB 	Bn 20 bb 	bb = bank LSB (see page 180)