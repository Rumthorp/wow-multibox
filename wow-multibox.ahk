#Persistent
#SingleInstance force
#NoEnv
#Warn
SendMode Input
SetWorkingDir %A_ScriptDir%

^!1::
KeyWait 1
IfWinActive, World of Warcraft
{
  WinGet, wowid, ID, A
  MsgBox, %mainWindow%
  return
}

^!2::
KeyWait 2
IfWinActive, World of Warcraft
{
  WinGet, wowid, ID, A
  MsgBox, %altWindow%
  return
}

Space::
KeyWait Space
IfWinActive, World of Warcraft
{
  ControlSend,, {Space}, ahk_id %wowid%
  Return
}

^!r::Reload
