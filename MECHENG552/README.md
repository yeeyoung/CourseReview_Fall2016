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
