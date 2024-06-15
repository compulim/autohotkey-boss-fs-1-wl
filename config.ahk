ProcessNote(device, channel, note, velocity, isNoteOn) {
}

ProcessCC(device, channel, cc, value) {
  global repeatingKey

  if (cc = 80) {
    if (value = 0) {
      Send("{Blind}{LAlt up}")
    } else {
      Send("{Blind}{LAlt down}{Tab}")
    }
  }

  if (WinActive("ahk_class XamlExplorerHostIslandWindow")) {
    repeatingKey := ""
    SetTimer(Repeater, 0)

    if (cc = 81 and value != 0) {
      Send("{Left}")
    } else if (cc = 82 and value != 0) {
      Send("{Right}")
    }
  } else if (cc = 81 or cc = 82) {
    if (value != 0) {
      repeatingKey := cc = 81 ? "{WheelUp}" : "{WheelDown}"
      SetTimer(Repeater, 1)
    } else {
      repeatingKey := ""
      SetTimer(Repeater, 0)
    }
  }
}

ProcessPC(device, channel, note, velocity) {
}

ProcessPitchBend(device, channel, value) {
}

Repeater() {
  if (repeatingKey) {
    Send(repeatingKey)
    SetTimer(, 20)
  } else {
    SetTimer(, 0)
  }
}
