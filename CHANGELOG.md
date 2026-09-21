# Changelog

All notable changes to this project are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

The next release takes the major number: the rename below breaks every
installation of 2.1.0.

### Added

- `ReadOnly: Boolean`, default `False`. A read-only switch shows a value the
  user may not change: the pointer, the space bar and a drag of the thumb are
  all closed, while `Checked` set from code works as always and still raises
  `OnChange`. It is not `Enabled := False` — the switch keeps its normal
  colours, stays in the tab order and still takes the focus when clicked. Since
  nothing the user does reaches it, there is no hover highlight and no pressed
  state, and `OnClick`, which reports a switch that changed, does not fire.

- An accelerator in the header. `&Sound` underlines the S, and Alt+S gives the
  switch the focus and toggles it, the way an accelerator works a check box.
  Both halves follow the rules a click follows: the value changes only where the
  keyboard may change it, so `KeyboardToggle` off or `ReadOnly` on leaves the
  switch as it was, and the focus is taken only where a click would take it. The
  underline keeps to the convention Windows sets for the window: hidden until
  Alt is pressed, like the focus ring. The letter is picked by `IsAccel`, so as
  in every VCL caption only the first ampersand in the string counts.

- `ParentHeaderFont: Boolean`, default `True`. The header font used to follow
  `Font` only until something assigned to `HeaderFont`, and after that there was
  no way back: the flag that remembered it was internal and write-once, so a
  header font touched once in the designer stayed detached for good, with
  nothing in the Object Inspector to say so or undo it. The flag is now a
  property, and putting it back to `True` returns the header to `Font` at once.

- `TCustomFluentToggleSwitch`, the ancestor that carries the implementation.
  `TFluentToggleSwitch` descends from it and does nothing but publish
  properties, so a component descending from the custom class can publish its
  own selection or leave a property out. Code using `TFluentToggleSwitch` is
  unaffected: the class name, the published properties and the `.dfm` it
  streams are what they were.

### Changed

- **Breaking.** An ampersand in `HeaderText` is no longer drawn as one. It marks
  the letter after it, and `&&` draws a single ampersand, as in every VCL
  caption. A header that carried a literal ampersand — `Sound & vibration` —
  now reads `Sound  vibration` with the space underlined, and measures
  narrower, so a switch left at `AutoSize` changes width with it. Doubling the
  ampersand keeps the old picture: `Sound && vibration`.

- **Breaking.** A compiled package carries the compiler version in its name:
  `FluentToggleSwitchR370.bpl` under Florence, `FluentToggleSwitchR290.bpl`
  under Athens, the way RAD Studio names `rtl290` and `vcl370`. Both packages
  used to build as `FluentToggleSwitchR.bpl` and `FluentToggleSwitchD.bpl`
  whichever IDE produced them. Inside the IDE that collided with nothing, since
  every version keeps its own `Bpl` directory, but two applications deployed
  with runtime packages into one directory overwrote each other's copy, and the
  name said nothing about which was which.

- Each package states what it is for. The runtime package is runtime only and
  no longer appears in Component → Install Packages, where installing it
  registered nothing; the design-time package is design-time only. Their
  descriptions name the role, so the two are no longer identical entries in the
  IDE lists.

- Both packages build for Win64 as well as Win32, and so do the tests. The
  runtime package targeted Win32 alone while the README promised both, so a
  Win64 application built with runtime packages had nothing to link against.
  The component source needed no change for it — no pointer casts, no
  assembler, no platform conditionals — and the tests pass on both platforms.
  Whether the Win64 design-time package installs into the 64-bit IDE of
  Florence is untested.

- The version resource of both packages is filled in: company, product and
  copyright as they read in `LICENSE`, a description naming the package, and a
  comment pointing at the repository. The properties of a `.bpl` now say who
  made it and under what licence — which is worth something, since the file
  travels without `LICENSE` beside it.

### Upgrading from 2.1.0

The `.bpl` files are renamed, so the IDE still has the old ones registered.

1. Under Component → Install Packages remove the entry without a version
   suffix, `FluentToggleSwitchD.bpl`, and `FluentToggleSwitchR.bpl` if it is
   listed there too.
2. Delete `FluentToggleSwitchR.bpl` and `FluentToggleSwitchD.bpl` — the ones
   without a suffix — from `$(BDSCOMMONDIR)\Bpl`. Nothing rebuilds them any
   more, and while they are there a project asking for the package by name can
   still find them. The `.dcp`, `.bpi` and `.lib` in `$(BDSCOMMONDIR)\Dcp`
   keep their names: the suffix applies to the `.bpl` alone, so those files are
   simply overwritten and must stay.
3. Build and install the packages again, as in **Installing** in the README.

## [2.1.0] - 2026-09-18

