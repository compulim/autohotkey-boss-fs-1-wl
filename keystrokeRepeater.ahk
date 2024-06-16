repeatingKey := ""
repeatingIndex := 0
maxRepeatingAfterIndex := 50 ; Repeat speed will max out after 50 keystrokes
minRepeatRate := 50 ; Slowest speed to start at, send another keystroke after 50 ms
maxRepeatRate := 10 ; Fastest speed to reach, send another keystroke after 10 ms

Max(index, max) {
  return index > max ? max : index
}

RepeatKeystroke(key) {
  global repeatingKey, repeatingIndex

  if (key) {
    repeatingKey := key
    repeatingIndex := 0

    SetTimer(Repeater, -1)
  } else {
    SetTimer(Repeater, 0)
  }
}

Repeater() {
  global maxRepeatingAfterIndex, maxRepeatRate, minRepeatRate, repeatingIndex, repeatingKey

  if (repeatingKey) {
    Send(repeatingKey)

    repeatingIndex := Max(repeatingIndex + 1, maxRepeatingAfterIndex)
    rate := 1 - (1 - repeatingIndex / maxRepeatingAfterIndex) ** 4 ; Ease-out quart, 0.0 -> 1.0
    repeatAfterMS := (maxRepeatRate + minRepeatRate) - (rate * minRepeatRate) ; 0.0 -> minRepeatRate, 1.0 -> maxRepeatRate

    SetTimer(, -repeatAfterMS) ; Defensive: negative number to run-once
  } else {
    SetTimer(, 0) ; Defensive
  }
}
