# :rocket:  Part I:  Schemantic Editor 


## 1. Install KiCad

Download and install KiCad from:

https://www.kicad.org/download/

After installation, start KiCad...

## 2. Create a New Project

Click the top-left icon:

`New Project...`

Choose:

`Default`

Then choose a folder and give the project a name, for example:

`FuzzFace`

After creating the project, the KiCad project window opens.

```text
┌────────────────────────────────────────────────────────────────────────────────┐
│ FuzzFace — KiCad 10.0                                                          │
├─────────────── Project Files ────────────────┬─────────────────────────────────┤
│                                              │                                 │
│                                              │  [ Schematic Editor ]           │
│                                              │    Edit the project schematic   │
│                                              │                                 │
│                                              │  [ Symbol Editor ]              │
│                                              │    Edit symbol libraries        │
│                                              │                                 │
│                                              │  [ PCB Editor ]                 │
│                                              │    Edit the project PCB design  │
│                                              │                                 │
│                                              │  [ Footprint Editor ]           │
│                                              │    Edit PCB footprint libraries │
│                                              │                                 │
│                                              │  [ Gerber Viewer ]              │
│                                              │    Preview Gerber files         │
│                                              │                                 │
│                                              │  [ Image Converter ]            │
│                                              │    Bitmap → symbols/footprints  │
│                                              │                                 │
│                                              │  [ Calculator Tools ]           │
│                                              │    Electrical calculators       │
│                                              │                                 │
│                                              │  [ Drawing Sheet Editor ]       │
│                                              │    Borders & title blocks       │
│                                              │                                 │
│                                              │  [ Plugin & Content Manager ]   │
│                                              │    Manage downloadable content  │
│                                              │                                 │
├────────────────────────────────────────────────────────────────────────────────┤
│ Project: ~/KiCad/FuzzFace/FuzzFace.kicad_pro                                   │
└────────────────────────────────────────────────────────────────────────────────┘
```
Click:

`Schematic Editor`

A blank schematic sheet opens.

You can work with the toolbar on the right side, but for this workshop we mostly use keyboard shortcuts.

## 3. Placing Components
### 3.1 Resistors

Press:

`A`

This opens the Place Symbol search window.

Search for:

`resistor`

or simply:

`R`

Press Enter.

The resistor symbol is now attached to your mouse cursor. Click on the schematic to place it.

To rotate a component before placing it, press:

`R`

After placing a resistor, it has a name and a value.

Example:
```text
      o
      |
     /\
     \/     R1  ← reference / name
     /\
     \/     33k ← value
      |
      o
```

You can edit the name or value by hovering over the text and double-clicking it.
Alternatively, select the component and press:

`E`

Place all resistors from the schematic and set their values.

Typical resistor values in this circuit:
```text
R1 = 33k
R2 = 100k
R3 = 470
R4 = 8.2k
```

## 3.2 Capacitors

Press:

`A`

Search for:

`capacitor`

or:

`C`

for a normal non-polarized capacitor.

Use:

`C_Polarized`

or:

`C_Polarized_US`

for polarized electrolytic capacitors.

A polarized capacitor has a + or - marking. This matters because electrolytic capacitors must be placed with the correct polarity.

