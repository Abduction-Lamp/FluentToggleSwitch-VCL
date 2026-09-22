# TFluentToggleSwitch — API reference

Version 3.0.0. Unit `Fluent.ToggleSwitch`, palette page **Fluent**.

```
TComponent → TControl → TWinControl → TCustomControl →
TCustomFluentToggleSwitch → TFluentToggleSwitch
```

`TCustomFluentToggleSwitch` carries the implementation and publishes nothing;
`TFluentToggleSwitch` publishes the properties described here. A component
descending from the custom class chooses for itself what to publish and what to
leave out.

The switch draws itself with GDI+ and depends on nothing but the RTL, the VCL
and GDI+. It works the same on Windows 7, 8, 10 and 11, because it asks the
system for nothing but the accent colour and the animation setting, and has a
sensible answer ready when either is unavailable.

---

## Contents

- [Types](#types)
- [State and behaviour](#state-and-behaviour)
- [Colours](#colours)
- [Caption](#caption)
- [Header](#header)
- [Standard properties](#standard-properties)
- [Methods](#methods)
- [Events](#events)
- [What answers the pointer](#what-answers-the-pointer)
- [Keyboard and focus](#keyboard-and-focus)
- [Right to left](#right-to-left)
- [Size and scaling](#size-and-scaling)
- [Animation](#animation)
- [Streaming](#streaming)
- [Design time](#design-time)
- [Deliberate departures from WinUI](#deliberate-departures-from-winui)
- [Not implemented](#not-implemented)

---

## Types

| Type | Values | Used by |
|------|--------|---------|
| `TFluentTextPosition` | `tpLeft`, `tpRight` | `TextPosition` |
| `TFluentHeaderPosition` | `hpTop`, `hpBottom` | `HeaderPosition` |

Two further declarations, `TFluentInteractionState` and `TFluentVisualState`,
appear in the interface section of the unit. They describe how the switch
animates between its own visual states and are not part of the contract; no
public or published member mentions them, and they may change without notice.

---

## State and behaviour

### `Checked: Boolean`

Default `False`. The value of the switch.

Assigning it raises `OnChange`, whether the assignment came from your code or
from the user. It does not raise `OnClick`, which reports an action rather
than a value. Reading a DFM raises neither.

Assigning it while the switch is on screen starts the transition described
under [Animation](#animation).

### `Animated: Boolean`

Default `True`. Whether the thumb travels or arrives at once.

The switch also animates nothing while it is not showing, and nothing while
interface animation is turned off in Windows, whatever this property says.

### `AnimationDuration: Integer`

Default `367`, in milliseconds. How long the thumb takes to cross the track,
after the delay described under [Animation](#animation). Values below one are
raised to one.

The property governs the thumb alone. The cross-fade between the two states
keeps its own timing.

### `Enabled: Boolean`

Inherited, default `True`. A disabled switch ignores the pointer and the
keyboard, paints itself in paler colours and greys its caption and header.

Disabling it in the middle of a gesture drops that gesture: the thumb returns
to the value the switch held, and neither event is raised.

### `ReadOnly: Boolean`

Default `False`. Whether the switch shows a value the user may not change.

A read-only switch answers neither the pointer nor the space bar, and its thumb
cannot be dragged. `Checked` set from code works as always and still raises
`OnChange`.

This is not `Enabled := False`. The switch keeps its normal colours, stays in
the tab order and still takes the focus when clicked — it is a value on display,
not a control out of service. Since nothing the user does reaches it, there is
no hover highlight and no pressed state, and `OnClick`, which reports a switch
that changed, does not fire.

Turning it on in the middle of a gesture drops that gesture, the same way
`Enabled := False` does.

### `KeyboardToggle: Boolean`

Default `True`. Whether the space bar toggles the switch.

Turning it off leaves the switch in the tab order and still able to hold the
focus. To take it out of the tab order, use `TabStop`.

### `ShowFocus: Boolean`

Default `True`. Whether the switch is allowed to draw a focus ring.

Allowed is not the same as always. See [Keyboard and focus](#keyboard-and-focus).

---

## Colours

Five properties, each defaulting to `clDefault`, which means the built-in
scheme. The scheme follows the WinUI 3 light dictionary: it carries a
different, partly translucent colour for every interaction state, and the on
track follows the accent colour configured in Windows. A single `TColor`
cannot stand in for that, so assigning one paints that same colour in every
state.

| Property | Paints |
|----------|--------|
| `TrackColorOff` | The fill of the track when the switch is off |
| `TrackColorOn` | The fill of the track when the switch is on |
| `TrackFrameColor` | The outline of the track |
| `ThumbColorOff` | The thumb when the switch is off |
| `ThumbColorOn` | The thumb when the switch is on |

The accent colour is read from the Windows palette, from the shade WinUI calls
`SystemAccentColorDark1`. When the palette cannot be read, as on Windows 7 and
8, the switch uses `#0067C0`, the Windows 11 default. It reads the palette
again whenever Windows announces a change, so a switch already on screen
follows the accent while the program runs.

### `Color` and `ParentColor`

`ParentColor` is `True` by default, so the switch takes the background of
whatever it sits on. The switch fills its own rectangle with that colour: it
declares itself opaque, and nothing else erases behind it.

---

## Caption

The caption is the word beside the switch that names its two values. It is
part of the switch, not a separate control, and clicking it toggles the switch.

### `ShowText: Boolean`

Default `False`. Whether the caption is drawn at all.

### `TextOn: string`, `TextOff: string`

Default `'On'` and `'Off'`. The words for the two values.

Both are written to a DFM only when they differ from those defaults. A
descendant form therefore cannot reset either to the default by assigning it,
which is the same limitation `Vcl.WinXCtrls.TToggleSwitch` has.

An ampersand in either is drawn as one: only the header carries an
accelerator.

### `TextPosition: TFluentTextPosition`

Default `tpRight`. Which side of the track the caption goes, the way the text
runs: on a right-to-left form `tpRight` puts it to the left of the track. See
[Right to left](#right-to-left).

### `TextSpacing: Integer`

Default `12`, in design pixels, scaled with the display. The gap between the
outline of the track and the caption. Negative values are raised to zero.

### `Font`

Inherited. The caption is drawn in it. The switch measures the wider of the
two captions and sizes itself to that, so that toggling never changes its
width.

---

## Header

The header is a line of text that describes the switch, the way a label
describes an edit box. It is not a target for the pointer.

### `ShowHeader: Boolean`

Default `False`.

### `HeaderText: string`

A switch that has never been given a header carries its own `Name`, so turning
the header on shows something at once.

An ampersand marks the accelerator: `&Sound` underlines the S and makes Alt+S
work the switch. Two of them, `Sound && vibration`, draw one. The underline
stays hidden until Alt is pressed, the convention Windows sets for the whole
window. See [Keyboard and focus](#keyboard-and-focus).

### `HeaderPosition: TFluentHeaderPosition`

Default `hpTop`. Above the switch or below it.

### `HeaderAlignment: TAlignment`

Default `taCenter`. Where the header sits over the switch and its caption:
left, centred or right. When the header is the wider of the two, it is the
switch that moves under the header instead: aligned left, the switch sits at
the left edge; centred, in the middle. On a right-to-left form left and right
swap, as they do for a `TLabel`.

### `HeaderSpacing: Integer`

Default `6`, in design pixels, scaled with the display. The gap between the
header and the row holding the switch. Negative values are raised to zero.

### `HeaderFont: TFont`

Follows `Font` until you assign to it, and from then on stands on its own,
including through a change of scale. It is written to a DFM whenever
`ParentHeaderFont` is `False` — which is what assigning to it brings about.

### `ParentHeaderFont: Boolean`

Default `True`. Whether the header is written in the control's own `Font`.

Assigning to `HeaderFont` turns it off, the way assigning to `Font` turns off
`ParentFont`. Putting it back to `True` returns the header to `Font` at once —
the font it had is not kept — and the header follows `Font` again from then on.
While it is `True`, `HeaderFont` stays out of the DFM.

The name follows `ParentFont`, `ParentColor` and the rest of the VCL, but the
parent here is the switch itself, not the parent control: the header is part of
the switch, and the font it falls back on is the switch's own.

---

## Standard properties

Republished from the VCL and behaving as they do everywhere else:

`Align`, `AlignWithMargins`, `Anchors`, `AutoSize`, `BiDiMode`, `Constraints`,
`Cursor`, `DoubleBuffered`, `Hint`, `Margins`, `ParentBiDiMode`,
`ParentDoubleBuffered`, `ParentFont`, `ParentShowHint`, `PopupMenu`,
`ShowHint`, `TabOrder`, `TabStop`, `Visible`.

`AutoSize`, `TabStop` and `DoubleBuffered` default to `True`, which differs
from the VCL defaults they replace.

`BiDiMode` mirrors the switch; see [Right to left](#right-to-left).

---

## Methods

### `function TextTop: Integer`

Where the switch paints the top of its caption, in client coordinates. It
takes the header into account.

It exists for the form designer, which turns it into a baseline with an ascent
of its own reckoning. It is public rather than protected so that the
design-time unit can reach it without the component unit depending on anything
design-time.

---

## Events

### `OnChange: TNotifyEvent`

Raised whenever `Checked` changes, by whatever means, except while a DFM is
being read. This is what `Toggled` means in WinUI and what `OnClick` means on
a `TCheckBox`.

### `OnClick: TNotifyEvent`

Raised when the user toggles the switch, and only then, and after the value
has already moved. A handler therefore reads the value the user just asked
for. Assigning `Checked` in code does not raise it.

The user can toggle the switch by clicking it, by dragging the thumb past the
middle, with the space bar, or with the accelerator in the header. All four
raise it.

### `OnDblClick: TNotifyEvent`

Raised on a double click. The second half of the click also toggles the
switch, as it does on a check box.

### Other events

`OnContextPopup`, `OnEnter`, `OnExit`, `OnKeyDown`, `OnKeyPress`, `OnKeyUp`,
`OnMouseDown`, `OnMouseEnter`, `OnMouseLeave`, `OnMouseMove`, `OnMouseUp`,
`OnMouseWheel`, `OnResize`. All inherited and behaving as they do elsewhere.

`OnMouseEnter` and `OnMouseLeave` speak for the whole control, header
included. The switch's own idea of being hovered is narrower; see below.

---

## What answers the pointer

The switch and its caption are the target. The header is not, and neither is
any space beside them that a wider control leaves over, whether under a wide
header or with `AutoSize` off.

This is the line WinUI draws as well: its hit-testable area spans the switch
and the captions and stops short of the header.

The same area decides what counts as hovered, so the pointer resting on the
header leaves the switch as it was.

### Dragging

Pressing anywhere on the switch or its caption and moving the pointer sideways
drags the thumb along the track. Released past the middle it changes the
value; released short of it, it returns. The thumb cannot be dragged beyond
either end.

A press becomes a drag once the pointer has travelled four design pixels, so
that a click with an unsteady hand is still a click.

### Gestures the switch does not finish

A gesture is dropped, with the thumb returning and neither event raised, when
Windows takes it back. That covers a menu or a modal dialog opening, the
switch being disabled mid-gesture, and another window taking the mouse
capture.

---

## Keyboard and focus

The space bar toggles the switch when the key comes back up, so holding it
down does not fire over and over, and a key released elsewhere never reaches
the switch. It has to be the space bar alone: held with Shift, Ctrl or Alt it
is left for whatever else wants it. Enter does nothing, as in WinUI.

Clicking the switch gives it the focus, unless `TabStop` is off. It has to be
the left button, on the switch or its caption: a click on the header leaves the
focus where it was.

Alt plus the letter marked in `HeaderText` gives the switch the focus and
toggles it, the way an accelerator works a check box. Both halves follow the
rules a click follows: the value changes only where the keyboard may change it,
so `KeyboardToggle` off or `ReadOnly` on leaves the switch as it was, and the
focus is taken only where a click would take it, so `TabStop` off means the
switch toggles without it. A header that is not shown marks nothing, whatever
`HeaderText` holds.

The focus ring follows the convention Windows sets: it stays hidden until
someone navigates by keyboard, and the window says which of the two it is. A
switch reached by the mouse therefore holds the focus without showing a ring,
and the ring appears the moment the user reaches for Tab. `ShowFocus` decides
whether the switch takes part in that at all.

The ring is drawn around the switch and its caption, leaving the header out.

---

## Right to left

`BiDiMode` at `bdRightToLeft` mirrors the switch. The rule is the one the rest
of the VCL follows: the mirroring takes a system set up for a right-to-left
language (`SysLocale.MiddleEast`), and elsewhere `bdRightToLeft` changes
nothing, for the switch as for every other control. The other two modes,
`bdRightToLeftNoAlign` and `bdRightToLeftReadingOnly`, change the reading
order of the caption and the header and leave the layout alone.

Mirrored, the switch does what WinUI, Android and iOS do with theirs:

- the thumb rests at the right end while off and travels left to turn on, and
  a drag follows it the same way;
- `TextPosition` is read the way the text runs, as `TCheckBox` reads
  `Alignment`: the default `tpRight` puts the caption to the left of the track;
- `HeaderAlignment` is read the same way, as `TLabel` reads `Alignment`:
  `taLeftJustify` puts the header, and the switch under it, against the right
  edge. A control wider than its switch and caption keeps them against the
  right edge without a header too;
- the caption and the header are drawn in right-to-left reading order, so a
  full stop ends a Latin line at its left end.

Changing `BiDiMode` neither moves the control nor changes its size; the switch
crosses to the other end inside it, and a gesture under way is dropped. The
space bar, the focus ring and the baseline given to the designer are the same
either way.

---

## Size and scaling

With `AutoSize` on, which is the default, the switch sizes itself:

| | At 96 dpi |
|---|---|
| Track | 40 × 20 |
| The area the switch occupies | 42 × 22 |
| With a caption | plus `TextSpacing` less one, plus the wider caption; at least as tall as the caption's line |
| With a header | plus the header's line height and `HeaderSpacing`; at least as wide as the header |

Everything scales with the display, from `CurrentPPI`, and with the form: a
`ScaleBy` on it scales the switch's geometry too. The switch works its
geometry out from the design numbers at every scale rather than rescaling
rounded values, so moving a form between monitors of different scale and back
leaves it exactly where it started.

Turning the header on grows the control. With `AutoSize` on and `Align` at
`alNone`, the switch then moves itself so that the track stays where it was
and the room comes out of the form instead. A form that already recorded a
position keeps it: this only happens when the change comes from one of the
text or header properties being set, not from loading, scaling or a new
window. A change of `Font` or `HeaderFont` is the exception: the header grows
in place, and the track moves down with it.

---

## Animation

Timings come from the WinUI template.

| | |
|---|---|
| Thumb, delay before it moves | 33 ms |
| Thumb, travel | `AnimationDuration`, 367 ms by default, on a cubic Bezier |
| Cross-fade between off and on | 83 ms, linear |
| Change of interaction state | 83 ms |
| Change into disabled | 250 ms |

The thumb also grows on hover, from 12 pixels to 14, and stretches into a
17 × 14 pill while pressed, hugging the edge of the track.

The switch animates only while it is showing, only while `Animated` is on, and
only while Windows is set to show interface animation. Otherwise every change
arrives at once.

The frames are driven by a timer on the window of the switch itself, at
16 ms, started when something begins to move and stopped when everything has
arrived. A switch at rest costs nothing.

---

## Streaming

Every published property makes the round trip through a DFM. Properties left
at their defaults are not written, with one exception: `DoubleBuffered` is
set in the constructor, which clears `ParentDoubleBuffered`, and both go into
every DFM.

Loading does not raise `OnChange`, and does not move the control: the form
already recorded where the switch ended up, header and all. The switch
measures itself once when loading finishes rather than on every property that
arrives.

---

## Design time

The component registers itself on the **Fluent** palette page, from the
design-time unit `Fluent.ToggleSwitch.Design`. The component unit itself has
no design-time dependencies.

The designer is given the baseline of the caption, so the switch can be lined
up with the captions of the labels, edits and buttons around it. The baseline
is published whether or not the caption is shown, the way a check box
publishes one without a caption, so a bare switch lines up with the text
beside it too. A vertical centre guide is not possible, the designer having no
guide type for it. The guidelines are registered for
`TCustomFluentToggleSwitch`, so a component descending from it keeps the
baseline.

---

## Deliberate departures from WinUI

Four, each weighed and chosen:

**The colour follows the thumb while it is dragged.** WinUI holds the colour
of the state the gesture started from and changes it only once the gesture
ends. Following the thumb reads better under the finger.

**Both directions cross-fade.** WinUI fades from off to on and snaps back from
on to off. The switch fades both ways; the difference is 83 ms and hardly
visible, and the symmetry is easier to reason about.

**The header sits closer.** WinUI leaves 14 pixels between the header and the
switch. The default here is 6, which suits a dense form better. `HeaderSpacing`
sets it.

**The switch is 42 × 22, not 40 × 40.** WinUI reserves ten pixels above and
below the track. A windowed control cannot paint outside itself, and reserving
that room would make every row of switches taller than it needs to be. The
switch keeps one pixel around the track, which is what the focus ring needs,
and `Margins` gives more where more is wanted.

---

## Not implemented

Each of these has an issue of its own.

| | Issue |
|---|---|
| Dark surfaces, VCL styles, and letting the parent paint the background | [#10](https://github.com/Abduction-Lamp/FluentToggleSwitch-VCL/issues/10) |
| `TAction` through an action link | [#11](https://github.com/Abduction-Lamp/FluentToggleSwitch-VCL/issues/11) |
| Accessibility: the switch reports neither role nor state to a screen reader | [#13](https://github.com/Abduction-Lamp/FluentToggleSwitch-VCL/issues/13) |
| A header outside the control's own window, as `TLabeledEdit` has | [#14](https://github.com/Abduction-Lamp/FluentToggleSwitch-VCL/issues/14) |
