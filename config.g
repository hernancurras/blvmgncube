; Configuration file for Duet WiFi (firmware version 3)
; executed by the firmware on start-up
;
; generated by RepRapFirmware Configuration Tool v3.1.3 on Sat Jul 04 2020 19:19:39 GMT-0300 (Argentina Standard Time)

; General preferences
G90                                            ; send absolute coordinates...
M83                                            ; ...but relative extruder moves
M550 P"BLV MGN Cube"                           ; set printer name
M669 K1                                        ; select CoreXY mode

; Network
M551 P"admin"                               ; set password
M552 S1                                        ; enable network
M586 P0 S1                                     ; enable HTTP
M586 P1 S1                                     ; enable FTP
M586 P2 S1                                     ; enable Telnet

; Drives
M569 P0 S1                                     ; physical drive 0 goes forwards
M569 P1 S1                                     ; physical drive 1 goes forwards
M569 P2 S0                                     ; physical drive 2 goes backwards
M569 P3 S0                                     ; physical drive 3 goes backwards
M584 X0 Y1 Z2 E3                               ; set drive mapping
M350 X16 Y16 Z16 E16 I1                        ; configure microstepping with interpolation
M92 X200.00 Y200.00 Z800.00 E415.00            ; Set steps per mm.  Initially E405.18 or 413-415, Ballscrew 200*16/4 = 800 (200 steps, 
M566 X800 Y800 Z24 E300    					   ; set maximum instantaneous speed changes (mm/min)
M203 X20000 Y20000 Z600 E8000				   ; set maximum speeds (mm/min)
M201 X3000.00 Y3000.00 Z100.00 E5000.00        ; set accelerations (mm/s^2)
M906 X1600 Y1600 Z1600 E1600 I30               ; set motor currents (mA) and motor idle factor in per cent
M84 S30                                        ; Set idle timeout

; Axis Limits
M208 X-23 Y0 Z0 S1                             ; set axis minima
M208 X320 Y321 Z350 S0                         ; set axis maxima

; Endstops
M574 X1 S1 P"xstop"                            ; configure active-high endstop for low end on X via pin xstop
M574 Y2 S1 P"ystop"                            ; configure active-high endstop for high end on Y via pin ystop
M574 Z1 S2                                     ; configure Z-probe endstop for low end on Z

; Z-Probe
M950 S0 C"duex.pwm5"                           ; create servo pin 0 for BLTouch
M558 P9 C"zprobe.in+zprobe.mod" H5 F120 T6000  ; set Z probe type to bltouch and the dive height + speeds
G31 P500 X28.5 Y-5 Z1.9                        ; set Z probe trigger value, offset and trigger height
M557 X25:300 Y25:300 S80                        ; define mesh grid

; Heaters
M308 S0 P"bedtemp" Y"thermistor" T100000 B4138 ; configure sensor 0 as thermistor on pin bedtemp
M950 H0 C"bedheat" T0                          ; create bed heater output on bedheat and map it to sensor 0
M307 H0 A224.4 C456.9 D8.2 V24.0 B0 S1.00      ; disable bang-bang mode for the bed heater and set PWM limit
M140 H0                                        ; map heated bed to heater 0
M143 H0 S140                                   ; set temperature limit for heater 0 to 140C
M308 S1 P"e0temp" Y"thermistor" T100000 B4138  ; configure sensor 1 as thermistor on pin e0temp
M950 H1 C"e0heat" T1                           ; create nozzle heater output on e0heat and map it to sensor 1
M307 H1 A293.4 C80.9 D7.1 V24.0 B0 B0 S1.00    ; disable bang-bang mode for heater  and set PWM limit

; Fans
M950 F0 C"fan0" Q500                           ; create fan 0 on pin fan0 and set its frequency
M106 P0 C"LAYER_FAN" S0 H-1                    ; set fan 0 name and value. Thermostatic control is turned off
M950 F1 C"fan1" Q500                           ; create fan 1 on pin fan1 and set its frequency
M106 P1 C"E3D_FAN" S0 H1:1 T35                 ; set fan 1 name and value. Thermostatic control is turned on

; Tools
M563 P0 S"E3Dv6" D0 H1 F0                      ; define tool 0
G10 P0 X0 Y0 Z0                                ; set tool 0 axis offsets
G10 P0 R0 S0                                   ; set initial tool 0 active and standby temperatures to 0C

; Custom settings are not defined

; Miscellaneous
M575 P1 S1 B57600                              ; enable support for PanelDue