### Changed

- Both packages now leave their `.dcu` in `.\$(Platform)\$(Config)`, beside the
  package itself, instead of `$(BDSCOMMONDIR)\Dcp`. The old directory is on the
  library path by default, which is why installing the packages used to be
  enough on its own; it is also shared by every platform and configuration, so
  Win32 and Win64, Debug and Release wrote `.dcu` of the same names over each
  other and the last build won. The setting came from the IDE template and was
  never a decision.

  Projects now compile the component from `source` under their own compiler
  settings, the way the other component libraries for Delphi work, rather than
  linking `.dcu` built with the package's settings.

- The leak monitor of the test project follows DUnitX through a rename of its
  own: Florence ships `DUnitX.ServiceLocator` with `TDUnitXServiceLocator`,
  Athens ships `DUnitX.IoC` with `TDUnitXIoC`. The unit picks one by compiler
  version, so the tests build on both. Nothing outside `tests/` is affected.

### Upgrading from 2.0.0

Installing the packages no longer makes the unit visible on its own.

1. Add the `source` directory of this release to the library path, under
   **Tools | Options | Language | Delphi | Library**, for every platform you
   build for. Without it projects stop finding `Fluent.ToggleSwitch`.
2. Delete what the old layout left behind:
   `$(BDSCOMMONDIR)\Dcp\Fluent.ToggleSwitch*.dcu`. While those files are
   there the compiler keeps finding them, and the change appears to have done
   nothing.

Nothing in the component itself changed: same unit, same class, same
properties.

## [2.0.0] - 2026-09-17

The switch answers the keyboard, carries a header, and follows the accent
colour while the program runs. The unit and the package are renamed, the
package is split in two, and two events mean something different, so this is
not a drop-in replacement for 1.6. What to change on the way up is at the end
of this section.

A 1.7.0 was prepared and never released; everything it held is here.

### Added

- The switch answers the keyboard. Space toggles it when the key comes back
  up, so holding it down does not fire over and over. `TabStop` now defaults
  to `True`, and `KeyboardToggle` turns the key off without taking the switch
  out of the tab order.
- A focus ring, drawn around the switch and its caption. It follows the
  convention Windows sets: hidden until someone navigates by keyboard, shown
  from then on. `ShowFocus` decides whether the switch takes part in that at
  all.
- A header: a line of text above or below the switch that describes it, the
  way a label describes an edit box, with `ShowHeader`, `HeaderText`,
  `HeaderPosition`, `HeaderAlignment`, `HeaderSpacing` and a `HeaderFont` of
  its own. The header is not a target for the pointer, and turning it on takes
  its room out of the form rather than moving the switch. A switch that has
  never been given a header carries its own `Name`.
- The form designer is given the baseline of the caption, so the switch lines
  up with the captions of the labels, edits and buttons around it. The
  baseline is published whether or not the caption is shown, the way a check
  box publishes one without a caption. A new design-time unit carries this and
  the palette registration; the component unit stays free of design-time
  dependencies. A vertical centre guide is not possible, the designer having
  no guide type for it.
- The switch follows the Windows accent colour while the program runs, not
  only at startup.
- A palette icon.
- `TextTop`, a public method saying where the caption is painted. It exists
  for the designer.
- An API reference, [docs/API.md](docs/API.md), covering every property,
  method and event, and the behaviour behind them.

### Changed

- **Breaking.** The unit is `Fluent.ToggleSwitch`, the enumerations are
  `TFluentTextPosition` and `TFluentHeaderPosition`, and the palette page is
  **Fluent**. The class keeps its name.
- **Breaking.** One package became two: `FluentToggleSwitchR` holds the
  component and builds for Win32 and Win64, `FluentToggleSwitchD` holds the
  design-time unit and is installed into the IDE. A program that uses the
  component no longer drags a dependency on `designide` behind it.
- **Breaking.** `OnChange` reports the value and no longer cares who moved it,
  so it fires for an assignment in code as well as for the user. This is what
  `Toggled` means in WinUI and what `OnClick` means on a `TCheckBox`. Reading
  a DFM still raises nothing.
- **Breaking.** `OnClick` reports the action: it fires only when the user
  toggles the switch, and after the value has moved, so a handler reads what
  the user just asked for. It used to be the standard click, which arrived
  before the value moved and also for a press that changed nothing.
- **Breaking.** The colour properties default to `clDefault` rather than
  `clNone`. The meaning is unchanged: leave it to the theme.
- **Breaking.** `TextSpacing` defaults to 12 rather than 8, and is measured
  from the outline of the track rather than from the edge of the control,
  which is how the WinUI template measures it.
- **Breaking.** The switch measures 42 by 22 at 100% rather than 44 by 24. It
  keeps one pixel around the track, which is what the focus ring needs. Use
  `Margins` where more room is wanted.
