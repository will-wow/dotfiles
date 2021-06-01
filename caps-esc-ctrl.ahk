#SingleInstance Force

; Capslock becomes esc & ctrl
*CapsLock::
    Send {Blind}{Ctrl Down}
    cDown := A_TickCount
Return

*CapsLock up::
    If ((A_TickCount-cDown)<160)  ; Modify press time as needed (milliseconds)
        Send {Blind}{Ctrl Up}{Esc}
    Else
        Send {Blind}{Ctrl Up}
Return

; win-alt-f: Fullscreen
#!f::WinMaximize, A

; win-alt-hjkl: half-screen
#!h::
  WinRestore, A
  WinMove, A,, 0, 0, (A_ScreenWidth/2), A_ScreenHeight
Return
#!j::
  WinRestore, A
  WinMove, A,, 0, (A_ScreenHeight/2), A_ScreenWidth, (A_ScreenHeight/2)
Return
#!k::
  WinRestore, A
  WinMove, A,, 0, 0, A_ScreenWidth, (A_ScreenHeight/2)
Return
#!l::
  WinRestore, A
  WinMove, A,, (A_ScreenWidth/2), 0, (A_ScreenWidth/2), A_ScreenHeight
Return
