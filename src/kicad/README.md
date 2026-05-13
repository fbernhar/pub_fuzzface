
# :cat:  KiCAD - FuzzFace Build


### Part 1. Schemantic Editor

Start by following the `README.md` in the  `Circuit` directory!


### Part 2. PCB Editor

Continue by following the `README.md` in the  `PCB` directory!



##  :sparkles: Possible Improvements and Next Steps

The PCB from this workshop is meant to be simple, understandable, and beginner-friendly. 

From here, you can refine the project and make it more accurate, more compact, more robust, and more professional.

### :control_knobs: Use Real Potentiometer Footprints

In this workshop, the potentiometers are connected with solder pads and wires.

That is practical and flexible, but you can also place the potentiometers directly on the PCB.

To do that, choose the exact potentiometers you want to buy and check their datasheet. Then either find a matching KiCad footprint online or create a custom footprint from the datasheet dimensions.

Check especially:

```text
pin spacing
pin diameter
shaft position
mounting holes
body size
orientation on the PCB
```

This makes the PCB more specific, but also cleaner and easier to assemble.

### :radio: Create a Proper AC128 Symbol and Footprint

For the workshop, we used a practical shortcut for the AC128 transistors.

A better long-term solution is to create a custom AC128 symbol and footprint that match the real transistor exactly.

For our AC128 pinout:

```text
1 = Emitter
2 = Base
3 = Collector
```

A clean custom symbol would use:

```text
pin 1 = E
pin 2 = B
pin 3 = C
```

A clean custom footprint would use:

```text
pad 1 = E
pad 2 = B
pad 3 = C
```

This makes the PCB much safer to assemble, because the schematic, footprint, and real transistor all use the same pin order.

### :mag: Check the Real Parts Before Ordering PCBs

Before sending the PCB to a manufacturer, it is a good idea to choose the actual parts you want to use.

Check:

```text
resistor size
capacitor diameter
capacitor pin spacing
potentiometer type
jack type
battery connector
switch type
transistor pinout
```

Then compare those parts with the footprints in KiCad.

This step prevents the classic beginner problem:

```text
The circuit is correct, but the part does not physically fit the PCB.
```

### Try SMD Parts for a Smaller PCB

This workshop uses through-hole parts because they are easier to see, easier to understand, and beginner-friendly to solder.

Through-hole parts look like this:

```text
lead ──[ component body ]── lead
```

They are great for learning because the parts are large and easy to handle.

However, many modern PCBs use **SMD parts** instead.

SMD means:

```text
Surface-Mount Device
```

SMD parts are soldered directly onto the surface of the PCB. They do not need long legs going through holes.

That means an SMD version of the circuit can be:

```text
smaller
lighter
more compact
cleaner in layout
cheaper for mass production
easier to assemble by machine
```

For example, a through-hole resistor is quite large, while an SMD resistor can be tiny:

```text
Through-hole resistor:

lead ──[  resistor body  ]── lead


SMD resistor:

[0805]
```

Common SMD resistor and capacitor sizes are:

```text
1206   large SMD, easier to hand solder
0805   medium size, still hand-solderable
0603   small, possible but harder
0402   very small, not beginner-friendly
```

For a first SMD version, `0805` is a nice compromise. It is much smaller than through-hole, but still possible to solder by hand with practice.

A future compact version could use:

```text
0805 resistors
0805 or 1206 capacitors
SMD pads for jacks and switches
a smaller board outline
```

The AC128 transistors are still vintage through-hole metal-can parts, so they would probably remain through-hole. That can create a nice mixed design:

```text
SMD resistors and capacitors
through-hole AC128 transistors
through-hole pads for wires, pots, and jacks
```

This keeps the vintage transistor character while making the rest of the PCB more compact.

### :wrench: Improve the Layout

You can also refine the board layout itself.

Ideas:

```text
make the board smaller
make the signal path shorter
move input and output pads to useful positions
add mounting holes
add clearer silkscreen labels
add polarity markings for capacitors
add E/B/C markings for transistors
add labels for potentiometer pins
add a small title or version number
```

For example, useful silkscreen labels could be:

```text
FUZZ FACE v1.0

IN
OUT
BAT+
BAT-

FUZZ 1 2 3
VOL 1 2 3

Q1 E B C
Q2 E B C
```

These little labels make the board much easier to solder and debug.

### :test_tube: Compare Simulation and Reality

After building the real pedal, compare it with the simulation.

Measure:

```text
Q1 collector voltage
Q2 collector voltage
battery voltage
input signal
output signal
```

Then compare those values with the DC operating point simulation.

Do not expect them to match perfectly. Germanium transistors can vary a lot, especially old AC128 parts.

That is part of the charm of this circuit.

### :bulb: Main Idea

This workshop version is intentionally simple.

The next step is to slowly replace the shortcuts with more accurate design choices:

```text
generic footprints       → real part footprints
quick transistor setup   → proper AC128 symbol and footprint
wire pads                → exact potentiometer and jack footprints
through-hole parts       → smaller SMD parts where useful
basic layout             → cleaner, labeled, production-ready PCB
```

That is how a beginner project gradually becomes a more professional PCB design.
