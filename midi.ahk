#DllLoad "winmm.dll"

MidiMain() {
  global midiDeviceID

  CALLBACK_WINDOW := 0x10000

  hMidiIn := Buffer(8)
  result := DllCall("winmm.dll\midiInOpen", "Ptr", hMidiIn, "UInt", midiDeviceID, "UInt", A_ScriptHwnd, "UInt", 0, "UInt", CALLBACK_WINDOW, "UInt")

  if (result) {
    MsgBox(Error, "Failed to call midiInOpen")
    Return
  }

  hMidiIn := NumGet(hMidiIn, 0, "UInt") ; because midiInOpen writes the value in 32 bit binary Number, AHK stores it as a string

  result := DllCall("winmm.dll\midiInStart", "UInt", hMidiIn, "UInt")

  if (result) {
    MsgBox(Error, "Failed to call midiInStart")
    Return
  }

  OnMessage(0x3C3, ON_MM_MIM_DATA) ; MM_MIM_DATA, https://learn.microsoft.com/en-us/windows/win32/multimedia/mm-mim-data
  ; OnMessage(0x3C4, ON_MM_MIM_DATA) ; MM_MIM_LONGDATA
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
