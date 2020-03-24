; BLV Mgn Cube config file for Duet2 Wifi firmware

; Prologue and  comms section
M111 S0                             ; Debug off
M550 PBLV Mgn Cube 	            ; Machine name (can be anything you like)
M551 Preprap                        ; Machine password

; General preferences
M80				    ; Turns on the ATX power supply
G90                                 ; Send absolute coordinates...
M83                                 ; ...but relative extruder moves
M667 S1                             ; Select CoreXY mode

;*** If you have more than one Duet on your network, they must all have different MAC addresses, so change the last digits
M540 P0xBE:0xEF:0xDE:0xAD:0xFE:0xED ; MAC Address

;*** Adjust the IP address and gateway in the following 2 lines to suit your network		  
M552 S1
M552 P0.0.0.0
M554 P192.168.1.1                   ; Gateway
M553 P255.255.255.0                 ; Netmask
M586 P0 S1                          ; Enable HTTP
M555 P2                             ; Set output to look like Marlin
M575 P1 B57600 S1		    ; Comms parameters for PanelDue

; Movement section
M569 P0 S1                                         ; Drive X goes forwards
M569 P1 S1                                         ; Drive Y goes forwards
M569 P2 S0                                         ; Drive Z1-Z2 goes backwards
M569 P3 S0                                         ; Drive Extruder goes backwards

M350 X16 Y16 Z16 E16 I1                            ; Configure microstepping with interpolation
M92 X200 Y200 Z800 E415                            ; Set steps per mm.  Initially E405.18 or 413-415, Ballscrew 200*16/4 = 800 (200 steps, 16 microstepping, 4 pitch)
M201 X3000 Y3000 Z100 E5000		           ; Set accelerations (mm/s^2)
M203 X20000 Y20000 Z600 E8000                      ; Set maximum speeds (mm/min)   
M566 X800 Y800 Z24 E300                            ; Set maximum instantaneous speed changes (Jerk) (mm/min)

M906 X1600 Y1600 Z1600 E1600 I30                   ; Set motor currents (mA) and motor idle factor in per cent
M84 S30                                            ; Set idle timeout

;Pressure advance
;M572 D0 S0.025			                  ; Pressure advance Direct Drive: S0.025 < X and up

; Axis Limits
M208 X-23 Y0 Z0 S1                                 ; Set axis minima
M208 X320 Y321 Z350 S0                             ; Set axis maxima

; Endstops
M574 X1 Y2 S1                                      ; Set active high endstops edit: Y endstop is high(max). 

; Filament sensor                                  ; NOT USED*******
;M591 D0 P1 C3 S1				   ; Set Filament sensor Simple type (High) for extruder drive 0, connected to endstop input 3 (E0)

; Z-Probe
M307 H7 A-1 C-1 D-1                                ; Disable the 7th Heater to free up PWM channel 5 on the Duex board.
M574 Z1 S2                                         ; Set endstops controlled by probe
M558 P5 X0 Y0 Z1 H5 F200 T6000		           ; Set Z probe. Set Z probe type/mode 5 BLtouch.
G31 P500 X28.5 Y-5 Z1.65                           ; Set Z probe trigger value, offset and trigger height adjusted Bltouch G31 X28.5 Y-5 (using 2.39mm bolts, no washers) Cuanto mas alta es Z, mas acerca a la cama.
M557 X30:300 Y30:300 S100			   ; Define mesh grid

; Heater H0 -> Heatbed
M307 H0 A99.1 C453.2 D2.2 B0			   ; Set PID for heated bed values
M305 P0 T100000 B3950 C0 R4700                     ; Set thermistor + ADC parameters for heater 0
M143 H0 S100                                       ; Set temperature limit for heater 0 to 100C
M307 H0 A224.4 C456.9 D8.2 V24.0 B0                ; Set bed to use PID mode

; Heater H1 -> E3Dv6
M307 H1 A372.3 C109.6 D4.6 B0			   ; Set PID for hotend values
M305 P1 T100000 B3950 C0 R4700                     ; Set thermistor + ADC parameters for heater 1
M143 H1 S260                                       ; Set temperature limit for heater 1 to 260C
M307 H1 A293.4 C80.9 D7.1 V24.0 B0	           ; Set E3Dv6 to use PID mode                            

; Fans
M106 P0 S0 I0 F500 H-1                             ; Set fan 0 value, PWM signal inversion and frequency. Thermostatic control is turned off
M106 P1 S1 I0 F500 H1 T35                          ; Set fan 1 value, PWM signal inversion and frequency. Thermostatic control is turned on
M106 P2 S1 I0 F500 H1 T35                          ; Set fan 2 value, PWM signal inversion and frequency. Thermostatic control is turned on

; Tools
M563 P0 D0 H1                                      ; Define tool 0
G10 P0 X0 Y0 Z0                                    ; Set tool 0 axis offsets
G10 P0 R0 S0                                       ; Set initial tool 0 active and standby temperatures to 0C

; Automatic power saving
M911 S21 R22 P"M913 X0 Y0 G91 M83 G1 Z3 E-5 F1000" ; Set voltage thresholds and actions to run on power loss

; Custom settings are not configured
M564 H0                                   	   ; Let the Jog buttons work blv: added to allow jog buttons