Typical capacitor values in this circuit:
```text
C1 = 2.2uF
C2 = 20uF or 22uF
C3 = 0.01uF
````
Place all capacitors and set their values.

## 3.3 Transistors

The original Fuzz Face uses germanium PNP transistors. In this workshop, we use an AC128 transistor model.

First, we place a generic PNP transistor symbol. Then we attach the AC128 SPICE model to it.

Press:

`A`

Search for:

`PNP`

Choose the PNP transistor from the SPICE simulation library if available.

The relevant library category is usually:

`Simulation_SPICE`

You may see entries like this:
```text
Simulation_SPICE/
├── BSOURCE
├── ESOURCE
├── GSOURCE
├── IDC
├── ISIN
├── VDC
├── VSIN
├── D
├── NPN
├── PNP
└── ...
```

Place two PNP transistors.

Name them:
```text
Q1
Q2
```
Set their value to:

`AC128`

## 3.4 Assigning the AC128 SPICE Model

The PNP symbol is only a placeholder. KiCad still needs to know which transistor model to use for simulation.

Select the transistor and press:

`E`

Then click:

`Simulation Model...`

A window like this opens:
```text
+---------------------------------------------------------------------+
|                     Simulation Model Editor                         |
+---------------------------------------------------------------------+
| [Model]                                  [Pin Assignments]          |
+---------------------------------------------------------------------+
| ( ) SPICE model from file (*.lib, *.sub, *.ibs)                     |
|     File   : [ ................................................. ]  |
|     Model  : [ Search ........................................... ] |
|                                                                     |
| (x) Built-in SPICE model                                            |
|     Device      : PNP BJT                                           |
|     Device type : Gummel-Poon                                       |
+---------------------------------------------------------------------+
|                        [ Parameters | Code ]                        |
+------------------------------+-----------+---------+---------+------+
| Parameter                    | Value     | Unit    | Default | Type |
+------------------------------+-----------+---------+---------+------+
| instance temperature (temp)  |           | °C      |         | Float|
| > Geometry                   |           |         |         |      |
| > DC                         |           |         |         |      |
| > Capacitance                |           |         |         |      |
| > Temperature                |           |         |         |      |
| > Noise                      |           |         |         |      |
| > Limiting Values            |           |         |         |      |
+------------------------------+-----------+---------+---------+------+
| [ ] Save primary parameter in Value field                           |
+---------------------------------------------------------------------+
|                               ( Cancel )   ( OK )                   |
+---------------------------------------------------------------------+
```

Select:

`SPICE model from file (*.lib, *.sub or *.ibs)`

Then choose the provided AC128 model file.

Example:

`AC128.MOD`

Make sure the selected model is:

`AC128`

Example:
```text
+--------------------------------------------------------------+
|                Simulation Model Editor                       |
+---------------------------+----------------------------------+
| [Model]                   | [Pin Assignments]                |
+---------------------------+----------------------------------+
| (x) SPICE model from file (*.lib, *.sub or *.ibs)            |
|     File  : AC128.MOD                                        |
|     Model : AC128                                            |
|                                                              |
| ( ) Built-in SPICE model                                     |
|     Device :                                                 |
+--------------------------------------------------------------+
|                  ( Cancel )   ( OK )                         |
+--------------------------------------------------------------+
```

## 3.5 Pin Assignments

This step is important.

The symbol pins and the model pins may not use the same order. If the pins are wrong, the simulation will behave incorrectly.

Open the **Pin Assignments tab**.

Use this assignment:
```text
+---------------------------+----------------------------------+
| Symbol Pin                | Model Pin                        |
+---------------------------+----------------------------------+
| 1 ("C")                   | 3 ("E")                          |
| 2 ("B")                   | 2 ("B")                          |
| 3 ("E")                   | 1 ("C")                          |
+---------------------------+----------------------------------+
````
Then click:

`OK`

This makes the simulation work with the provided AC128 model.

Important note:

This is a quick workshop method. It makes the SPICE simulation work, but it does not necessarily mean the symbol pinout is correct for making a PCB.

For a real PCB, the cleaner solution is to create or use a transistor symbol and footprint with the correct pin order.

For now, this is good enough for simulation.

## 3.6 Potentiometers

Press:

`A`

Search for:

`potentiometer`

Use a SPICE-compatible potentiometer from:

`Simulation_SPICE`

Place two potentiometers:
```text
R_pot1 = 1k       Fuzz control
R_pot2 = 500k     Volume control
```
A potentiometer has three pins:
```text
pin 1 ─── resistive track ─── pin 3
                  │
                pin 2
                wiper
```
The wiper is the moving contact.

In simulation, the wiper position is usually controlled by a parameter such as:
```text
r=1k pos=0.5
```
`r` is the total resistance.
`pos` is the knob position:

