# AutoHotKey scripts for BOSS FS-1-WL Wireless Footswitch

> Credits to https://github.com/laurence-myers/midi-to-macro and various forum members

This script enables [BOSS FS-1-WL Wireless Footswitch](https://www.boss.info/us/products/fs-1-wl/) to use inside AutoHotKey via MIDI.

## Background

[BOSS FS-1-WL Wireless Footswitch](https://www.boss.info/us/products/fs-1-wl/) has 2 modes: keyboard HID (Bluetooth/USB) and MIDI (USB). The keyboard HID mode allows the footswitch to be programmed and work as a keyboard.

However, the programmability of keyboard HID mode is too weak to make it useful as a productivity tool:

- When the pedal is latched, it cannot tap-and-hold a key
- It cannot perform actions with key modifiers (<kbd>CTRL</kbd>, <kbd>SHIFT</kbd>, <kbd>ALT</kbd>, etc.)

We are using AutoHotKey v2 to call [`winmm.dll`](https://learn.microsoft.com/en-us/windows/win32/api/mmeapi/nf-mmeapi-midiinopen) to enable advanced scenarios.

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
