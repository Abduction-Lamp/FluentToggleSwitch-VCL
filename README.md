<img src="resources/assets/toggle-left-18.png" width="72" alt="">

# TFluentToggleSwitch

A VCL toggle switch for Delphi that looks and behaves like the one in Windows 11,
drawn entirely by the component rather than by the system.

![Demo](docs/images/demo-screenshot-001.png)

## Why

The VCL has no toggle switch of its own that looks current, and the third-party
ones either show their age or bring dependencies with them. This one:

- follows the WinUI 3 design: a pill-shaped track, a thumb that grows under the
  pointer and stretches when pressed, and the timings of the WinUI template;
- takes the accent colour from Windows and follows it while the program runs;
- looks the same on Windows 7, 8, 10 and 11, because it asks the system for
  almost nothing and has an answer ready when the answer is missing;
- brings nothing with it but the RTL, the VCL and GDI+;
- installs into the palette like any other component.

## What it does

- Mouse, keyboard and touch. Click it, drag the thumb across the track, or
  press the space bar.
- An optional caption beside the switch, on either side, naming its two values.
  Clicking the caption counts as clicking the switch.
- An optional header above or below it, with a font of its own, describing the
  switch the way a label describes an edit box. The header is not a target for
  the pointer.
- A focus ring that follows the Windows convention: hidden until someone
  reaches for the keyboard, shown from then on.
- Colours you can override one by one, or leave to the theme.
- Correct on a high-DPI display, and correct again after a form moves between
  monitors of different scale.
- Anti-aliased, flicker-free, and costing nothing at all while nothing moves.

Full reference: [docs/API.md](docs/API.md).

## Requirements

Delphi 12.1 Athens, or a version close enough to compile it. The runtime
package builds for Win32 and Win64; the design-time package, like every
design-time package, is Win32.

## Installing

1. Clone the repository and open `FluentToggleSwitch.groupproj`.
2. Build **FluentToggleSwitchR**, the runtime package.
3. Build **FluentToggleSwitchD**, the design-time package, and install it.

`TFluentToggleSwitch` appears on the **Fluent** page of the palette.

Changing the component afterwards means building both packages again and
restarting the IDE: the design-time package has the runtime one as a
dependency, and a loaded package cannot be swapped underneath the IDE.

To use the source without installing anything, put `source` on the search path
of your project and add `Fluent.ToggleSwitch` to a uses clause.

## Using it

From the designer, drop it on a form and set what you need in the object
inspector. The designer is given the baseline of the caption, so the switch
lines up with the captions of the labels, edits and buttons around it.

From code:

```pascal
uses
  Fluent.ToggleSwitch;

var
  Toggle: TFluentToggleSwitch;
begin
  Toggle := TFluentToggleSwitch.Create(Self);
  Toggle.Parent := Self;
  Toggle.Left := 20;
  Toggle.Top := 20;
  Toggle.ShowText := True;
  Toggle.TextOn := 'Enabled';
  Toggle.TextOff := 'Disabled';
  Toggle.OnChange := HandleChange;
end;
```

`OnChange` reports the value and does not care who moved it, so it fires for an
assignment in code as well as for the user. `OnClick` reports the action: it
fires only when the user toggles the switch, and after the value has already
moved, so a handler reads what the user just asked for.

```pascal
procedure TForm1.HandleChange(Sender: TObject);
begin
  Lamp.Visible := TFluentToggleSwitch(Sender).Checked;
end;
```

### Colours

Every colour property starts at `clDefault`, which leaves it to the theme. The
theme carries a separate, partly translucent colour for each interaction state
and takes the on track from the Windows accent, so a single `TColor` cannot
stand in for it: assigning one paints that colour in every state.

```pascal
Toggle.TrackColorOn := clGreen;
Toggle.ThumbColorOn := clWhite;
```

### A header

```pascal
Toggle.HeaderText := 'Notifications';
Toggle.ShowHeader := True;
```

The control grows to make room, and moves itself so that the switch stays
where you put it.

## Project structure

```
source/     the component, and a design-time unit with the palette registration
packages/   the runtime package and the design-time one
resources/  the palette icon and the artwork it came from
demo/       a form showing twelve switches side by side
tests/      ninety DUnitX tests, with a memory leak monitor of their own
docs/       the API reference and screenshots
```

## Documentation

- [API reference](docs/API.md) — every property, method and event, and the
  behaviour behind them.
- [Changelog](CHANGELOG.md).

## Licence

MIT. See [LICENSE](LICENSE).