```text
pos=0.0   one end
pos=0.5   middle
pos=1.0   other end
````

## 3.7 Voltage Sources

For the battery, place a DC voltage source:

`VDC`

Set it to:

`9V`

This circuit is a positive-ground PNP circuit. That means many simulated node voltages will be negative with respect to ground.

Also place a ground symbol.

You can usually add ground by pressing:

`O`

or by searching for:

`GND`


## 4. Arrange and Wire the Schematic

Arrange the components so the circuit is easy to read.

Use:

`W`

to draw wires.

Useful shortcuts:
```text
M   move item
G   drag item while keeping connections
R   rotate item
E   edit properties
D   delete item
```
Try to make the schematic clean and readable. This is important when learning, debugging, or explaining the circuit to others.

## 5. Add Helpful Net Labels

KiCad gives unnamed wires automatic names like:
```text
Net-_C1-Pad1_
Net-_C3-Pad2_
Net-_Q2-C_
```

These names are correct, but not beginner-friendly.

For the workshop, add labels to important nodes.

Use:

`L`

Suggested labels:
```text
IN             before C1, at the signal source
Q1_BASE        after C1, at the base of Q1
Q2_COLLECTOR   collector of Q2, before C3
OUT            after C3, at the output / volume pot side
```
This makes simulation plots much easier to understand.

Instead of plotting:
```text
V(Net-_C3-Pad2_)
````
you can plot: 
```text
V(OUT)
```

## 6. Check the Circuit for Errors

Before simulating, run the Electrical Rules Checker.

Look for the icon in the top toolbar that looks like a checklist, or open:

Inspect → Electrical Rules Checker

Then click:

`Run ERC`

```text
┌──────────────────────────────────────────────────────────────┐
│                  Electrical Rules Checker                    │
├──────────────────────────────────────────────────────────────┤
│                                                              │
│   [ Violations ]     [ Ignored Tests ]                       │
│                                                              │
│  ┌────────────────────────────────────────────────────────┐  │
│  │                                                        │  │
│  │                                                        │  │
│  │                                                        │  │
│  │                                                        │  │
│  │                                                        │  │
│  └────────────────────────────────────────────────────────┘  │
│                                                              │
│  Show:                                                       │
│   ☐ All      ☑ Errors      ☐ Warnings      ☐ Exclusions      │
│                                                              │
│  ┌───────────────┐  ┌────────────────────┐                   │
│  │ Delete Marker │  │ Delete All Markers │                   │
│  └───────────────┘  └────────────────────┘                   │
│                                                              │
│                                          ┌──────────┐        │
│                                          │  Save... │        │
│                                          └──────────┘        │
│                                                              │
│                              ┌────────┐   ┌─────────┐        │
│                              │ Close  │   │ Run ERC │        │
│                              └────────┘   └─────────┘        │
└──────────────────────────────────────────────────────────────┘
```

ERC finds schematic problems such as unconnected pins, missing power connections, or other electrical mistakes.

It is good practice to run ERC before simulation and before moving to PCB layout.

## 7. Open the SPICE Simulator

In the top toolbar, click the simulator icon. It looks like a small waveform on a white or blue background.

The SPICE simulator window opens.

```text
+----------------------------------------------------------------------------------+
|                 *FuzzFace — SPICE Simulator                                      |
+----------------------------------------------------------------------------------+
| [Open] [Save] [AC] [DC] [Run] [Stop] [Zoom+] [Zoom-] [Fit] [Cursors] [NET]       |
+----------------------------------------------------------------------------------+
|                                                                 | Filter         |
|                                                                 | [___________]  |
|                                                                 | Signal |Plot|  |
|                                                                 |----------------|
|                                                                 |                |
|                                                                 |                |
|                                                                 |                |
|                                                                 |----------------|
|                                                                 | Cursor |Signal |
|                                                                 |----------------|
|                                                                 |                |
|                                                                 |----------------|
|                                                                 | Measurement    |
|                                                                 |----------------|
|                                                                 |                |
+----------------------------------------------------------------------------------+
| Console                                                                        ▲ |
|----------------------------------------------------------------------------------|
| List of plots available:                                                         |
|   Current const  Constant values (constants)                                     |
|                                                                                  |
| Note: Model file loading path is ~/Documents/...                                 |
| Note: Compatibility modes selected: ps lt a                                      |
| Circuit: KiCad schematic                                                         |
+----------------------------------------------------------------------------------+
```

