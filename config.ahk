ProcessNote(device, channel, note, velocity, isNoteOn) {
}

ProcessCC(device, channel, cc, value) {
  if (cc = 80) {
    if (value = 0) {
      Send("{Blind}{LAlt up}")
    } else {
      Send("{Blind}{LAlt down}")
      Send("{Tab}")
    }
  }

  if (WinActive("ahk_class XamlExplorerHostIslandWindow")) {
    if (cc = 81 and value != 0) {
      Send("{Left}")
    } else if (cc = 82 and value != 0) {
      Send("{Right}")
    }
  } else if (cc = 81 and value != 0) {
    Loop 5 {
      Send("{WheelUp}")
      Sleep(5)
    }
  } else if (cc = 82 and value != 0) {
    Loop 5 {
      Send("{WheelDown}")
      Sleep(5)
    }

    ; Send("{LWin down}{Space}{LWin up}")
  }
}

ProcessPC(device, channel, note, velocity) {
}

ProcessPitchBend(device, channel, value) {
}
