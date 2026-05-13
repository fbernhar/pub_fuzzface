# :rocket:  Part II:  PCB Editor

In Part I we built and simulated the Fuzz Face circuit in the **Schematic Editor**.  
Now we will turn the schematic into a real PCB layout.

## 1. Preparing the Schematic for the PCB Editor

Before we move to the PCB Editor, we need to assign **footprints** to our components.

A schematic symbol is abstract. It only tells KiCad what the part does electrically.

A footprint is physical. It tells KiCad how the part looks on the PCB:

```text
symbol    = electrical meaning
footprint = physical size, holes, pads, spacing
```

For example, a resistor symbol only says:

```text
this is a resistor
```

But the footprint says:

```text
how long the resistor body is
how far apart the holes are
how large the solder pads are
where the part sits on the PCB
```

To assign a footprint:

1. Click a component.
2. Press `E` to open the **Symbol Properties** window.
3. Click into the **Footprint** field.
4. Click the small library icon.
5. Choose the footprint.

Example:

```text
┌──────────────────────────────────────────────────────────────────────────────────────────────┐
│                                      Symbol Properties                                       │
├──────────────────────────────────────────────────────────────────────────────────────────────┤
│                         [ General ] [ Pin Functions ] [ Embedded Files ]                     │
│                                                                                              │
│  Fields                                                                                      │
│  ┌─────────────┬──────────────────────────────────────────────────────┬──────┬───────────┐   │
│  │ Name        │ Value                                                │ Show │ Show Name │   │
│  ├─────────────┼──────────────────────────────────────────────────────┼──────┼───────────┤   │
│  │ Reference   │ R1                                                   │  ☑   │     ☐     │   │
│  │ Value       │ 33K                                                  │  ☑   │     ☐     │   │
│  │ Footprint   │                                                      │  ☐   │     ☐     │   │
│  │ Datasheet   │                                                      │  ☐   │     ☐     │   │
│  │ Description │ Resistor                                             │  ☐   │     ☐     │   │
│  └─────────────┴──────────────────────────────────────────────────────┴──────┴───────────┘   │
│                                                                                              │
│  General                                           Attributes                                │
│  ┌──────────────────────────────────────┐          ┌─────────────────────────────────────┐   │
│  │ Unit:        [                     ] │          │ ☐ Exclude from simulation           │   │
│  │ Body style:  [                     ] │          │ ☐ Exclude from bill of materials    │   │
│  │                                      │          │ ☐ Exclude from board                │   │
│  │ Angle:       [ 180                 ] │          │ ☐ Exclude from position files       │   │
│  │ Mirror:      [ Not mirrored        ] │          │ ☐ Do not populate                   │   │
│  │                                      │          └─────────────────────────────────────┘   │
│  │ ☐ Show pin numbers    ☑ Show pin names                                                    │
│  └──────────────────────────────────────┘                                                    │
│                                                                                              │
│  Library link: Device:R                                                                      │
│                                                                                              │
│                                      ┌────────────────────┐ ┌────────┐ ┌──────┐              │
│                                      │ Simulation Model…  │ │ Cancel │ │  OK  │              │
│                                      └────────────────────┘ └────────┘ └──────┘              │
└──────────────────────────────────────────────────────────────────────────────────────────────┘
```

For a professional PCB, you would normally choose a footprint that exactly matches the real part from its datasheet.

For this workshop, we use generous through-hole footprints. This is slightly hacky, but beginner-friendly. The parts are easier to solder, and the PCB is more forgiving if the real components are not exactly identical.

## 2. Resistor Footprints

Choose one resistor and press:

`E`

Click into the **Footprint** field and choose a through-hole axial resistor footprint.

A good generic footprint is:

```text
Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal
```

For this workshop I used a slightly larger footprint:

```text
Resistor_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P15.24mm_Horizontal
```

This gives more room to bend the resistor legs.

The footprint name means:

```text
R_Axial     = axial resistor footprint
DIN0309     = package size style/category
L9.0mm      = body length
D3.2mm      = body diameter
P15.24mm    = pad pitch / hole-to-hole distance
Horizontal  = resistor lies flat on the PCB
```

