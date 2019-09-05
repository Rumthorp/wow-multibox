#Persistent
#SingleInstance force
#NoEnv
#Warn
SendMode Input
SetWorkingDir %A_ScriptDir%
CoordMode, Mouse, Screen

mainWindow := 0
altWindow := 0
altCommand := false
; SetCursorPosProc := DllCall("GetProcAddress", "Ptr", DllCall("LoadLibrary", "Str", "kernel32", "Ptr"), "AStr", "SetCursorPos", "Ptr")

Command(key, mouse, alt)
{
  global
  if (WinActive("World of Warcraft") && %altCommand% = true)
  {
    if (mouse = true)
    {
      MouseGetPos, mouseX, mouseY
      SetControlDelay -1
      DllCall("SetCursorPos", Int, mouseX - 1920, Int, mouseY)
      Sleep 10
      ControlClick, X%mouseX% Y%mouseY%, ahk_id %altWindow% , , , , NA Pos
      if (alt = true)
      {
        ControlSend,, {ALT down}%key%{ALT up}, ahk_id %altWindow%
      }
      if (alt = false)
      {
        ControlSend,, %key%, ahk_id %altWindow%
      }
      %altCommand% := false
      DllCall("SetCursorPos", Int, mouseX, Int, mouseY)
      return
    }
    if (alt = true)
    {
      ControlSend,, {ALT down}%key%{ALT up}, ahk_id %altWindow%
    }
    if (alt = false)
    {
      ControlSend,, %key%, ahk_id %altWindow%
    }
    %altCommand% := false
    return
  }
  if (alt = true)
  {
    SendInput {ALT down}%key%{ALT up}
  }
  if (alt = false) {
    SendInput %key%
  }
  %altCommand% := false
  return
}

^!1::
KeyWait 1
IfWinActive, World of Warcraft
{
  WinGet, mainWindow, ID, A
  return
}

^!2::
KeyWait 2
IfWinActive, World of Warcraft
{
  WinGet, altWindow, ID, A
  return
}

^!p::
KeyWait p
IfWinActive, World of Warcraft
{
  %altCommand% := true
  Return
}

^!l::
KeyWait l
IfWinActive, World of Warcraft
{
  ControlSend,, {Control down}{Alt down}l{Control up}{Alt up}, ahk_id %altWindow%
  Return
}

^!k::
KeyWait k
IfWinActive, World of Warcraft
{
  ControlSend,, {Control down}{Alt down}k{Control up}{Alt up}, ahk_id %altWindow%
  Return
}

^!j::
KeyWait j
IfWinActive, World of Warcraft
{
  ControlSend,, {Down down}{Down up}, ahk_id %altWindow%
  return
}

; 1st row

$F1::
Command("{F1}", true, false)
return

$F2::
Command("{F2}", true, false)
return

$F3::
Command("{F3}", true, false)
return

$F4::
Command("{F4}", true, false)
return

$F5::
Command("{F5}", true, false)
return

$!F1::
Command("{F1}", true, true)
return

$!F2::
Command("{F2}", true, true)
return

$!F3::
Command("{F3}", true, true)
return

; 2nd row

$1::
Command(1, true, false)
return

$2::
Command(2, true, false)
return

$3::
Command(3, true, false)
return

$4::
Command(4, true, false)
return

$5::
Command(5, true, false)
return

$!1::
Command(1, true, true)
return

$!2::
Command(2, true, true)
return

$!3::
Command(3, true, true)
return

; 3rd row

$q::
Command("q", false, false)
return

$w::
Command("w", false, false)
return

$e::
Command("e", false, false)
return

$r::
Command("r", false, false)
return

$t::
Command("t", false, false)
return

$!q::
Command("q", true, true)
return

$!w::
Command("w", true, true)
return

$!e::
Command("e", true, true)
return

; 4th row

$a::
Command("a", false, false)
return

$s::
Command("s", false, false)
return

$d::
Command("d", false, false)
return

$f::
Command("f", false, false)
return

$g::
Command("g", false, false)
return

$!a::
Command("a", false, true)
return

$!s::
Command("s", false, true)
return

$!d::
Command("d", false, true)
return

^!r::Reload
