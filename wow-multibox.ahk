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

Command(key, mouse)
{
  global
  if (WinActive("World of Warcraft") && %altCommand% = true)
  {
    if (mouse = true)
    {
      MouseGetPos, mouseX, mouseY
      SetControlDelay -1
      DllCall("SetCursorPos", Int, mouseX - 1920, Int, mouseY)
      Sleep 50
      ControlSend,, %key%, ahk_id %altWindow%
      %altCommand% := false
      DllCall("SetCursorPos", Int, mouseX, Int, mouseY)
      return
    }
    ControlSend,, %key%, ahk_id %altWindow%
    %altCommand% := false
    return
  }
  SendInput %key%
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
Command("{F1}", true)
return

$F2::
Command("{F2}", true)
return

$F3::
Command("{F3}", true)
return

$F4::
Command("{F4}", true)
return

$F5::
Command("{F5}", true)
return

; 2nd row

$1::
Command(1, true)
return

$2::
Command(2, true)
return

$3::
Command(3, true)
return

$4::
Command(4, true)
return

$5::
Command(5, true)
return

; 3rd row

$q::
Command("q", false)
return

$w::
Command("w", false)
return

$e::
Command("e", false)
return

$r::
Command("r", false)
return

$t::
Command("t", false)
return

; 4th row

$a::
Command("a", false)
return

$s::
Command("s", false)
return

$d::
Command("d", false)
return

$f::
Command("f", false)
return

$g::
Command("g", false)
return

^!r::Reload
