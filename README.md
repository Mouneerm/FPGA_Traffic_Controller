# FPGA_Traffic_Controller


### Introduction
In this project, a Smart Traffic Light Controller was implemented in a dense traffic area in Mauritius using Finite State Machines. The location was chosen to be the intersection of Dr Maurice Cure St, Road A1, and Julius Nyerere Ave at Rose-Hill was chosen.

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

<a name="_toc75525414"></a>Table 7: State transition table for Pedestrian Controller

For SX = 0 and SY = 1, using online tool <http://www.32x8.com/index.html> P is given by	

P = M(6,7,8,9,10,11,16,18,20,22,24,26) 

P = \\sum 
M(6,7,8,9,10,11,16,18,20,22,24,26)

P = (SX'×n1 ×n0')+(n1 × n0'×T15') +(SX×n1 ×T15')+(SX'×n1' ×n0 ×T65)
## <a name="_toc75525228"></a>**5.3 Thermal imaging Camera Sensor Positioning**

The camera shall be positioned such that it would cover a portion of the area whereby pedestrians would stand to cross the road. The sensor would be fitted about 3.4 m above the level ground and directed downwards towards the crossing and adjacent pavement. An advantage of this sensor would be that the trigger cancellation occurs in the event the person moves away from the sensor.

