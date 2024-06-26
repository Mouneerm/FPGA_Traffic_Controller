# FPGA_Traffic_Controller


### Introduction
In this project, a Smart Traffic Light Controller was implemented in a dense traffic area in Mauritius using Finite State Machines. The location was chosen to be the intersection of Dr Maurice Cure St, Road A1, and Julius Nyerere Ave at Rose-Hill was chosen. The controller was implemented in **Xilinx Spartran 6 LX16 FPGA**.

![image](https://github.com/Mouneerm/FPGA_Traffic_Controller/assets/45911394/00ecb0aa-d4fd-4077-bb00-609db17be1d6)


A finite state machine for pedestrian sensors was created and specifications for both the sensors’ functionality and the main controller were presented.

Ina addition, a finite state machine for the main controller was constructed. State assignment tables for the controller were created and codes were written using Aldec-Active HDL for FPGA implementation.

Simulations were performed to verify whether the proposed design was working as intended. This project demonstrates the practical application of Finite State Machines in traffic management systems.

### Objective
This project aims to improve the traffic congestion at the intersection of Dr Maurice Cure St, Nalla Ln Street, A1, and Julius Nyerere Ave at Rose- Hill. 
Also, this project would facilitate navigation of emergency vehicles from the Rose-Hill Police Station and Rose-Hill Area Health Centre on the (side roads) Julius and Dr Maurice Cure. 
During peak hours, priority would be shifted towards giving the main road A1 green lights. The number of pedestrians waiting to cross the road is also counted.

### Pedestrian Sensors- Controller design

##### Specifications: 
- If no pedestrians caught at either of the 8 positions, Traffic Controller sequence would not lean to Red lights on both streets for pedestrian to cross.
- If there are pedestrians located on at least 4 positions for 65 seconds, Traffic Controller sequence would lean to Red lights for both streets for pedestrians to cross.
- If pedestrians are located at more than 4 positions, the Traffic Controller sequence would immediately lean towards the red lights on both streets.

The output **P** obtained for this controller would be used for the main traffic controller as an input to indicate pedestrians waiting to cross the road. 

| Input (n) for the 8 positions   | Representation (n1n0)  |
|----------|-------------------------|
| 0        | 00                      |
| 1< n < 4 | 01                      |
| 4≤ 8     | 10                      |

| Timer Inputs | Description                         |
|--------------|-------------------------------------|
| T65          | 65 seconds waiting room             |
| T15          | 15 seconds for pedestrians to cross |


**States:**
SX: when P = 0  
SY: when P = 1 

![image](https://github.com/Mouneerm/FPGA_Traffic_Controller/assets/45911394/162fd128-56ce-4a9c-ae70-68b1635b8260)


Inputs of Moore diagram are: n1, n0, T65, T15, where X in the diagram can be 0 or 1.

<table><tr><th colspan="1" rowspan="2" valign="top">` `<b>Present State</b></th><th colspan="4" valign="top"><b>Inputs</b></th><th colspan="1" rowspan="1" valign="top"><b>P (Output)</b></th></tr>
<tr><td colspan="1" valign="top"><b>n1</b></td><td colspan="1" valign="top"><b>n0</b></td><td colspan="1" valign="top"><b>T65</b></td><td colspan="1" valign="top"><b>T15</b></td></tr>
<tr><td colspan="1" rowspan="16" valign="top"><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p>SX</p></td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td></tr>
<tr><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td></tr>
<tr><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td></tr>
<tr><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td></tr>
<tr><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td></tr>
<tr><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td></tr>
<tr><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td></tr>
<tr><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td></tr>
<tr><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td></tr>
<tr><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td></tr>
<tr><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td></tr>
<tr><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td></tr>
<tr><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td></tr>
<tr><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td></tr>
<tr><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td></tr>
<tr><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td></tr>
<tr><td colspan="1" rowspan="16" valign="top"><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p>SY</p><p></p><p></p><p></p><p></p></td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td></tr>
<tr><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td></tr>
<tr><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td></tr>
<tr><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td></tr>
<tr><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td></tr>
<tr><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td></tr>
<tr><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td></tr>
<tr><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td></tr>
<tr><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td></tr>
<tr><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td></tr>
<tr><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td></tr>
<tr><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td></tr>
<tr><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td></tr>
<tr><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td></tr>
<tr><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td></tr>
<tr><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td></tr>
</table>

<a name="_toc75525414"></a> State transition table for Pedestrian Controller

For SX = 0 and SY = 1, using online tool <http://www.32x8.com/index.html> P is given by	


$P = \sum\limits_{M}^{} (6,7,8,9,10,11,16,18,20,22,24,26)$


##### Camera positioning: 

The camera shall be positioned such that it would cover a portion of the area whereby pedestrians would stand to cross the road. The sensor would be fitted about 3.4 m above the level ground and directed downwards towards the crossing and adjacent pavement. An advantage of this sensor would be that the trigger cancellation occurs in the event the person moves away from the sensor.

### A1 road (Main road) Car Sensors

On the main road A1, if vehicles are detected at the locations of both 2 Inductive loop 
Sensors, the output C would be triggered. This output would be used as an input for 
the main traffic controller.

Due to the high volume of traffic on road A1, especially during peak hours from 3.00 to 4.30 in the afternoon, the sensors were strategically placed 16.5 m away from the stop line, equivalent to the distance of 3 vehicles with spacing. This ensures that the sensors would only be triggered if there are at least 3 cars on each side of the main road

|**Sensor 1**|**Sensor 2**|**Output C**|
| :-: | :-: | :-: |
|0|0|0|
|0|1|0|
|1|0|0|
|1|1|1|

## Main controller Design

##### Specifications: 

• Green Light at A1 (Main Road) for 30 s unless Emergency Vehicle at road Julius
(Side Road) or Pedestrians
• Green Light at Julius road unless at least cars at A1 or Pedestrians.
• Caution of 5 seconds on each Main road and Side road whenever colour changes from 
Green to Red or vice-versa. Caution light colour is Amber.
• Julius Road and Dr Maurice Cure St equipped with infrared sensors which would 
allow emergency vehicles priority to travel on the road.
• Priorities given to Emergency vehicles on the side roads in the event that there are
cars at A1, Emergency vehicle at Julius Road and Pedestrians waiting to cross.
• Pedestrians have 15 s to cross the road during the period where both traffic lights are 
Red. Pedestrians have got priority over the vehicles being detected by the sensors but 
not over the Emergency Vehicle.

**Priority Order:** Emergency Vehicle > Pedestrians > Cars at A1

##### Controller Challenge: 

Assumptions:
1. Road linking Julius Nyerere and Dr Maurice Cure is Side Road as reference
2. A1 Road is Main road as reference
3. Presence of Pedestrian Crossing on all 4 roads

|**Input**|**Description**|
| :- | :- |
|T30|Timer of 30 s trigger 1 (Normal Green Light time)|
|T15|Timer of 15 s trigger 1 (Red light on all street for pedestrian crossing)|
|T5|Timer of 5 s trigger 1 (Caution Light- Amber time)|
|C|Waiting car at A1 road (Main road)|
|P|Pedestrians waiting to cross|
|E|Emergency vehicles moving (Side roads)|
<a name="_toc75525417"></a> Inputs for Main controller

|**State**|**Main Road Output**|**Side Road Output**|**Pedestrian Crossing**|
| :-: | :-: | :-: | :-: |
|S<sub>0</sub>|Green|Red|Red|
|S<sub>1</sub>|Amber|Red|Red|
|S<sub>2</sub>|Red|Green|Red|
|S<sub>3</sub>|Red|Amber|Red|
|S<sub>4</sub>|Red|Red|Green|

<a name="_toc75525418"></a> State Outputs of Main Controller

|**State**|**Main Road Output**|**Side Road Output**|**Pedestrian**|||||||
| :-: | :-: | :-: | :-: | :- | :- | :- | :- | :- | :- |
|<b>Q<sub>2</sub></b>|<b>Q<sub>1</sub></b>|<b>Q<sub>0</sub></b>|**Green**|**Amber**|**Red**|**Green**|**Amber**|**Red**|<b>P<sub>0</sub></b>|
|0|0|0|1|0|0|0|0|1|0|
|0|0|1|0|1|0|0|0|1|0|
|0|1|0|0|0|1|1|0|0|0|
|0|1|1|0|0|1|0|1|0|0|
|1|0|0|0|0|1|0|0|1|1|

<a name="_toc75525419"></a> State and output assignment of Main Controller

![image](https://github.com/Mouneerm/FPGA_Traffic_Controller/assets/45911394/ca20694b-5deb-4c8c-b1b8-89c29b284dfb)





Priority Order: 

Emergency Vehicle (E) > Pedestrians (P)  > Cars at A1 (C)

<table><tr><th colspan="1" rowspan="2" valign="top"><b>No</b></th><th colspan="1" rowspan="2" valign="top"><p><b>Present State</b></p><p></p></th><th colspan="6" valign="top"><b>Inputs</b></th><th colspan="1" rowspan="1" valign="top"><b>Next State</b></th></tr>
<tr><td colspan="1" valign="top"><b>T30</b></td><td colspan="1" valign="top"><b>T15</b></td><td colspan="1" valign="top"><b>T5</b></td><td colspan="1" valign="top"><b>C</b></td><td colspan="1" valign="top"><b>P</b></td><td colspan="1" valign="top"><b>E</b></td></tr>
<tr><td colspan="1" valign="top">0</td><td colspan="1" rowspan="64" valign="top"><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p>S<sub>0</sub></p></td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>0</sub></td></tr>
<tr><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>1</sub></td></tr>
<tr><td colspan="1" valign="top">2</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>1</sub></td></tr>
<tr><td colspan="1" valign="top">3</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>1</sub></td></tr>
<tr><td colspan="1" valign="top">4</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>0</sub></td></tr>
<tr><td colspan="1" valign="top">5</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>1</sub></td></tr>
<tr><td colspan="1" valign="top">6</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>1</sub></td></tr>
<tr><td colspan="1" valign="top">7</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>1</sub></td></tr>
<tr><td colspan="1" valign="top">8</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>0</sub></td></tr>
<tr><td colspan="1" valign="top">9</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>1</sub></td></tr>
<tr><td colspan="1" valign="top">10</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>1</sub></td></tr>
<tr><td colspan="1" valign="top">11</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>1</sub></td></tr>
<tr><td colspan="1" valign="top">12</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>0</sub></td></tr>
<tr><td colspan="1" valign="top">13</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>1</sub></td></tr>
<tr><td colspan="1" valign="top">14</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>1</sub></td></tr>
<tr><td colspan="1" valign="top">15</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>1</sub></td></tr>
<tr><td colspan="1" valign="top">16</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>0</sub></td></tr>
<tr><td colspan="1" valign="top">17</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>1</sub></td></tr>
<tr><td colspan="1" valign="top">18</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>1</sub></td></tr>
<tr><td colspan="1" valign="top">19</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>1</sub></td></tr>
<tr><td colspan="1" valign="top">20</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>0</sub></td></tr>
<tr><td colspan="1" valign="top">21</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>1</sub></td></tr>
<tr><td colspan="1" valign="top">22</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>1</sub></td></tr>
<tr><td colspan="1" valign="top">23</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>1</sub></td></tr>
<tr><td colspan="1" valign="top">24</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>0</sub></td></tr>
<tr><td colspan="1" valign="top">25</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>1</sub></td></tr>
<tr><td colspan="1" valign="top">26</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>1</sub></td></tr>
<tr><td colspan="1" valign="top">27</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>1</sub></td></tr>
<tr><td colspan="1" valign="top">28</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>0</sub></td></tr>
<tr><td colspan="1" valign="top">29</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>1</sub></td></tr>
<tr><td colspan="1" valign="top">30</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>1</sub></td></tr>
<tr><td colspan="1" valign="top">31</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>1</sub></td></tr>
<tr><td colspan="1" valign="top">32</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>1</sub></td></tr>
<tr><td colspan="1" valign="top">33</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>1</sub></td></tr>
<tr><td colspan="1" valign="top">34</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>1</sub></td></tr>
<tr><td colspan="1" valign="top">35</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>1</sub></td></tr>
<tr><td colspan="1" valign="top">36</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>1</sub></td></tr>
<tr><td colspan="1" valign="top">37</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>1</sub></td></tr>
<tr><td colspan="1" valign="top">38</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>1</sub></td></tr>
<tr><td colspan="1" valign="top">39</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>1</sub></td></tr>
<tr><td colspan="1" valign="top">40</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>1</sub></td></tr>
<tr><td colspan="1" valign="top">41</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>1</sub></td></tr>
<tr><td colspan="1" valign="top">42</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>1</sub></td></tr>
<tr><td colspan="1" valign="top">43</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>1</sub></td></tr>
<tr><td colspan="1" valign="top">44</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>1</sub></td></tr>
<tr><td colspan="1" valign="top">45</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>1</sub></td></tr>
<tr><td colspan="1" valign="top">46</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>1</sub></td></tr>
<tr><td colspan="1" valign="top">47</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>1</sub></td></tr>
<tr><td colspan="1" valign="top">48</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>1</sub></td></tr>
<tr><td colspan="1" valign="top">49</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>1</sub></td></tr>
<tr><td colspan="1" valign="top">50</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>1</sub></td></tr>
<tr><td colspan="1" valign="top">51</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>1</sub></td></tr>
<tr><td colspan="1" valign="top">52</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>1</sub></td></tr>
<tr><td colspan="1" valign="top">53</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>1</sub></td></tr>
<tr><td colspan="1" valign="top">54</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>1</sub></td></tr>
<tr><td colspan="1" valign="top">55</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>1</sub></td></tr>
<tr><td colspan="1" valign="top">56</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>1</sub></td></tr>
<tr><td colspan="1" valign="top">57</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>1</sub></td></tr>
<tr><td colspan="1" valign="top">58</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>1</sub></td></tr>
<tr><td colspan="1" valign="top">59</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>1</sub></td></tr>
<tr><td colspan="1" valign="top">60</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>1</sub></td></tr>
<tr><td colspan="1" valign="top">61</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>1</sub></td></tr>
<tr><td colspan="1" valign="top">62</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>1</sub></td></tr>
<tr><td colspan="1" valign="top">63</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>1</sub></td></tr>
</table>

<a name="_toc75525420"></a> When Present State is S<sub>0</sub>

Using the <http://www.32x8.com/var6.html> website, the equations were generated to obtain equations requirement for the next possible state S<sub>1</sub>, S<sub>0</sub>

<i>S<sub>1</sub> = T30 + P + E</i>

<i>S<sub>0</sub> = T30</i>'×P'×E'</i> 

<table><tr><th colspan="1" rowspan="2" valign="top"><b>No</b></th><th colspan="1" rowspan="2" valign="top"><p><b>Present State</b></p><p></p></th><th colspan="6" valign="top"><b>Inputs</b></th><th colspan="1" rowspan="1" valign="top"><b>Next State</b></th></tr>
<tr><td colspan="1" valign="top"><b>T30</b></td><td colspan="1" valign="top"><b>T15</b></td><td colspan="1" valign="top"><b>T5</b></td><td colspan="1" valign="top"><b>C</b></td><td colspan="1" valign="top"><b>P</b></td><td colspan="1" valign="top"><b>E</b></td></tr>
<tr><td colspan="1" valign="top">0</td><td colspan="1" rowspan="64" valign="top"><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p>S<sub>1</sub></p></td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>1</sub></td></tr>
<tr><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>1</sub></td></tr>
<tr><td colspan="1" valign="top">2</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>1</sub></td></tr>
<tr><td colspan="1" valign="top">3</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>1</sub></td></tr>
<tr><td colspan="1" valign="top">4</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>1</sub></td></tr>
<tr><td colspan="1" valign="top">5</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>1</sub></td></tr>
<tr><td colspan="1" valign="top">6</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>1</sub></td></tr>
<tr><td colspan="1" valign="top">7</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>1</sub></td></tr>
<tr><td colspan="1" valign="top">8</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>2</sub></td></tr>
<tr><td colspan="1" valign="top">9</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>2</sub></td></tr>
<tr><td colspan="1" valign="top">10</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>4</sub></td></tr>
<tr><td colspan="1" valign="top">11</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>2</sub></td></tr>
<tr><td colspan="1" valign="top">12</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>2</sub></td></tr>
<tr><td colspan="1" valign="top">13</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>2</sub></td></tr>
<tr><td colspan="1" valign="top">14</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>4</sub></td></tr>
<tr><td colspan="1" valign="top">15</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>2</sub></td></tr>
<tr><td colspan="1" valign="top">16</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>1</sub></td></tr>
<tr><td colspan="1" valign="top">17</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>1</sub></td></tr>
<tr><td colspan="1" valign="top">18</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>1</sub></td></tr>
<tr><td colspan="1" valign="top">19</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>1</sub></td></tr>
<tr><td colspan="1" valign="top">20</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>1</sub></td></tr>
<tr><td colspan="1" valign="top">21</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>1</sub></td></tr>
<tr><td colspan="1" valign="top">22</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>1</sub></td></tr>
<tr><td colspan="1" valign="top">23</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>1</sub></td></tr>
<tr><td colspan="1" valign="top">24</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>2</sub></td></tr>
<tr><td colspan="1" valign="top">25</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>2</sub></td></tr>
<tr><td colspan="1" valign="top">26</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>4</sub></td></tr>
<tr><td colspan="1" valign="top">27</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>2</sub></td></tr>
<tr><td colspan="1" valign="top">28</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>2</sub></td></tr>
<tr><td colspan="1" valign="top">29</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>2</sub></td></tr>
<tr><td colspan="1" valign="top">30</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>4</sub></td></tr>
<tr><td colspan="1" valign="top">31</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>2</sub></td></tr>
<tr><td colspan="1" valign="top">32</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>1</sub></td></tr>
<tr><td colspan="1" valign="top">33</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>1</sub></td></tr>
<tr><td colspan="1" valign="top">34</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>1</sub></td></tr>
<tr><td colspan="1" valign="top">35</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>1</sub></td></tr>
<tr><td colspan="1" valign="top">36</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>1</sub></td></tr>
<tr><td colspan="1" valign="top">37</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>1</sub></td></tr>
<tr><td colspan="1" valign="top">38</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>1</sub></td></tr>
<tr><td colspan="1" valign="top">39</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>1</sub></td></tr>
<tr><td colspan="1" valign="top">40</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>2</sub></td></tr>
<tr><td colspan="1" valign="top">41</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>2</sub></td></tr>
<tr><td colspan="1" valign="top">42</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>4</sub></td></tr>
<tr><td colspan="1" valign="top">43</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>2</sub></td></tr>
<tr><td colspan="1" valign="top">44</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>2</sub></td></tr>
<tr><td colspan="1" valign="top">45</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>2</sub></td></tr>
<tr><td colspan="1" valign="top">46</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>4</sub></td></tr>
<tr><td colspan="1" valign="top">47</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>2</sub></td></tr>
<tr><td colspan="1" valign="top">48</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>1</sub></td></tr>
<tr><td colspan="1" valign="top">49</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>1</sub></td></tr>
<tr><td colspan="1" valign="top">50</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>1</sub></td></tr>
<tr><td colspan="1" valign="top">51</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>1</sub></td></tr>
<tr><td colspan="1" valign="top">52</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>1</sub></td></tr>
<tr><td colspan="1" valign="top">53</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>1</sub></td></tr>
<tr><td colspan="1" valign="top">54</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>1</sub></td></tr>
<tr><td colspan="1" valign="top">55</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>1</sub></td></tr>
<tr><td colspan="1" valign="top">56</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>2</sub></td></tr>
<tr><td colspan="1" valign="top">57</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>2</sub></td></tr>
<tr><td colspan="1" valign="top">58</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>4</sub></td></tr>
<tr><td colspan="1" valign="top">59</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>2</sub></td></tr>
<tr><td colspan="1" valign="top">60</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>2</sub></td></tr>
<tr><td colspan="1" valign="top">61</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>2</sub></td></tr>
<tr><td colspan="1" valign="top">62</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>4</sub></td></tr>
<tr><td colspan="1" valign="top">63</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>2</sub></td></tr>
</table>

<a name="_toc75525421"></a> When Present State is S<sub>1</sub>

Using the <http://www.32x8.com/var6.html> website, the Sum of Min terms were generated and equations were generated to obtain equations requirement for the next state S<sub>2</sub> and/or S<sub>3</sub>.

<i>S<sub>1</sub> = T5</i>'

<i>S<sub>2</sub> = (T5</i>×P'<i>) + (T5</i>×E<i>)</i>

<i>S<sub>4</sub> = T5</i>×P×E'

<table><tr><th colspan="1" rowspan="2" valign="top"><b>No</b></th><th colspan="1" rowspan="2" valign="top"><p><b>Present State</b></p><p></p></th><th colspan="6" valign="top"><b>Inputs</b></th><th colspan="1" rowspan="1" valign="top"><b>Next State</b></th></tr>
<tr><td colspan="1" valign="top"><b>T30</b></td><td colspan="1" valign="top"><b>T15</b></td><td colspan="1" valign="top"><b>T5</b></td><td colspan="1" valign="top"><b>C</b></td><td colspan="1" valign="top"><b>P</b></td><td colspan="1" valign="top"><b>E</b></td></tr>
<tr><td colspan="1" valign="top">0</td><td colspan="1" rowspan="64" valign="top"><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p>S<sub>2</sub></p></td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>2</sub></td></tr>
<tr><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>2</sub></td></tr>
<tr><td colspan="1" valign="top">2</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>3</sub></td></tr>
<tr><td colspan="1" valign="top">3</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>2</sub></td></tr>
<tr><td colspan="1" valign="top">4</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>3</sub></td></tr>
<tr><td colspan="1" valign="top">5</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>2</sub></td></tr>
<tr><td colspan="1" valign="top">6</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>3</sub></td></tr>
<tr><td colspan="1" valign="top">7</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>2</sub></td></tr>
<tr><td colspan="1" valign="top">8</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>2</sub></td></tr>
<tr><td colspan="1" valign="top">9</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>2</sub></td></tr>
<tr><td colspan="1" valign="top">10</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>3</sub></td></tr>
<tr><td colspan="1" valign="top">11</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>2</sub></td></tr>
<tr><td colspan="1" valign="top">12</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>3</sub></td></tr>
<tr><td colspan="1" valign="top">13</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>2</sub></td></tr>
<tr><td colspan="1" valign="top">14</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>3</sub></td></tr>
<tr><td colspan="1" valign="top">15</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>2</sub></td></tr>
<tr><td colspan="1" valign="top">16</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>2</sub></td></tr>
<tr><td colspan="1" valign="top">17</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>2</sub></td></tr>
<tr><td colspan="1" valign="top">18</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>3</sub></td></tr>
<tr><td colspan="1" valign="top">19</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>2</sub></td></tr>
<tr><td colspan="1" valign="top">20</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>3</sub></td></tr>
<tr><td colspan="1" valign="top">21</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>2</sub></td></tr>
<tr><td colspan="1" valign="top">22</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>3</sub></td></tr>
<tr><td colspan="1" valign="top">23</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>2</sub></td></tr>
<tr><td colspan="1" valign="top">24</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>2</sub></td></tr>
<tr><td colspan="1" valign="top">25</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>2</sub></td></tr>
<tr><td colspan="1" valign="top">26</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>3</sub></td></tr>
<tr><td colspan="1" valign="top">27</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>2</sub></td></tr>
<tr><td colspan="1" valign="top">28</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>3</sub></td></tr>
<tr><td colspan="1" valign="top">29</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>2</sub></td></tr>
<tr><td colspan="1" valign="top">30</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>3</sub></td></tr>
<tr><td colspan="1" valign="top">31</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>2</sub></td></tr>
<tr><td colspan="1" valign="top">32</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>3</sub></td></tr>
<tr><td colspan="1" valign="top">33</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>2</sub></td></tr>
<tr><td colspan="1" valign="top">34</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>3</sub></td></tr>
<tr><td colspan="1" valign="top">35</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>2</sub></td></tr>
<tr><td colspan="1" valign="top">36</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>3</sub></td></tr>
<tr><td colspan="1" valign="top">37</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>2</sub></td></tr>
<tr><td colspan="1" valign="top">38</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>3</sub></td></tr>
<tr><td colspan="1" valign="top">39</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>2</sub></td></tr>
<tr><td colspan="1" valign="top">40</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>3</sub></td></tr>
<tr><td colspan="1" valign="top">41</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>2</sub></td></tr>
<tr><td colspan="1" valign="top">42</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>3</sub></td></tr>
<tr><td colspan="1" valign="top">43</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>2</sub></td></tr>
<tr><td colspan="1" valign="top">44</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>3</sub></td></tr>
<tr><td colspan="1" valign="top">45</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>2</sub></td></tr>
<tr><td colspan="1" valign="top">46</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>3</sub></td></tr>
<tr><td colspan="1" valign="top">47</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>2</sub></td></tr>
<tr><td colspan="1" valign="top">48</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>3</sub></td></tr>
<tr><td colspan="1" valign="top">49</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>2</sub></td></tr>
<tr><td colspan="1" valign="top">50</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>3</sub></td></tr>
<tr><td colspan="1" valign="top">51</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>2</sub></td></tr>
<tr><td colspan="1" valign="top">52</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>3</sub></td></tr>
<tr><td colspan="1" valign="top">53</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>2</sub></td></tr>
<tr><td colspan="1" valign="top">54</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>3</sub></td></tr>
<tr><td colspan="1" valign="top">55</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>2</sub></td></tr>
<tr><td colspan="1" valign="top">56</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>3</sub></td></tr>
<tr><td colspan="1" valign="top">57</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>2</sub></td></tr>
<tr><td colspan="1" valign="top">58</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>3</sub></td></tr>
<tr><td colspan="1" valign="top">59</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>2</sub></td></tr>
<tr><td colspan="1" valign="top">60</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>3</sub></td></tr>
<tr><td colspan="1" valign="top">61</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>2</sub></td></tr>
<tr><td colspan="1" valign="top">62</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>3</sub></td></tr>
<tr><td colspan="1" valign="top">63</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>2</sub></td></tr>
</table>

<a name="_toc75525422"></a> When Present State is S<sub>2</sub>

Using the <http://www.32x8.com/var6.html> website, the Sum of Min terms were generated and equations were generated to obtain equations requirement for the next state S<sub>2</sub> and/or S<sub>3</sub>.

<i>S<sub>2</sub> = E + (T30</i>' × <i>C</i>'</i> × <i>P</i>')

<i>S<sub>3</sub> =  (P</i> ×E') <i>+ (C</i> ×E')<i>+ (T30</i> ×E'<i>)</i>

<table><tr><th colspan="1" rowspan="2" valign="top"><b>No</b></th><th colspan="1" rowspan="2" valign="top"><p><b>Present State</b></p><p></p></th><th colspan="6" valign="top"><b>Inputs</b></th><th colspan="1" rowspan="1" valign="top"><b>Next State</b></th></tr>
<tr><td colspan="1" valign="top"><b>T30</b></td><td colspan="1" valign="top"><b>T15</b></td><td colspan="1" valign="top"><b>T5</b></td><td colspan="1" valign="top"><b>C</b></td><td colspan="1" valign="top"><b>P</b></td><td colspan="1" valign="top"><b>E</b></td></tr>
<tr><td colspan="1" valign="top">0</td><td colspan="1" rowspan="64" valign="top"><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p>S<sub>3</sub></p></td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>3</sub></td></tr>
<tr><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>2</sub></td></tr>
<tr><td colspan="1" valign="top">2</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>3</sub></td></tr>
<tr><td colspan="1" valign="top">3</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>2</sub></td></tr>
<tr><td colspan="1" valign="top">4</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>0</sub></td></tr>
<tr><td colspan="1" valign="top">5</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>2</sub></td></tr>
<tr><td colspan="1" valign="top">6</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>3</sub></td></tr>
<tr><td colspan="1" valign="top">7</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>2</sub></td></tr>
<tr><td colspan="1" valign="top">8</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>0</sub></td></tr>
<tr><td colspan="1" valign="top">9</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>2</sub></td></tr>
<tr><td colspan="1" valign="top">10</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>4</sub></td></tr>
<tr><td colspan="1" valign="top">11</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>2</sub></td></tr>
<tr><td colspan="1" valign="top">12</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>0</sub></td></tr>
<tr><td colspan="1" valign="top">13</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>2</sub></td></tr>
<tr><td colspan="1" valign="top">14</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>4</sub></td></tr>
<tr><td colspan="1" valign="top">15</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>2</sub></td></tr>
<tr><td colspan="1" valign="top">16</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>3</sub></td></tr>
<tr><td colspan="1" valign="top">17</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>2</sub></td></tr>
<tr><td colspan="1" valign="top">18</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>3</sub></td></tr>
<tr><td colspan="1" valign="top">19</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>2</sub></td></tr>
<tr><td colspan="1" valign="top">20</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>3</sub></td></tr>
<tr><td colspan="1" valign="top">21</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>2</sub></td></tr>
<tr><td colspan="1" valign="top">22</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>3</sub></td></tr>
<tr><td colspan="1" valign="top">23</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>2</sub></td></tr>
<tr><td colspan="1" valign="top">24</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>0</sub></td></tr>
<tr><td colspan="1" valign="top">25</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>2</sub></td></tr>
<tr><td colspan="1" valign="top">26</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>4</sub></td></tr>
<tr><td colspan="1" valign="top">27</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>2</sub></td></tr>
<tr><td colspan="1" valign="top">28</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>0</sub></td></tr>
<tr><td colspan="1" valign="top">29</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>2</sub></td></tr>
<tr><td colspan="1" valign="top">30</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>4</sub></td></tr>
<tr><td colspan="1" valign="top">31</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>2</sub></td></tr>
<tr><td colspan="1" valign="top">32</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>3</sub></td></tr>
<tr><td colspan="1" valign="top">33</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>2</sub></td></tr>
<tr><td colspan="1" valign="top">34</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>3</sub></td></tr>
<tr><td colspan="1" valign="top">35</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>2</sub></td></tr>
<tr><td colspan="1" valign="top">36</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>3</sub></td></tr>
<tr><td colspan="1" valign="top">37</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>2</sub></td></tr>
<tr><td colspan="1" valign="top">38</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>3</sub></td></tr>
<tr><td colspan="1" valign="top">39</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>2</sub></td></tr>
<tr><td colspan="1" valign="top">40</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>0</sub></td></tr>
<tr><td colspan="1" valign="top">41</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>2</sub></td></tr>
<tr><td colspan="1" valign="top">42</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>4</sub></td></tr>
<tr><td colspan="1" valign="top">43</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>2</sub></td></tr>
<tr><td colspan="1" valign="top">44</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>0</sub></td></tr>
<tr><td colspan="1" valign="top">45</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>2</sub></td></tr>
<tr><td colspan="1" valign="top">46</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>4</sub></td></tr>
<tr><td colspan="1" valign="top">47</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>2</sub></td></tr>
<tr><td colspan="1" valign="top">48</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>3</sub></td></tr>
<tr><td colspan="1" valign="top">49</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>2</sub></td></tr>
<tr><td colspan="1" valign="top">50</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>3</sub></td></tr>
<tr><td colspan="1" valign="top">51</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>2</sub></td></tr>
<tr><td colspan="1" valign="top">52</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>3</sub></td></tr>
<tr><td colspan="1" valign="top">53</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>2</sub></td></tr>
<tr><td colspan="1" valign="top">54</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>3</sub></td></tr>
<tr><td colspan="1" valign="top">55</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>2</sub></td></tr>
<tr><td colspan="1" valign="top">56</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>0</sub></td></tr>
<tr><td colspan="1" valign="top">57</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>2</sub></td></tr>
<tr><td colspan="1" valign="top">58</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>4</sub></td></tr>
<tr><td colspan="1" valign="top">59</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>2</sub></td></tr>
<tr><td colspan="1" valign="top">60</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>0</sub></td></tr>
<tr><td colspan="1" valign="top">61</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>2</sub></td></tr>
<tr><td colspan="1" valign="top">62</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>4</sub></td></tr>
<tr><td colspan="1" valign="top">63</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>2</sub></td></tr>
</table>

<a name="_toc75525423"></a> When Present State is S<sub>3</sub>

Using the <http://www.32x8.com/var6.html> website, the equations were generated to obtain equations requirement for the next possible state S<sub>4</sub>, S<sub>3</sub>, S<sub>2</sub> and S<sub>0</sub>.

S<sub>4</sub> = (T5 × P × E')

<i>S<sub>3</sub> = (T5</i>' × <i>C</i>'× <i>E</i>'<i>) + (T5</i>'× <i>P</i> × <i>E</i>'<i>) + (T15</i> × <i>T5</i>'</i> × <i>E</i>'<i>) + (</i>T30×T5'×E'<i>)</i>

<i>S<sub>2</sub> = E</i>

<i>S<sub>0</sub> = (T5</i> × <i>P</i>'</i> × <i>E</i>') <i>+ (T30</i>'</i> ×T15'×C×P'×E'<i>)</i>

<table><tr><th colspan="1" rowspan="2" valign="top"><b>No</b></th><th colspan="1" valign="top"></th><th colspan="6" valign="top"><b>Inputs</b></th><th colspan="1" rowspan="1" valign="top"><b>Next State</b></th></tr>
<tr><td colspan="1" valign="top"><p><b>Present State</b></p><p></p></td><td colspan="1" valign="top"><b>T30</b></td><td colspan="1" valign="top"><b>T15</b></td><td colspan="1" valign="top"><b>T5</b></td><td colspan="1" valign="top"><b>C</b></td><td colspan="1" valign="top"><b>P</b></td><td colspan="1" valign="top"><b>E</b></td></tr>
<tr><td colspan="1" valign="top">0</td><td colspan="1" rowspan="64" valign="top"><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p>S<sub>4</sub></p></td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>4</sub></td></tr>
<tr><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>3</sub></td></tr>
<tr><td colspan="1" valign="top">2</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>4</sub></td></tr>
<tr><td colspan="1" valign="top">3</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>3</sub></td></tr>
<tr><td colspan="1" valign="top">4</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>4</sub></td></tr>
<tr><td colspan="1" valign="top">5</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>3</sub></td></tr>
<tr><td colspan="1" valign="top">6</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>4</sub></td></tr>
<tr><td colspan="1" valign="top">7</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>3</sub></td></tr>
<tr><td colspan="1" valign="top">8</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>4</sub></td></tr>
<tr><td colspan="1" valign="top">9</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>3</sub></td></tr>
<tr><td colspan="1" valign="top">10</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>4</sub></td></tr>
<tr><td colspan="1" valign="top">11</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>3</sub></td></tr>
<tr><td colspan="1" valign="top">12</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>4</sub></td></tr>
<tr><td colspan="1" valign="top">13</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>3</sub></td></tr>
<tr><td colspan="1" valign="top">14</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>4</sub></td></tr>
<tr><td colspan="1" valign="top">15</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>3</sub></td></tr>
<tr><td colspan="1" valign="top">16</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>3</sub></td></tr>
<tr><td colspan="1" valign="top">17</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>3</sub></td></tr>
<tr><td colspan="1" valign="top">18</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>3</sub></td></tr>
<tr><td colspan="1" valign="top">19</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>3</sub></td></tr>
<tr><td colspan="1" valign="top">20</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>3</sub></td></tr>
<tr><td colspan="1" valign="top">21</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>3</sub></td></tr>
<tr><td colspan="1" valign="top">22</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>3</sub></td></tr>
<tr><td colspan="1" valign="top">23</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>3</sub></td></tr>
<tr><td colspan="1" valign="top">24</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>3</sub></td></tr>
<tr><td colspan="1" valign="top">25</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>3</sub></td></tr>
<tr><td colspan="1" valign="top">26</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>3</sub></td></tr>
<tr><td colspan="1" valign="top">27</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>3</sub></td></tr>
<tr><td colspan="1" valign="top">28</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>3</sub></td></tr>
<tr><td colspan="1" valign="top">29</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>3</sub></td></tr>
<tr><td colspan="1" valign="top">30</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>3</sub></td></tr>
<tr><td colspan="1" valign="top">31</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>3</sub></td></tr>
<tr><td colspan="1" valign="top">32</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>4</sub></td></tr>
<tr><td colspan="1" valign="top">33</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>3</sub></td></tr>
<tr><td colspan="1" valign="top">34</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>4</sub></td></tr>
<tr><td colspan="1" valign="top">35</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>3</sub></td></tr>
<tr><td colspan="1" valign="top">36</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>4</sub></td></tr>
<tr><td colspan="1" valign="top">37</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>3</sub></td></tr>
<tr><td colspan="1" valign="top">38</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>4</sub></td></tr>
<tr><td colspan="1" valign="top">39</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>3</sub></td></tr>
<tr><td colspan="1" valign="top">40</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>4</sub></td></tr>
<tr><td colspan="1" valign="top">41</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>3</sub></td></tr>
<tr><td colspan="1" valign="top">42</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>4</sub></td></tr>
<tr><td colspan="1" valign="top">43</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>3</sub></td></tr>
<tr><td colspan="1" valign="top">44</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>4</sub></td></tr>
<tr><td colspan="1" valign="top">45</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>3</sub></td></tr>
<tr><td colspan="1" valign="top">46</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>4</sub></td></tr>
<tr><td colspan="1" valign="top">47</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>3</sub></td></tr>
<tr><td colspan="1" valign="top">48</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>3</sub></td></tr>
<tr><td colspan="1" valign="top">49</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>3</sub></td></tr>
<tr><td colspan="1" valign="top">50</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>3</sub></td></tr>
<tr><td colspan="1" valign="top">51</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>3</sub></td></tr>
<tr><td colspan="1" valign="top">52</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>3</sub></td></tr>
<tr><td colspan="1" valign="top">53</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>3</sub></td></tr>
<tr><td colspan="1" valign="top">54</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>3</sub></td></tr>
<tr><td colspan="1" valign="top">55</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>3</sub></td></tr>
<tr><td colspan="1" valign="top">56</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>3</sub></td></tr>
<tr><td colspan="1" valign="top">57</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>3</sub></td></tr>
<tr><td colspan="1" valign="top">58</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>3</sub></td></tr>
<tr><td colspan="1" valign="top">59</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>3</sub></td></tr>
<tr><td colspan="1" valign="top">60</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>3</sub></td></tr>
<tr><td colspan="1" valign="top">61</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>3</sub></td></tr>
<tr><td colspan="1" valign="top">62</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">0</td><td colspan="1" valign="top">S<sub>3</sub></td></tr>
<tr><td colspan="1" valign="top">63</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">1</td><td colspan="1" valign="top">S<sub>3</sub></td></tr>
</table>

<a name="_toc75525424"></a> When Present State is S<sub>4</sub>

Using the <http://www.32x8.com/var6.html> website, the Sum of Min terms were generated and equations were generated to obtain equations requirement for the next state S<sub>4</sub> and/or S<sub>3</sub>.

S<sub>4</sub> = (0,2,4,6,8,10,12,14,32,34,36,38,40,42,44,46)

<i>S<sub>4</sub> = T15</i>'×E'</i>  

<i>S<sub>3</sub> = T15 + E</i>			

#### SoundOff Opticom Preemption Module**

Installation of this module in the traffic control system would allow emergency vehicle pre-emption at the intersection. The module would generate a series of pulses in the infrared wavelength and would trigger the green light of road Julius Nyerere Ave and Dr Maurice Cure St. Hence, 2 sensors would be used here. It would be placed on the traffic light robot and would be facing the direction of the road lines. The sensors would be as high as possible on the controller. The police department and Health care workers would be given a remote controller for that matter with a tracker for the sensor to identify.



#### Timers

As mentioned above, several timers are to be used for the proposed controller, including T30, T15, T65 and T5. For proper synchronization of the timers with the different sensors used, the timers T30, T15 and T5 would be reset every time there is a change in State. 555 timers or typical pulse generators could be used for generating the time pulses.


![image](https://github.com/Mouneerm/FPGA_Traffic_Controller/assets/45911394/f32b243f-4346-4ef1-9b93-5bda42a5b97d)


## Design and Simulation Results

#### Normal operation:

![image](https://github.com/Mouneerm/FPGA_Traffic_Controller/assets/45911394/e98b3197-926e-4a1b-b914-9ad466065aec)

#### When Car detected on Main road (C = 1):

![image](https://github.com/Mouneerm/FPGA_Traffic_Controller/assets/45911394/a8610c9d-deb1-45df-b424-0490ce4afbed)

#### When Emergency Vehicle detected (E=1):

![image](https://github.com/Mouneerm/FPGA_Traffic_Controller/assets/45911394/2adcc847-3a56-45af-a831-648eba85f902)


#### Pedestrian Detected (P = 1)

![image](https://github.com/Mouneerm/FPGA_Traffic_Controller/assets/45911394/773b4969-3e67-47e9-8b0a-600422f14224)

