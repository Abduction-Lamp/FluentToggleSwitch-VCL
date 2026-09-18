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

Delphi 13 Florence. The project files are saved in its format, and an older
IDE will not open them.

On 12.1 Athens, open `packages\FluentToggleSwitchR.dpk` and
`packages\FluentToggleSwitchD.dpk` instead: a `.dpk` carries its own unit list
and dependencies, and the IDE builds a project around it. That route is not
tested here — if something breaks on Athens, open an issue.

The runtime package builds for Win32 and Win64; the design-time package, like
every design-time package, is Win32.

## Installing

1. Unpack a release where it can stay: the path ends up in your IDE settings.
   Keeping the version in it, say `FluentToggleSwitch-VCL\2.1.0`, turns the
   next upgrade into a one-line edit.
2. Put its `source` directory on the library path, under **Tools | Options |
   Language | Delphi | Library**, once for every platform you build for.
3. Open `FluentToggleSwitch.groupproj`, build **FluentToggleSwitchR**, the
   runtime package, then build **FluentToggleSwitchD**, the design-time one,
   and install it.

`TFluentToggleSwitch` appears on the **Fluent** page of the palette.

Step 2 is what makes the unit visible to your projects. The packages keep
their `.dcu` beside themselves and put nothing in a directory the compiler
already searches, so your project compiles the component from source, under
its own compiler settings, instead of linking `.dcu` built with the package's.

Changing the component afterwards means building both packages again and
restarting the IDE: the design-time package has the runtime one as a
dependency, and a loaded package cannot be swapped underneath the IDE.

Only the designer needs the packages installed. A project that creates the
switch from code compiles with step 2 alone.

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
