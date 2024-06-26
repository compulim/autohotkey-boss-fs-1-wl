# AutoHotKey scripts for BOSS FS-1-WL Wireless Footswitch

[![Boss FS-1-WL Wireless Footswitch](./images/FS-1-WL_F.jpg)](https://www.boss.info/us/products/fs-1-wl/)

> Credits to https://github.com/laurence-myers/midi-to-macro and various forum members

This script enables [BOSS FS-1-WL Wireless Footswitch](https://www.boss.info/us/products/fs-1-wl/) to use inside AutoHotKey v2 via MIDI in Windows.

It can be extended to support any types of MIDI input device.

## Background

[BOSS FS-1-WL Wireless Footswitch](https://www.boss.info/us/products/fs-1-wl/) is a wireless footswitch designed for guitar amp and PC.

It has 2 modes: keyboard HID (Bluetooth/USB) and MIDI (USB). The keyboard HID mode allows the footswitch to be programmed and work as a keyboard.

However, the programmability of keyboard HID mode is too weak to make it useful as a productivity tool:

- When the pedal is latched, it cannot tap-and-hold a key
- It cannot perform actions with key modifiers (<kbd>ALT</kbd>, <kbd>CTRL</kbd>, <kbd>SHIFT</kbd>, etc.)

In this repository, we are using AutoHotKey v2 to call into [`winmm.dll`](https://learn.microsoft.com/en-us/windows/win32/api/mmeapi/nf-mmeapi-midiinopen) to enable advanced scenarios, such as <kbd>ALT</kbd> + <kbd>TAB</kbd> and scrolling mouse wheel.

## How to use

1. Install AutoHotKey v2 from https://github.com/AutoHotkey/AutoHotkey/releases
1. Connect FS-1-WL via a USB cable
1. Turn on FS-1-WL and switch to MIDI mode
1. Run [`main.ahk`](/main.ahk)

To configure how each pedal works, edit [`config.ahk`](/config.ahk).

Note: this script will listen to all MIDI devices available in the system.

## Functionality

All functions assume the BOSS FS-1-WL Wireless Footswitch is in its default configuration:

- Left pedal is `CC 80`
- Middle pedal is `CC 81`
- Right pedal is `CC 82`

### Task switching

Steps to switching tasks (<kbd>ALT</kbd> + <kbd>TAB</kbd>):

1. Tap-and-hold left pedal to activate Windows task switcher
1. Tap middle pedal to select previous window
1. Tap right pedal to select next window
1. Release left pedal to switch to the selected window

### Scrolling mouse wheel

Steps to scroll up and down:

- Tap-and-hold middle pedal to scroll up until the pedal has released
- Tap-and-hold right pedal to scroll down until the pedal has released

### Browser going back and forward

- Press-and-hold <kbd>ALT</kbd>
- Tap middle pedal to go back
- Tap right pedal to go forward

### Pressing <kbd>CTRL</kbd> + <kbd>PGUP</kbd>/<kbd>PGDN</kbd>

- Press-and-hold <kbd>CTRL</kbd>
- Tap middle pedal to press <kbd>CTRL</kbd> + <kbd>PGUP</kbd>
- Tap right pedal to press <kbd>CTRL</kbd> + <kbd>PGDN</kbd>

## Disclaimer

We are not endorsed or affiliated with BOSS and Roland Corporation.

## Contributions

Like us? [Star](https://github.com/compulim/autohotkey-boss-fs-1-wl/stargazers) us.

Want to make it better? [File](https://github.com/compulim/autohotkey-boss-fs-1-wl/issues) us an issue.

Don't like something you see? [Submit](https://github.com/compulim/autohotkey-boss-fs-1-wl/pulls) a pull request.
