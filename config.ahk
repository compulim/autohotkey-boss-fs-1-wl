repeatingKey := ""

ProcessNote(device, channel, note, velocity, isNoteOn) {
}

ProcessCC(device, channel, cc, value) {
  global repeatingKey

  if (cc = 80) {
    Send("{Blind}" . (value = 0 ? "{LAlt up}" : "{LAlt down}{Tab}"))
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
    if (GetKeyState("Ctrl") = 1) {
      if (value != 0) {
        Send("{Blind}" . (cc = 81 ? "{PgUp}" : "{PgDn}"))
      }
    } else if (GetKeyState("Alt") = 1) {
      if (value != 0) {
        Send("{Blind}" . (cc = 81 ? "{Browser_Back}" : "{Browser_Forward}"))
      }
    } else if (value != 0) {
      repeatingKey := cc = 81 ? "{WheelUp}" : "{WheelDown}"
      SetTimer(Repeater, -1)
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
  global repeatingKey

  if (repeatingKey) {
    Send(repeatingKey)
    SetTimer(, -20)
  } else {
    SetTimer(, 0)
  }
}
