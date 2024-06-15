# AutoHotKey scripts for BOSS FS-1-WL

> Credit to https://github.com/laurence-myers/midi-to-macro and various forum members

This script enables BOSS FS-1-WL to use inside AutoHotKey via MIDI.

## Background

The BOSS FS-1-WL has 2 modes: keyboard HID (Bluetooth/USB) and MIDI (USB).

The keyboard HID mode is too simple and be useful:

- Cannot tap-and-hold a key
- Cannot perform actions with key modifiers (<kbd>CTRL</kbd>, <kbd>SHIFT</kbd>, <kbd>ALT</kbd>, etc.)

We are using AutoHotKey v2 to call `winmm.dll` to enable advanced scenarios.

## How to use

Install AutoHotKey v2 from https://github.com/AutoHotkey/AutoHotkey/releases. Then, run `main.ahk`.

To configure how each pedal works, edit `config.ahk`.

## Functionality

All functions assume the BOSS FS-1-WL is in default configuration (left pedal is CC 80, middle pedal is CC 81, right pedal is CC 82).

### Task switching

Steps to switching tasks (<kbd>ALT</kbd> + <kbd>TAB</kbd>):

1. Tap-and-hold left pedal will activate Windows task switcher
1. Tap middle pedal to select previous window
1. Tap right pedal to select next window
1. Release left pedal to switch to the selected window

### Mouse scroll

Steps to scroll up and down:

1. Tap middle pedal to scroll up 5 times
1. Tap right pedal to scroll down 5 times

## Contributions

Like us? [Star](https://github.com/compulim/autohotkey-boss-fs-1-wl/stargazers) us.

Want to make it better? [File](https://github.com/compulim/autohotkey-boss-fs-1-wl/issues) us an issue.

Don't like something you see? [Submit](https://github.com/compulim/autohotkey-boss-fs-1-wl/pulls) a pull request.