Body length:

```text
lead ──[  9.0 mm body  ]── lead
```

Body diameter:

```text
     3.2 mm
      ↓
lead ─[====]─ lead
```

Hole spacing:

```text
o───────────────o
     15.24 mm
```

Simple rule:

```text
L = component body length
D = component body diameter
P = distance between PCB holes
```

Use the same resistor footprint for:

```text
R1 = 33k
R2 = 100k
R3 = 470
R4 = 8.2k
```

## 3. Capacitor Footprints

For the capacitors, we need to distinguish between polarized and non-polarized capacitors.

### 3.1 C1 and C2

C1 and C2 are electrolytic capacitors, so they are polarized.

Use:

```text
C1 - Capacitor_THT:CP_Radial_D6.3mm_P2.50mm
C2 - Capacitor_THT:CP_Radial_D6.3mm_P2.50mm
```

The footprint name means:

```text
CP_Radial = polarized capacitor with both leads on one side
D6.3mm    = body diameter around 6.3 mm
P2.50mm   = pin spacing / hole-to-hole distance of 2.50 mm
```

For my version I used:

```text
Capacitor_THT:CP_Radial_D6.3mm_P2.50mm
```

Top view:

```text
   ← 6.3 mm →
   _________
  /         \
 |           |
  \_________/

  o──2.50mm──o
```

### 3.2 C3

C3 is:

```text
0.01uF
```

That is the same as:

```text
10nF
```

This is usually a small non-polarized film or ceramic capacitor.

A possible footprint is:

```text
C3 - Capacitor_THT:C_Radial_D6.3mm_H5.0mm_P2.50mm
```

For my version I used:

```text
Capacitor_THT:C_Radial_D5.0mm_H11.0mm_P2.00mm
```

This is okay for the workshop, but in a real project you should check the capacitor datasheet before ordering the PCB.

### 3.3 Capacitor Polarity

For polarized capacitors, the `+` side in the schematic must match the `+` pad on the PCB.

In KiCad, this is done by pin and pad numbers.

Usually:

```text
symbol pin 1 = positive
symbol pin 2 = negative
```

and:

```text
footprint pad 1 = positive
footprint pad 2 = negative
```

When soldering the real capacitor:

```text
longer leg  = positive
stripe side = negative
```

This Fuzz Face circuit is a positive-ground PNP circuit, so capacitor polarity can feel a bit unusual. Trust the schematic and the simulated DC voltages.

## 4. Transistor Footprints

For the AC128 transistors, choose a metal-can transistor footprint.

A close generic KiCad footprint is:

```text
Package_TO_SOT_THT:TO-18-3
```

Use this for both transistors:

```text
Q1
Q2
```

Important:

The AC128 pinout must be checked carefully.

For our AC128 transistors, the physical pinout is:

```text
1 = Emitter
2 = Base
3 = Collector
```

or shorter:

```text
1 = E
2 = B
3 = C
```

Earlier, for the simulation, we changed the SPICE pin assignment so the AC128 simulation model works.

That does not automatically mean the PCB footprint is correct.

There are two different mappings:

```text
1. symbol pins → SPICE model pins
2. symbol pins → PCB footprint pads
```

For a clean PCB, the symbol and footprint should match the real transistor:

```text
symbol pin 1 = E
symbol pin 2 = B
symbol pin 3 = C

footprint pad 1 = E
footprint pad 2 = B
footprint pad 3 = C
```

The proper solution is to create a custom AC128 symbol and footprint.

:warning: For this workshop, we keep it practical. If you do not create a custom symbol and footprint, make sure you remember the real AC128 pinout during soldering and mark it clearly.

## 5. Solder Wire Pads

Some components are not directly placed on the PCB.

Examples:

```text
battery clip
input jack
output jack
potentiometers
switches
```

For these parts, we use solder pads on the PCB and connect the real components with wires.

The schematic symbol is:
```text
Connector_Generic:Conn_01x01
```

The corresponding footprint is:

```text
Connector_Wire:SolderWire-0.5sqmm_1x01_D0.9mm_OD2.3mm
```


Think of it like this:

```text
schematic symbol        PCB footprint
---------------         ----------------
Conn_01x01      --->    one solder hole / wire pad
Conn_01x02      --->    two solder holes
Conn_01x03      --->    three solder holes
```

For this project we use several `Conn_01x01` symbols as labeled solder pads.

## 6. Replacing Simulation Sources with Real PCB Connections

The simulation schematic used ideal voltage sources such as:

```text
VDC
VSIN
```

These are useful for simulation, but they are not real parts we solder onto the PCB.

For the PCB version, we replace them with connector pins / solder pads as explained above.

### 6.1 Battery Connection

Delete the simulated 9V battery source.

Place two connector pins:

```text
Conn_01x01
Conn_01x01
```

Name them for example:

```text
Vin-9V
Vout+9V
```

or:

```text
BAT-
BAT+
```

Use names that will still make sense when you look at the PCB later.

### 6.2 Input Connection

Delete the input voltage source.

Place two connector pins:

```text
IN+
IN-
```

`IN+` goes to the input capacitor C1.  
`IN-` goes to ground.

### 6.3 Output Connection

After the volume potentiometer, add two connector pins:

```text
OUT+
OUT-
```

`OUT+` is the audio signal output.  
`OUT-` goes to ground.

### 6.4 Potentiometer Connections

If the potentiometers are mounted off-board, replace each potentiometer with three connector pins.

For potentiometer 1:

```text
P1P1
P1P2
P1P3
```

For potentiometer 2:

```text
P2P1
P2P2
P2P3
```

The names mean:

```text
P1P1 = potentiometer 1, pin 1
P1P2 = potentiometer 1, pin 2
P1P3 = potentiometer 1, pin 3
```

The value field of the connector pins can be empty or a whitespace. This keeps the PCB less cluttered.

At this point, every real symbol should have a footprint assigned.

The `GND` symbols do not need footprints. They only define the ground net.

Before moving to the PCB Editor, run the Electrical Rules Checker again.

```text
Inspect → Electrical Rules Checker → Run ERC
```

If there are no serious errors, continue to the PCB Editor :partying_face:.

## 7. Open the PCB Editor

Click the green PCB icon in the top toolbar.

This opens the **PCB Editor**.

Now transfer the schematic into the PCB layout.

Click:

```text
Tools → Update PCB from Schematic
```

or use the toolbar button:

```text
Update PCB from Schematic
```

A window like this appears:

```text
┌──────────────────────────────────────────────────────────────────────────────┐
│                         Update PCB from Schematic                            │
├──────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│  Options                                                                     │
│  ┌────────────────────────────────────────────────────────────────────────┐  │
│  │ ☐ Re-link footprints to schematic symbols based on their reference     │  │
│  │   designators                                                          │  │
│  │ ☐ Group footprints based on symbol group                               │  │
│  └────────────────────────────────────────────────────────────────────────┘  │
│                                                                              │
│  Update Footprints                                                           │
│  ┌────────────────────────────────────────────────────────────────────────┐  │
│  │ ☑ Replace footprints with those specified by symbols                   │  │
│  │ ☐ Delete footprints with no symbols                                    │  │
│  │ ☐ Override locks                                                       │  │
│  └────────────────────────────────────────────────────────────────────────┘  │
│                                                                              │
│  Update Fields                                                               │
│  ┌────────────────────────────────────────────────────────────────────────┐  │
│  │ ☑ Update footprint fields from symbols                                 │  │
│  │ ☐ Remove footprint fields not found in symbols                         │  │
│  └────────────────────────────────────────────────────────────────────────┘  │
│                                                                              │
│  Changes to Be Applied                                                       │
│  ┌────────────────────────────────────────────────────────────────────────┐  │
│  │ Add R1     (footprint 'Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_     │  │
│  │            P10.16mm_Horizontal').                                      │  │
│  │ Add IN-1   (footprint 'Connector_Wire:SolderWire-0.5sqmm_1x01_         │  │
│  │            D0.9mm_OD2.3mm').                                           │  │
│  │ Add R2     (footprint 'Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_     │  │
│  │            P10.16mm_Horizontal').                                      │  │
│  │ Add IN+1   (footprint 'Connector_Wire:SolderWire-0.5sqmm_1x01_         │  │
│  │            D0.9mm_OD2.3mm').                                           │  │
│  │ Add R3     (footprint 'Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_     │  │
│  │            P10.16mm_Horizontal').                                      │  │
│  │ Add C3     (footprint 'Capacitor_THT:C_Radial_D6.3mm_H5.0mm_           │  │
│  │            P2.50mm').                                                  │  │
│  │ Add R4     (footprint 'Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_     │  │
│  │            P10.16mm_Horizontal').                                      │  │
│  │ Add C2     (footprint 'Capacitor_THT:CP_Radial_D6.3mm_P2.50mm').       │  │
│  │ Add Vin-9  (footprint 'Connector_Wire:SolderWire-0.5sqmm_1x01_         │  │
│  │            D0.9mm_OD2.3mm').                                           │  │
│  │ Add C1     (footprint 'Capacitor_THT:CP_Radial_D6.3mm_P2.50mm').       │  │
│  │ Add Vout+9 (footprint 'Connector_Wire:SolderWire-0.5sqmm_1x01_         │  │
│  │            D0.9mm_OD2.3mm').                                           │  │
│  │                                                                        │  │
│  │ Total warnings: 0, errors: 0                                           │  │
│  └────────────────────────────────────────────────────────────────────────┘  │
│                                                                              │
│  Show:  ☑ All    ☑ Errors  0    ☑ Warnings  0    ☑ Actions    ☑ Infos        │
│                                                                              │
│                                                     ┌──────────┐             │
│                                                     │ Save...  │             │
│                                                     └──────────┘             │
│                                                                              │
│                                      ┌────────┐  ┌────────────┐              │
│                                      │ Close  │  │ Update PCB │              │
│                                      └────────┘  └────────────┘              │
└──────────────────────────────────────────────────────────────────────────────┘
```

Click:

`Update PCB`

Then click:

`Close`

All footprints are now attached to your mouse. Click somewhere in the PCB Editor to place them.

At first, everything will look messy. That is normal.

## 8. Hide the Ground Ratsnest

The thin blue lines are called **ratsnest lines** or **airwires**.

They show which pads still need to be connected.

The GND connections can make the layout look very busy. To make placement easier, hide the GND ratsnest temporarily.

Open the panel on the right:

```text
Appearance → Nets
```

Find:

```text
GND
```

Click the eye symbol next to `GND`.

Example:

```text
┌──────────────────────────────┐
│ Appearance                   │
├──────────────────────────────┤
│[ Layers ][ Objects ][ Nets ] │
│                              │
│ Nets                         │
│ ┌──────────────────────────┐ │
│ │ ◼    GND                 │ │
│ │ ☑    Net-(C3-Pad1)       │ │
│ │ ☑    Net-(IN+1-Pin_1)    │ │
│ │ ☑    Net-(OUT+1-Pin_1)   │ │
│ │ ☑    Net-(P1P1-Pin_1)    │ │
│ │ ☑    Net-(P1P2-Pin_1)    │ │
│ │ ☑    Net-(P2P1-Pin_1)    │ │
│ │ ☑    Net-(Q1-B)          │ │
│ │ ☑    Net-(Q1-C)          │ │
│ │ ☑    Net-(Q2-C)          │ │
│ │ ☑    Net-(Vin-9-Pin_1)   │ │
│ └──────────────────────────┘ │
│                              │
│ Net Classes                  │
│ ┌──────────────────────────┐ │
│ │   Default                │ │
│ └──────────────────────────┘ │
│                              │
│ ▸ Net Display Options        │
│                              │
│ Selection Filter             │
│ ┌──────────────────────────┐ │
│ │ ☐ All items   ☐ Locked   │ │
│ │ ☑ Footprints  ☐ Text     │ │
│ │ ☐ Tracks      ☐ Vias     │ │
│ │ ☐ Pads        ☐ Graphics │ │
│ │ ☐ Zones       ☐ RuleAreas│ │
│ │ ☐ Dimensions  ☐ Other    │ │
│ │ ☐ Points                 │ │
│ └──────────────────────────┘ │
└──────────────────────────────┘
```

