<h1 align="center">ME552 Mechatronic Systems Design</h1>
yeeyoung@umich.edu
09-12-2016
----
## [Introduction]
This ducument is used for recording some notes for mechatronic systems designing. Lab 1 is about basics of electronic circuits.
## [Electronic Circuits]
* voltage, current, power
* how to determine the passive source and active source elements in a circuit.
    * passive sign convenntion(PSC)
    * resistors, capacitors, inductance are passive source elements 
    * voltage source, current source are active source elements 
* electircal impedance compared to mechanical impedance
    * mechanical elements: displacement, velocity, accelaration, force
    * electrical elements: the amount of charge, current, current rate, voltage
    * mechanical and electrical can be equivalent: mass - inductor, spring - capacitor, damper - resistor.
* we will use equivalent circuits to simplify the complicated circuits:
    * Thevenin Equivalent Circuits. An ideal voltage source plus a resistor in series
    * Norton Equivalent Circuits. An ideal current source plus a resistor in parallel
* system response = the dynamic characteristics + KVL + KCL + passive sign convention
    * typical circuits: RC circuits, LR circuits, LRC circuits
    * RC and LR circuits are both first order circuits, the impedance is easily solved, the time constant for RC circuits is RC, constant for LR is L/R.
    * LRC circuit is a second order circuits.
    * impedance for C is 1/CD, impedance for L is LD, impedance for R is R.
## [Operational Amplifier]
The Op Amp is a circuit element consisted of capacitors and resistors, it can be used to amplify the input signals and commit operations for input signals.
* 741 Op Amp has 8 pins, 2 - inverting input, 3 - noninverting input, 4 - -15v, 7 - +15v, 6 - output. 
* we can use TEC and NEC to simplify Op Amp inner circuits. The input impedance can be assumed to be infinity, the output infinity can be assumed to be zero, the two input potentials can be assumed to be equal and two input current flow can be assumend to be zero.
* some examples for operational amplifier involved circuits.
## [DAQ Basics]
lab 1 requirments: 100 kohm, 200 kohm, 741 Op Amp, hard core wire, jumper wire, breakout board, breadboard
* Step 1: Open Labview and configure MAX, create a time loop in the block diagram
* Step 2: Change start period to 1ms, create two DAQ module inside time loop, one is for input and another is for output, the input will be associated with a graph indicator
* Step 3: Change graph indicator to ... and drag a sine wave vi into out block diagram, configure its parameters like amplitude/frequency/phase/DC offset etc.
* Step 4: Link time loop start point, sine wave module and output DAQ module inside the block diagram.
* Step 5: Get prepared with the physical circuits to be linked to the computer via a PCI bus interface.
* Step 6: change parameters for the input sine wave inside front panel and run th  graph indicator, analyze the output curves on the graph.