- **Breaking.** `TabStop` defaults to `True`. In 1.6 the switch was mouse-only
  and deliberately kept out of the tab order; it answers the keyboard now.
- Scaling is worked out from `CurrentPPI` and from the design numbers at every
  step, rather than from a scale of the component's own and rounded values
  carried forward. A form moved between monitors of different scale and back
  lands exactly where it started.
- The animation timer sits on the window of the switch itself. It used to be a
  `TTimer`, which allocates a hidden window of its own, and the first thing to
  animate created one per switch: a passing pointer was enough. A form of
  thirty switches kept thirty windows long after the animation ended.
- The layout is worked out once per event rather than once per property.
  Loading a form used to measure the text for every property that arrived and
  throw the lot away at the end; a change of scale used to run the layout three
  times, twice against a scale not yet updated.
- The colour of the track follows the thumb while it is dragged, and both
  directions cross-fade. WinUI holds the starting colour through the gesture
  and snaps back from on to off. Both departures are deliberate and are set
  out in the API reference.

### Fixed

- `TextSpacing` was not scaled for the display. On a screen at 300% the gap
  stayed at its unscaled size while everything around it tripled.
- A gesture the system takes back is now dropped, with the thumb returning and
  no event raised. That covers a menu or a modal dialog opening mid-gesture,
  the switch being disabled mid-gesture, and another window taking the mouse
  capture. A drag that reached past the middle used to go through with it.
- A drag that began while the thumb was still travelling counted from where
  the thumb would have come to rest rather than from where it was, so the
  thumb could leave the track and jump on release.
- Freeing the switch from its own `OnChange` or `OnClick` handler is now safe.
  The switch used to carry on using itself after the handler returned.

### Removed

- The `ToggleSwitch` unit, the `ToggleSwitch` package and the `ToggleSwitch`
  palette page. See the rename above.

### Upgrading from 1.6

1. Uninstall the old package, then build `FluentToggleSwitchR` and install
   `FluentToggleSwitchD`.
2. Replace `ToggleSwitch` with `Fluent.ToggleSwitch` in every uses clause, and
   `TTextPosition` with `TFluentTextPosition` wherever it is named.
3. Forms keep working: the properties are read by name, and the ones that were
   renamed are types rather than properties. Switches placed on a form will
   take their new size the next time the form is loaded.
4. Read every `OnChange` handler again. It now fires for assignments in code,
   which it did not before, so a handler that writes back to another switch
   can now come round to itself.
5. Read every `OnClick` handler again. It now fires only on a real toggle, and
   after the value has moved.

## [1.6.0] - 2026-09-10

### Added

- The package carries its version. It is stamped into the compiled `.bpl` and into the package description, so the installed version is visible in Component → Install Packages without opening any file.

### Changed

- The switch no longer takes focus. Clicking it leaves focus where it was, and `TabStop` now defaults to `False`, so the Tab key skips it. It already ignored the keyboard and drew no focus indicator, so the focus it held was invisible and did nothing.

## [1.5.0] - 2026-09-10

### Changed

- A frame now builds one path, one brush and one pen and recolors them per shape, instead of allocating seven to eight GDI+ objects. At 60 frames per second that is roughly 250 fewer allocations per second per animating switch. The objects still do not outlive the paint, because the GDI+ wrapper unit shuts the library down in its finalization, which can run before the last control is destroyed.
- The animation timer, and the hidden window it owns, are created on first use rather than for every instance. A form full of switches no longer pays for timers nothing has started.
- Animations no longer run while the switch is not showing, for example on an inactive tab page. The state applies immediately instead.
- Text height is measured when the font or the text changes rather than on every frame, and the font is assigned to the canvas once per paint instead of twice. Vertical centering now uses the same metric the auto-sizing uses.
- The track is positioned on whole pixels so its outline stays crisp when the text makes the control an odd number of pixels tall.
- Fully transparent fills and strokes are skipped instead of being rasterized.

## [1.4.0] - 2026-09-10

### Fixed

- A click that nudged the pointer by less than the drag threshold left the thumb permanently offset by those few pixels.
- Disabling the component while it was pressed left it stuck in the pressed state, because a disabled window never receives the matching mouse release.
- A DPI change measured the layout once at the old scale before correcting itself.

### Changed

- Animation timings now follow the WinUI template. The thumb waits 33 ms, then slides for 367 ms along a cubic Bezier curve, replacing the previous 150 ms ease-out. `AnimationDuration` now defaults to 367.
- Hover, press and disabled changes cross-fade over 83 ms (250 ms into disabled) instead of taking effect instantly. Thumb size and position animate along with the colors.
- The On track uses the accent color configured in Windows, read from the system palette. Without it the component falls back to `#0067C0`, the Windows 11 default.
- Hover and press lighten the On track toward the background by lowering opacity to 0.9 and 0.8. Previously they darkened it, which is the opposite of the WinUI behavior. The previous shades came from the Windows 10 palette.