This only hides the visual guide. It does not disconnect GND.

## 9. Arrange the Footprints

Before routing, arrange the footprints in a clean layout.

In the **Selection Filter**, enable only:

```text
Footprints
```

This prevents you from accidentally moving labels, pads, tracks, or zones.

Good layout rules:

```text
keep related parts close together
keep the signal path short
avoid unnecessary crossing ratsnest lines
leave enough space for soldering
keep input and output pads easy to reach
keep potentiometer pads clearly labeled
keep battery pads clearly labeled
```

The PCB layout does not need to look like the schematic.

The schematic shows the circuit logic.  
The PCB layout should make the real board easy to build and route.

## 10. Route the Tracks

Tracks are the copper connections on the PCB.

To route a track, press:

`X`

or choose:

`Route Single Track`

from the right toolbar.

Click one pad and follow the blue ratsnest line to the pad it should connect to.

Try to use:

```text
short tracks
clean routes
straight lines
45 degree angles
no unnecessary loops
```

For this small fuzz circuit, one copper layer is enough.  
Using two layers is also fine, especially if you want routing to be easier.

## 11. Track Width

The Fuzz Face uses very small currents, so the tracks do not need to be wide for electrical reasons.

For a beginner-friendly, hand-solderable board, use:

```text
0.5 mm
```

To change routed tracks:

1. Disable `Footprints` in the Selection Filter.
2. Enable `Tracks`.
3. Select the tracks.
4. Press `E`.
5. Change **Track width** to `0.5 mm`.

```text
┌──────────────────────────────────────────────────────────────────────────────┐
│                          Track & Via Properties                              │
├──────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│  Common                                                                      │
│  ┌────────────────────────────────────────────────────────────────────────┐  │
│  │ Net: [ -- mixed values --                                      ▾ ]     │  │
│  │                                                                        │  │
│  │ ☐ Locked                                                               │  │
│  └────────────────────────────────────────────────────────────────────────┘  │
│                                                                              │
│  Tracks                                                                      │
│  ┌────────────────────────────────────────────────────────────────────────┐  │
│  │ Start X: [ -- mixed values -- ]   Y: [ -- mixed values -- ] mm         │  │
│  │ End X:   [ -- mixed values -- ]   Y: [ -- mixed values -- ] mm         │  │
│  │                                                                        │  │
│  │ Layer:   [ ■ F.Cu                                             ▾ ]      │  │
│  │                                                                        │  │
│  │ Technical Layers                                                       │  │
│  │ ☐ Solder mask   Expansion: [ -- mixed values -- ] mm                   │  │
│  │                                                                        │  │
│  │ Pre-defined sizes: [                                      ▾ ] mm       │  │
│  │                                                                        │  │
│  │ Track width:       [ 0.5                              ] mm             │  │
│  └────────────────────────────────────────────────────────────────────────┘  │
│                                                                              │
│                                                   ┌────────┐ ┌────────┐      │
│                                                   │ Cancel │ │   OK   │      │
│                                                   └────────┘ └────────┘      │
└──────────────────────────────────────────────────────────────────────────────┘
```

Click:

`OK`

Now the selected tracks are thicker.

## 12. Add a Ground Zone

A ground zone fills an area of the PCB with copper connected to GND.

This is easier than routing every GND connection manually.

To add a GND zone:

1. Select the **Draw Filled Zones** tool.
2. Click somewhere near the board.
3. In the zone settings, choose:

```text
Layer: F.Cu
Net:   GND
```

Example:

```text
┌──────────────────────────────────────────────────────────────────────────────┐
│                           Copper Zone Properties                             │
├──────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│  Layers:                                                                     │
│  ┌──────────────┐                                                            │
│  │ ☑  ■ F.Cu    │   Zone name:  [                                      ]     │
│  │ ☐  ■ B.Cu    │                                                            │
│  └──────────────┘   Net name:   [ GND                                  ▾ ]   │
│                                                                              │
│                    ☐ Locked                                                  │
│                                                                              │
│  ┌──────────────────────┬───────────────────┬────────────────────────────┐   │
│  │ Clearances & Pad Conn│ Display Overrides │ Hatched Fill               │   │
│  └──────────────────────┴───────────────────┴────────────────────────────┘   │
│                                                                              │
│  ☐ Hatched fill                                                              │
│                                                                              │
│  Corner smoothing:  [ None                                           ▾ ]     │
│                                                                              │
│  Remove islands:    [ Always                                         ▾ ]     │
│                                                                              │
│                                                   ┌────────┐ ┌────────┐      │
│                                                   │ Cancel │ │   OK   │      │
│                                                   └────────┘ └────────┘      │
└──────────────────────────────────────────────────────────────────────────────┘
```

Click:

`OK`

Now draw the ground zone around the circuit.

Try to make a clean rectangle or polygon that covers the whole board area.

When finished, press:

`B`

This fills all copper zones.

The GND pads should now connect to the ground zone automatically.  
Non-GND tracks and pads will be avoided automatically.

If the zone does not fill correctly, check:

```text
the zone net is GND
the zone is on F.Cu
the board outline is valid
the GND pads are really connected to GND
```

## 13. Draw the PCB Outline

The PCB outline must be drawn on the `Edge.Cuts` layer.

In the right Appearance panel, select:

```text
Layers → Edge.Cuts
```

Example:

```text
┌──────────────────────────────┐
│ Appearance                   │
├──────────────────────────────┤
│[ Layers ][ Objects ][ Nets ] │
│                              │
│  ■     F.Cu                  │
│  ■     B.Cu                  │
│  ■     F.Adhesive            │
│  ■     B.Adhesive            │
│  ■     F.Paste               │
│  ■     B.Paste               │
│  ■     F.Silkscreen          │
│  ■     B.Silkscreen          │
│  ■     F.Mask                │
│  ■     B.Mask                │
│  ■     User.Drawings         │
│  ■     User.Comments         │
│  ■     User.Eco1             │
│  ■     User.Eco2             │
│  ▸ ■     Edge.Cuts           │
│  ■     Margin                │
│  ■     F.Courtyard           │
│  ■     B.Courtyard           │
│  ■     F.Fab                 │
│  ■     B.Fab                 │
│  ■     User.1                │
│  ■     User.2                │
│  ■     User.3                │
│  ■     User.4                │
└──────────────────────────────┘
```

The small blue arrow means `Edge.Cuts` is the active layer.

Now choose a drawing tool:

```text
Place → Graphic Line
```

or use the line tool on the right toolbar.

Draw a closed outline around the PCB.

A simple rectangular PCB outline is fine:

```text
┌──────────────────────────────┐
│                              │
│          your circuit        │
│                              │
└──────────────────────────────┘
```

:warning: Important:

The outline must be closed.

If there is even a tiny gap, KiCad will show an error such as:

```text
Board has malformed outline
```

A bad corner:

```text
──────
      │
      │
```

A good corner:

```text
──────┐
      │
      │
```



## 14. Run the Design Rules Checker

Before exporting, run the Design Rules Checker.

Open:

```text
Inspect → Design Rules Checker
```

Click:

`Run DRC`

Fix serious errors before manufacturing.

Especially check for:

```text
unconnected items
malformed board outline
tracks too close together
pads too close together
copper zone problems
silkscreen text on pads
missing drill holes
```

If there are no serious errors, close the DRC window.

## 15. Export Gerber Files

Gerber files are the files that PCB manufacturers use to produce the board.

Open:

```text
File → Fabrication Outputs → Gerbers (.gbr)
```

A window like this opens:

```text
┌──────────────────────────────────────────────────────────────────────────────────────────────┐
│                                             Plot                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────┤
│                                                                                              │
│  Plot format:       [ Gerber                                      ▾ ]                        │
│                                                               Design variant: [ <Default> ▾ ]│
│                                                                                              │
│  Output directory:  [                                                        ]  [ ] [↗]     │
│                                                                                              │
│  Include Layers                         Plot on All Layers                                   │
│  ┌──────────────────────┐               ┌──────────────────────┐                             │
│  │ ☑  F.Cu              │               │ ☐  B.Cu              │                             │
│  │ ☑  B.Cu              │               │ ☐  B.Mask            │                             │
│  │ ☐  F.Adhesive        │               │ ☐  B.Paste           │                             │
│  │ ☐  B.Adhesive        │               │ ☐  B.Silkscreen      │                             │
│  │ ☑  F.Paste           │               │ ☐  B.Adhesive        │                             │
│  │ ☑  B.Paste           │               │ ☐  B.Courtyard       │                             │
│  │ ☑  F.Silkscreen      │               │ ☐  B.Fab             │                             │
│  │ ☑  B.Silkscreen      │               │ ☐  F.Cu              │                             │
│  │ ☑  F.Mask            │               │ ☐  F.Mask            │                             │
│  │ ☑  B.Mask            │               │ ☐  F.Paste           │                             │
│  │ ☐  User.Drawings     │               │ ☐  F.Silkscreen      │                             │
│  │ ☐  User.Comments     │               │ ☐  F.Adhesive        │                             │
│  │ ☐  User.Eco1         │               │ ☐  F.Courtyard       │                             │
│  │ ☐  User.Eco2         │               │ ☐  F.Fab             │                             │
│  │ ☑  Edge.Cuts         │               └──────────────────────┘                             │
│  │ ☐  Margin            │                  [ ↑ ] [ ↓ ]                                       │
│  └──────────────────────┘                                                                    │
│                                                                                              │
│  General Options                                      Drill marks: [ None             ▾ ]    │
│  ┌──────────────────────────────────────────────┐     Scaling:     [ 1:1              ▾ ]    │
│  │ ☐ Plot drawing sheet                         │                                            │
│  │ ☐ Subtract soldermask from silkscreen         │     ☐ Use drill/place file origin         │
│  │ ☑ Indicate DNP on fabrication layers          │     ☐ Mirrored plot                       │
│  │   ○ Hide                                      │     ☐ Negative plot                       │
│  │   ● Cross-out                                 │                                           │
│  │ ☐ Sketch pads on fabrication layers           │     ☑ Check zone fills before plotting    │
│  │   ☐ Include pad numbers                       │                                           │
│  └──────────────────────────────────────────────┘                                            │
│                                                                                              │
│  Gerber Options                                                                              │
│  ┌──────────────────────────────────────────────────────────────────────────────────────┐    │
│  │ ☐ Use Protel filename extensions          Coordinate format: [ 4.6, unit mm     ▾ ]  │    │
│  │ ☑ Generate Gerber job file                ☑ Use extended X2 format (recommended)     │    │
│  │                                           ☑ Include netlist attributes               │    │
│  │                                           ☐ Disable aperture macros (not recommended)│    │
│  └──────────────────────────────────────────────────────────────────────────────────────┘    │
│                                                                                              │
│  Output Messages                                                                             │
│  ┌──────────────────────────────────────────────────────────────────────────────────────┐    │
│  │                                                                                      │    │
│  │                                                                                      │    │
│  └──────────────────────────────────────────────────────────────────────────────────────┘    │
│                                                                                              │
│  Show: ☑ All    ☑ Errors 0    ☑ Warnings 0    ☑ Actions    ☑ Infos                           │
│                                                                                              │
│  ┌──────────┐                                                        ┌────────┐ ┌──────────┐ │
│  │ Run DRC… │                                                        │ Close  │ │  Plot    │ │
│  └──────────┘                                                        └────────┘ └──────────┘ │
│                                                   ┌──────────────────────────┐               │
│                                                   │ Generate Drill Files...  │               │
│                                                   └──────────────────────────┘               │
└──────────────────────────────────────────────────────────────────────────────────────────────┘
```

Choose an output directory, for example:

```text
Gerber/
```

For a normal two-layer PCB, include:

```text
F.Cu
B.Cu
F.Mask
B.Mask
F.Silkscreen
B.Silkscreen
Edge.Cuts
```

Then click:

`Plot`

This creates the Gerber files.

## 16. Generate Drill Files

Gerber files alone are not enough.  
The manufacturer also needs drill files for the holes.

In the same window, click:

`Generate Drill Files...`

Use typical settings:

```text
Drill units: mm
Drill map file format: Gerber
```

Then click:

`Generate Drill File`

Now the drill files are created.

## 17. Check the Gerbers

Before uploading the PCB to a manufacturer, inspect the generated files.

Open:

```text
KiCad → Gerber Viewer
```

Load the Gerber files and the drill file.

Check:

```text
board outline is correct
holes are visible
pads are present
tracks are connected
solder mask openings look correct
silkscreen text is readable
no text is outside the board
no important silkscreen is on solder pads
GND zone is filled
AC128 transistor orientation is marked clearly
input, output, power, and potentiometer pads are labeled
```

This step is very important.

It is much easier to fix the board now than after ordering the PCB.

## 18. Upload to a PCB Manufacturer

Put all generated manufacturing files into a `.zip` file.

The ZIP usually contains files like:

```text
F_Cu.gbr
B_Cu.gbr
F_Mask.gbr
B_Mask.gbr
F_Silkscreen.gbr
B_Silkscreen.gbr
Edge_Cuts.gbr
.drl
.gbrjob
```

Upload the ZIP file to a PCB manufacturer.

Most manufacturers automatically check the files and show a preview before ordering.

If the preview looks wrong, stop and fix the PCB before ordering.

Some manufacturers also offer a paid manual engineering check. This can catch some manufacturing problems, but it does not guarantee that the circuit itself is logically correct.

## 19. :warning: Final Checklist Before Ordering

Before ordering, double-check:

```text
☐ ERC passes in the Schematic Editor
☐ DRC passes in the PCB Editor
☐ board outline is closed on Edge.Cuts
☐ all non-GND ratsnest lines are routed
☐ GND zone is filled
☐ track width is reasonable, for example 0.5 mm
☐ capacitor polarity is correct
☐ AC128 transistor pinout is correct: 1=E, 2=B, 3=C
☐ input pads are clearly labeled
☐ output pads are clearly labeled
☐ battery pads are clearly labeled
☐ potentiometer pads are clearly labeled
☐ silkscreen text is not placed on solder pads
☐ Gerbers were checked in Gerber Viewer
☐ drill file is included in the ZIP
```

## 20. :bulb: What We Learned

In this part we turned the Fuzz Face schematic into a PCB layout.

The important idea is:

```text
Schematic symbols describe electrical meaning.

Footprints describe physical reality.

PCB tracks create the copper connections.

Ground zones make common ground connections easier.

Gerbers are the files used for manufacturing.
```

At the end of this step, the PCB is ready to be sent to a manufacturer.

## Outline

### PCB Editor Reference

```text
Schematic Editor
      │
      │ assign footprints
      ▼
PCB Editor
      │
      │ update PCB from schematic
      ▼
Arrange footprints
      │
      │ route tracks
      ▼
Add GND zone
      │
      │ draw Edge.Cuts outline
      ▼
Run DRC
      │
      │ export Gerbers + drill files
      ▼
Upload to PCB manufacturer
```

### Keyboard Shortcut

```text
+----------------------+--------------------------------+
| Shortcut             | Action                         |
+----------------------+--------------------------------+
| E                    | Edit properties                |
| M                    | Move item                      |
| G                    | Drag item                      |
| R                    | Rotate item                    |
| X                    | Route single track             |
| B                    | Refill copper zones            |
| Ctrl + Z             | Undo                           |
| Ctrl + S             | Save                           |
| Delete               | Delete selected item           |
| Esc                  | Cancel current tool/action     |
+----------------------+--------------------------------+
```

### Resources

1. https://docs.kicad.org/
2. https://www.kicad.org/help/learning-resources/
3. https://www.electrosmash.com/fuzz-face