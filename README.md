# Traffic-Light
<br> Now we are going to design a Traffic light or mainly we are going to write a traffic light RTL code and that code can be implemented to a Physical design layer.<br>

<br>Before going to code we need to imagine how we are going to write that code.<br>
<br>So we know the basic working of the traffic light it gives us the signal in the form of light and those light changes with some time interval or a delay.<br>
<br>Now if we think a more we can say that a trffic light has states which are basically it's color which is shown to us like it's in red state for some time then we have delay and then changes to yellow light state and same it has dealy then changes to a green light state and then it repeat.<br>
<br>Now if things comes to a state we can say that a traffic light works like a FSM(Finite State Machine) which also has some state and changes according to the input<br>
<br>Now if it comes to FSM things goes to a state diagram and then to a state table and then accroding to that we can write a our RTL code<br>
## State Diagram of the Traffic Light

<br>Now according to the state diagram you can see that we have a 4 State 
1.Idle state which trigger according to the RST pin of our code when it is zero it will be in idle state and when it is one it goes to another state.
2. And our next state is Green state and that state will be there till the counter value goes to 9 because we set the dealy of the green to 10 and then the counter reset to 0 after that it goes to next state
3. And our next state is Yellow state and there the counter value changes when the counter value goes to 2 because we set the counter delay to 3 and then the counter reset to 0 after that it goes to next state which is Red state.
4. Fourth and our last state Red state in this state the dealy will be same as our dealy of the Green light for 13 counter intervals and then the counter reset to 0 it and then after that it repeat again and again and if the rst pin goes to 1 then the state it goes to Idle state
<br>

## State Table 
| State        | Number of Clock Cycles |
| ------------ | ---------------------: |
| Idle / Reset |                      0 |
| Green        |                     10 |
| Yellow       |                      3 |
| Red          |                     13 |

<br> The above table is written according to our state diagram states<br>

<br> And the below table is according to our main code I use the code for two road by calling them main road and side road but the overall timing is same.<br>


| State | Main road | Side road |  Duration |
| ----- | --------- | --------- | --------: |
| `S0`  | Green     | Red       | 10 clocks |
| `S1`  | Yellow    | Red       |  3 clocks |
| `S2`  | Red       | Green     | 10 clocks |
| `S3`  | Red       | Yellow    |  3 clocks |


## Final Output waveform of the Trafic light :
<img width="1137" height="543" alt="image" src="https://github.com/user-attachments/assets/3009514b-7cb9-40f7-b893-76dfca114655" />

<img width="1137" height="543" alt="image" src="https://github.com/user-attachments/assets/f77ee804-60f0-4770-b79d-045b556e9beb" />
## Final Testbench Output of the Trafic light :
<img width="661" height="932" alt="Screenshot From 2026-07-12 21-19-55" src="https://github.com/user-attachments/assets/b5f67c78-6928-46c9-9bfb-b076bab27b7c" />
