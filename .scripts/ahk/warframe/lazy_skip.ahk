SetWorkingDir %A_ScriptDir%  
#MaxHotkeysPerInterval 777
#SingleInstance Force
#Persistent
#NoEnv
#InstallKeybdHook
#InstallMouseHook
SetNumLockState AlwaysOn
ListLines off
SetBatchLines -1
SetKeyDelay, -1, -1
SetMouseDelay, -1
SetControlDelay -1
SetWinDelay -1

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               Globals               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Game Settings (desc: ingame bind names)
fps             = 200       ; Average ingame fps
clickKey        = LButton   ; Left mouse Button

; Macro Hotkeys
SkipDialogKey       = F1 ; Skips long dialog
MissionResetKey     = F2 ; Quit -> join mission

; Do not touch this
sleepTime := 2000/fps
safeSleepTime := 1000/fps

#IfWinActive ahk_exe Warframe.x64.exe
Hotkey, IfWinActive, ahk_exe Warframe.x64.exe

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               Hotkeys               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Hotkey, *%SkipDialogKey%, SkipDialog
Hotkey, *%MissionResetKey%, MissionReset

return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                Funcs                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
MouseMove(move_x, move_y) 
{
    DllCall("mouse_event", uint, 1, int, move_x, int, move_y, uint, 0, int, 0)
    return
}

SkipDialog:
    SendInput, {Blind}{Esc}
    Sleep, 50

    MouseGetPos, cur_x, cur_y
    MouseMove(A_ScreenWidth - cur_x, A_ScreenHeight - cur_y)
    MouseMove(-355, -185)

    Sleep, 10
    SendInput, {Blind}{%clickKey% Down}
        Sleep, 50
    SendInput, {Blind}{%clickKey% Up}
    Sleep, 300

    SendInput, {Blind}{Esc}
    Sleep, %safeSleepTime%
    SendInput, {Blind}{Esc}
return

MissionReset:

return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                Misc                 ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
#IfWinActive
*Insert::reload
*Del::exitapp