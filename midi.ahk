#DllLoad "winmm.dll"

MidiMain() {
  CALLBACK_WINDOW := 0x10000

  numPorts := DllCall("winmm.dll\midiInGetNumDevs")

  Loop numPorts {
    hMidiIn := Buffer(8)
    midiDeviceID := A_Index - 1

    result := DllCall("winmm.dll\midiInOpen", "Ptr", hMidiIn, "UInt", midiDeviceID, "UInt", A_ScriptHwnd, "UInt", 0, "UInt", CALLBACK_WINDOW, "UInt")

    if (result) {
      MsgBox("Failed to call midiInOpen for device ID " . midiDeviceID)
      Return
    }

    result := DllCall("winmm.dll\midiInStart", "UInt", NumGet(hMidiIn, 0, "UInt"), "UInt")

    if (result) {
      MsgBox("Failed to call midiInStart for device ID " . midiDeviceID)
      Return
    }
  }

  OnMessage(0x3C3, ON_MM_MIM_DATA) ; MM_MIM_DATA, https://learn.microsoft.com/en-us/windows/win32/multimedia/mm-mim-data
}

ON_MM_MIM_DATA(hInput, midiMsg, wMsg, hWnd) {
  statusByte := midiMsg & 0xFF
  channel := (statusByte & 0x0F) + 1
  byte1 := (midiMsg >> 8) & 0xFF
  byte2 := (midiMsg >> 16) & 0xFF

  if (statusByte >= 128 and statusByte <= 159) { ; Note off/on
    ProcessNote(0, channel, byte1, byte2, (statusByte >= 144 and byte2 > 0))
  } else if (statusByte >= 176 and statusByte <= 191) { ; CC
    ProcessCC(0, channel, byte1, byte2)
  } else if (statusByte >= 192 and statusByte <= 208) { ; PC
    ProcessPC(0, channel, byte1, byte2)
  } else if (statusByte >= 224 and statusByte <= 239) { ; Pitch bend
    ProcessPitchBend(0, channel, (byte2 << 7) | byte1)
  }
}

MidiMain()