To add a new analysis, click the button with a waveform and a small plus sign.

## 8. Simulation 1 — DC Operating Point
What this simulation shows

The DC operating point tells us the steady voltages and currents in the circuit before any audio signal is applied.

This is useful because a transistor circuit must be correctly biased before it can amplify or distort audio properly.

In other words:
```text
DC operating point answers:
"Is the circuit sitting at reasonable voltages?"
```

#### How to run it

Add a new simulation tab.

Choose:

`OP — DC Operating Point`

Click:

`OK`

Then click the blue:

`Run`

button.

KiCad will show voltages and currents on the schematic.

Important nodes to check:
```text
Q1 base
Q1 collector
Q2 base
Q2 emitter
Q2 collector
```

For many Fuzz Face circuits, the Q2 collector is often adjusted near:
```text
-4.5 V
````
with a 9 V positive-ground supply.

Do not worry if your values are not exactly the same as online examples. Germanium transistors vary a lot, and the AC128 model strongly affects the bias point.

## 9. Simulation 2 — Transient Analysis
What this simulation shows

Transient analysis shows voltage over time.

This is the simulation we use to see the waveform get clipped.
```text
Transient analysis answers:
"What happens to the audio waveform over time?"
```
This is the best simulation for showing fuzz distortion.

#### Input signal

Make sure your circuit includes a sine voltage source:

`VSIN`

Suggested setting:
```text
dc=0 ampl=0.2 f=440 ac=1
```
For a softer input, use:
```text
dc=0 ampl=0.05 f=440 ac=1
````
For stronger fuzz, use:
```text
dc=0 ampl=0.2 f=440 ac=1
```

#### Create the transient simulation

Add a new simulation tab.

Choose:

`TRAN — Transient Analysis`

```text
┌──────────────────────────────────────────────────────────────────┐
│                        New Simulation Tab                        │
├──────────────────────────────────────────────────────────────────┤
│                                                                  │
│  Analysis type:  [ TRAN — Transient Analysis              ▾ ]    │
│                                                                  │
│        ┌──────────────────┬──────────────┐                       │
│        │  SPICE Command   │  Plot Setup  │                       │
│        └──────────────────┴──────────────┘                       │
│                                                                  │
│  Time step:       [              ]  seconds                      │
│                                                                  │
│  Final time:      [              ]  seconds                      │
│                                                                  │
│  Initial time:    [              ]  seconds  (optional; default0)│
│                                                                  │
│  Max time step:   [              ]  seconds                      │
│                                (optional; default min{tstep,     │
│                                 (tstop-tstart)/50})              │
│                                                                  │
│  ☐ Use initial conditions                                        │
│                                                                  │
│                                                                  │
│  ☑ Add full path for .include library directives                 │
│  ☑ Save all voltages                                             │
│  ☑ Save all currents                                             │
│  ☑ Save all power dissipations                                   │
│  ☑ Save all digital event data                                   │
│                                                                  │
│  Compatibility mode:  [ PSpice and LTSpice                ▾ ]    │
│                                                                  │
│                                             ┌────────┐ ┌──────┐  │
│                                             │ Cancel │ │  OK  │  │
│                                             └────────┘ └──────┘  │
└──────────────────────────────────────────────────────────────────┘
````
Use these settings:
```text
Time step:      5u
Final time:     120m
Initial time:   100m
````
Why do we start at 100m?

At the beginning of the simulation, capacitors are charging and the circuit is settling. By starting the plot later, we skip the messy startup part and only look at the stable waveform.
Click:

`OK`

Then click:

`Run`

#### What to plot

For a simple input-vs-output comparison, plot:
```text
V(IN)
V(OUT)
````
If you did not add labels, use:
```text
V(Net-_C1-Pad1_)    input before C1
V(Net-_C3-Pad2_)    output after C3
```

You can plot signals in two ways:
1. Tick the signals in the list on the right side of the simulator.
2. Select the probe tool and click directly on a wire in the schematic.

#### How to explain the result

You should see:
```text
input  = smooth sine wave
output = clipped/distorted waveform
````
Beginner-friendly explanation:
```text
The input is a smooth sine wave, like a clean guitar signal.

The output is no longer smooth. The transistor stages have pushed the signal
into clipping. This changes the shape of the waveform.

That shape change creates distortion. In this circuit, we hear it as fuzz.
```

## 10. Simulation 3 — FFT
What this simulation shows

FFT means:

**Fast Fourier Transform**

It shows which frequencies are inside a waveform.

This is useful because clipping creates extra frequencies called harmonics.
```text
FFT answers:
"What frequencies were created by the distorted waveform?"
````
#### How to run FFT

First run a transient analysis where the output waveform is visibly clipped.

Then add a new simulation tab and choose:

`FFT — Frequency Content Analysis`

Choose the transient result as the source, not the AC result.

Plot:
```text
V(OUT)
````
or:
```
V(Net-_C3-Pad2_)
```

#### What you should see
A clean 440 Hz sine wave mostly has one frequency:
```text
440 Hz
````

A clipped fuzz waveform has extra harmonics:
```text
440 Hz      fundamental
880 Hz      2nd harmonic
1320 Hz     3rd harmonic
1760 Hz     4th harmonic
2200 Hz     5th harmonic
...
```

## 11. :bulb: What We Learned

In this first part, we built and simulated a Fuzz Face circuit.

We used three simulation types:
```text
DC Operating Point:
  shows the static bias voltages and currents

Transient Analysis:
  shows the waveform over time and reveals clipping

FFT:
  shows the harmonics created by clipping
```
That is the basic idea behind this pedal:
```text
The circuit first needs a correct DC bias.

Then the guitar signal is amplified.

When the signal becomes too large, the transistor stages clip it.

That clipping creates harmonics.

Those harmonics are what we hear as fuzz.
```

## Outline
### Schemantic Reference [2]
```text
                                     0.01u
               (-9V)----"470"----|----||----|
                 |               |          |
                 |             "8.2K"       |
               "33K"             |          500K --- OUT
                 |              /           POT
                 |             /c           |
                /-------------|b            |
     2.2u      /c              ^e           |
IN ----||-----|b                \           |
      +    |   ^e               |           |
           |    \               |           |
           |  (+Ground)         |           |
           |                    |           |
           |---------- 100K ----|           |
                                |           |
                                1K ---|     |
                                POT   |     |
                                |     = 22u |
                                |     |+    |
                                |     |     |
                                |     |     |
                               (+++++++Ground)
```

### Keyboard Shortcut
```text
+----------------------+-------------------------------+
| Shortcut             | Action                        |
+----------------------+-------------------------------+
| A                    | Add symbol / footprint        |
| W                    | Place wire / route track      |
| R                    | Rotate item                   |
| M                    | Move item                     |
| G                    | Drag item, keep connections   |
| C                    | Copy item                     |
| D                    | Delete item                   |
| E                    | Edit properties               |
| X / Y                | Mirror horizontal / vertical  |
| Ctrl + Z             | Undo                          |
| Ctrl + Y             | Redo                          |
| Ctrl + S             | Save                          |
| Ctrl + Shift + R     | Reload from schematic         |
| B                    | Refill zones in PCB editor    |
| F                    | Flip to other PCB side        |
+----------------------+-------------------------------+
```

### Resources
- [1] https://www.electrosmash.com/fuzz-face 
- [2]  https://www.physics.mcgill.ca/~grant/Stuff/fuzzface.txt 