## [1.3.0] - 2026-09-10

### Added

- The thumb can be dragged within the track. Releasing it past the middle switches the state; otherwise it snaps back.
- The pressed thumb stretches into a 17×14 pill hugging the track edge, as in WinUI 3.

### Changed

- Off-state colors follow the WinUI 3 Light theme: translucent fill, stroke and thumb are blended over the parent background. Hover darkens the track fill instead of the stroke and thumb.
- Off and On tracks cross-fade during the transition instead of interpolating colors.
- The track stroke is centered on the outline and scaled with DPI. Previously it was a fixed 1 px inset stroke.
- `OnChange` fires only when the user toggles the switch. Setting `Checked` in code no longer raises it.
- Clicking anywhere on the component, including the text label, toggles it and focuses the control.
- Sizes are recomputed from the base constants on every DPI change instead of rescaling rounded values.

### Removed

- Space and Enter no longer toggle the switch.
- The focus rectangle.

## [1.2.0] - 2026-03-13

### Added

- Tests for the no-parent scenario, toggle logic, `OnChange` firing and default state.
- Demo screenshot in the README.

### Changed

- The demo computes its layout from control heights, so nothing overlaps on high-DPI displays.
- Platform list updated to Win32/Win64.

### Fixed

- DPI-aware scaling: correct rendering on high-DPI displays (per-monitor V2).
- Text properties can be set before `Parent` is assigned.
- Space and Enter fire `OnClick` in addition to `OnChange`.
- The background uses the parent color when `Color` is `clNone`.
- Only the track responds to clicks; the text label is passive.
- Compiler warnings: missing units and unused variables.

## [1.1.0] - 2026-03-12

### Added

- Color properties `TrackFrameColor`, `TrackColorOff`, `TrackColorOn`, `ThumbColorOff` and `ThumbColorOn`. `clNone` keeps the built-in scheme.
- Text label: `ShowText`, `TextOn`, `TextOff`, `TextPosition` and `TextSpacing`. The component auto-sizes to the text.
- `Font` republished for the text label.
- 17 DUnitX tests covering color and text properties, auto-sizing and input validation.

### Fixed

- The click area is restricted to the track.
- Bounds are recalculated after DPI scaling (`ChangeScale`).
- Negative `TextSpacing` is clamped to 0.
- The test runner waits for input before closing; FastMM4 is compiled conditionally.

## [1.0.1] - 2026-03-12

### Added

- README with setup instructions.
- MIT license.

### Fixed

- `TToggleSwitch` renamed to `TFluentToggleSwitch` to avoid the conflict with `Vcl.WinXCtrls`.
- Compiled units go to the global Dcp directory, so `uses ToggleSwitch;` works without a Search Path entry.

## [1.0.0] - 2026-03-12

First public release: GDI+ rendering, EaseOutCubic animation, 8 visual states, WinUI 3 Light colors, mouse and keyboard input, design-time package.

[Unreleased]: https://github.com/Abduction-Lamp/FluentToggleSwitch-VCL/compare/v2.1.0...HEAD
[2.1.0]: https://github.com/Abduction-Lamp/FluentToggleSwitch-VCL/compare/v2.0.0...v2.1.0
[2.0.0]: https://github.com/Abduction-Lamp/FluentToggleSwitch-VCL/compare/v1.6.0...v2.0.0
[1.6.0]: https://github.com/Abduction-Lamp/FluentToggleSwitch-VCL/compare/v1.5.0...v1.6.0
[1.5.0]: https://github.com/Abduction-Lamp/FluentToggleSwitch-VCL/compare/v1.4.0...v1.5.0
[1.4.0]: https://github.com/Abduction-Lamp/FluentToggleSwitch-VCL/compare/v1.3.0...v1.4.0
[1.3.0]: https://github.com/Abduction-Lamp/FluentToggleSwitch-VCL/compare/v1.2.0...v1.3.0
[1.2.0]: https://github.com/Abduction-Lamp/FluentToggleSwitch-VCL/compare/v1.1.0...v1.2.0
[1.1.0]: https://github.com/Abduction-Lamp/FluentToggleSwitch-VCL/compare/v1.0.1...v1.1.0
[1.0.1]: https://github.com/Abduction-Lamp/FluentToggleSwitch-VCL/compare/v1.0.0...v1.0.1
[1.0.0]: https://github.com/Abduction-Lamp/FluentToggleSwitch-VCL/releases/tag/v1.0.0
