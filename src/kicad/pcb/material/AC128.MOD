* AC128 PNP Germanium Transistor
*
* SPICE (Simulation Program with Integrated Circuit Emphasis)
* MODEL
*
* Connections:
*                  E
*                  |    B
*                  |    |    C
*                  |    |    |
*                  1    2    3
.MODEL AC128 PNP(IS=1U BF=75 VAF=25
+ CJC=10P CJE=5P VJC=0.2 VJE=0.2
+ TF=10N TR=100N EG=0.67)
.END

