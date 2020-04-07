# blvmgncube
Duet 2 Wifi Files for BLV MGN Cube reprap 3d printer, with Duetx5 extension.

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

