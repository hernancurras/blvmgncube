# blvmgncube
Duet 2 Wifi Files for BLV MGN Cube reprap 3d printer, with Duetx5 extension.

../Designed-Upgrades are all the custom made parts for the 3Z axis project + 1204 ballscreew

../Thingiverse-addons are the optional parts downloaded from thingiverse to complete the project. 

This project attempt to version the DUET 2 wifi config files for this project, attempted to be shared, documented & backuped.

![alt text](https://instagram.faep8-1.fna.fbcdn.net/v/t51.2885-15/e35/82275737_167851857797657_7645829098442912829_n.jpg?_nc_ht=instagram.faep8-1.fna.fbcdn.net&_nc_cat=105&_nc_ohc=AyyRwikUIyIAX8-z1CX&oh=cf19556ed0eab57d8b1e369aa22d8d73&oe=5EB68941 "Blv Mgn Cube")

* Z Axis: 
Designed for 3 axis, using the DuetX5. At this time, installed only 2 Axis.

* BallScrews: 
There are installed 1204 standard ballscrews. That would be 12mm rod, with 4mm pitch.
The step per mm is 800. The math behind would be 200 * 16 / 4 = 800 (200 steps, 16 microstepping, 4 pitch).

* Extruder:
The extruder is a BMG Bondtech clone, in Direct Drive with E3Dv6 with all metal hotend. 
Initially it was set as E405.18 steps. The heater is 24v 40W.
On the BMG web, is recommended 415, but 413-415 values are recommended.
 
* Autolevel:
The autolevel, initially was using IR sensor, on duet probe, but now is configured for a Cloned BLtouch to work on any printing surface.
Since the DUETX5 is installed, the PWM servo of the BLTouch was configured there.
Using the default piece of the project to hold the sensor, with X28.5 Y-5 offsets. Using 2 M3 nuts (2.39mm each), without washers as spacers, the Z offset is ˜2.3mm

![alt text](https://instagram.faep8-2.fna.fbcdn.net/v/t51.2885-15/e35/71184883_2726075894151268_111384618282760399_n.jpg?_nc_ht=instagram.faep8-2.fna.fbcdn.net&_nc_cat=104&_nc_ohc=rqMEmWj2884AX-d0xcP&oh=fa0b87676c06adf0bc90b0c4915d4cf9&oe=5EB54899 "Blv Mgn Extruder")

![alt text](https://instagram.faep8-2.fna.fbcdn.net/v/t51.2885-15/e35/75518386_2548235835446780_9131160443129393729_n.jpg?_nc_ht=instagram.faep8-2.fna.fbcdn.net&_nc_cat=108&_nc_ohc=z04-F6lrMlEAX90RjaZ&oh=e075593c6e0dbc62d0c772a286e888aa&oe=5EB4947A "Blv Mgn Frame")


# Default BLV MGN Motion Setup

; Drives Direction.

M569 P0 S1                                     ; physical drive 0 goes forwards (X1)

M569 P1 S1                                     ; physical drive 1 goes forwards (Y1)

M569 P2 S0                                     ; physical drive 2 goes backwards (Z1-Z2)

M569 P3 S0                                     ; physical drive 3 goes backwards (E0)

; Default Motion Description:

M584 X0 Y1 Z2 E3                               ; set drive mapping

M350 X16 Y16 Z16 E16 I1                        ; configure microstepping with interpolation

M92 X200.00 Y200.00 Z800.00 E415.00            ; Set steps per mm.  Initially E405.18 or 413-415, Ballscrew 200*16/4 = 800 (200 steps, 

M566 X800 Y800 Z24 E300    					               ; set maximum instantaneous speed changes (mm/min)

M203 X20000 Y20000 Z600 E8000				              ; set maximum speeds (mm/min)

M201 X3000.00 Y3000.00 Z100.00 E5000.00        ; set accelerations (mm/s^2)

M906 X1600 Y1600 Z1600 E1600 I30               ; set motor currents (mA) and motor idle factor in per cent

M84 S30                                        ; Set idle timeout


; Heaters PID

M307 H0 A224.4 C456.9 D8.2 V24.0 B0 S1.00      ; disable bang-bang mode for the bed heater and set PWM limit

M307 H1 A293.4 C80.9 D7.1 V24.0 B0 B0 S1.00    ; disable bang-bang mode for heater  and set PWM limit


