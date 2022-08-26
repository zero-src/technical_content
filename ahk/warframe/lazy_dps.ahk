SetWorkingDir %A_ScriptDir%  
#SingleInstance Force
#Persistent
#NoEnv
#InstallKeybdHook
#InstallMouseHook
SetBatchLines -1
SetKeyDelay, -1, -1
SetMouseDelay, -1, -1
SetControlDelay -1
SetWinDelay -1
#MaxHotkeysPerInterval 200

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                 GUI                 ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

g_width := A_ScreenWidth / 2 - 25
g_height := A_ScreenHeight / 2 + 25

Gui +AlwaysOnTop +LastFound +Toolwindow -Caption
Gui, Color, 000000
Gui, Font, s14
Gui, Add, Text, vSpeed cWhite, "S"
WinSet, TransColor, 000000
return

;*F11:: Suspend

; *F12:: 
; Suspend Off
; Reload
; return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               Hotkeys               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
send_propa() 
{
    SendInput {MButton}
    return 
}

call_shot() {
    SendInput {LButton}
    return
}

rapidFire(ms) {
    loop % ms
    {
        SendInput {LButton}
        sleep 1
    }
    return
}

back_to_frame()
{
    SendInput {e}
    sleep 1
    SendInput {-}
    sleep 2

    return
}

ppp_zenith()
{
    send_propa()
    sleep 550
    send_propa()
    sleep 550
    send_propa()
    
    sleep 520
    back_to_frame()

    rapidFire(40)

    return
}

console_hack()
{
    SendInput {w}
        sleep 1
        SendInput {Shift}
    SendInput {w}

    sleep 70

    loop, 3
    {
        SendInput {x}
        sleep 20
        SendInput {y}
        sleep 30
    }
    return
}

energy_drain()
{
    SendInput {Shift down}
    Loop, 20
    {
        SendInput {Space}
        SendInput {LButton}
        Sleep 1
    }
    SendInput {Shift up}

    return
}

travel_to_cr()
{
    SendInput {Space Down}
    sleep 150

    SendInput {Space Up}
    sleep 100

    SendInput {Shift}
    DllCall("mouse_event", uint, 1, int, -1501, int, 438, uint, 0, int, 0)

    return
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               Hotkeys               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

*XButton2::
    console_hack()
return

*F1::
    SendInput {5}
        sleep 1
    SendInput {5}

    SendInput {2}
    sleep 50
    
    SendInput {1 down}
        sleep 500
    SendInput {1 up}

    sleep 150
    SendInput {4}

    sleep 3000
return

*F3::
~LButton & RButton::
    while GetKeyState("F3", "P") or GetKeyState("LButton", "P") and GetKeyState("RButton", "P")
    {
        call_shot()
        sleep 1
    }
return

F4::
^F4::
    ppp_zenith()
    sleep 5000
return

*F5::
    energy_drain()
return

Numpad2::
NumpadDown::
    travel_to_cr()
    sleep 600

    SendInput {f}
    sleep 30
    SendInput {f}

    rapidFire(50)
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               Timers                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; ~*2::
;     Gui, Show, x%g_width% y%g_height% NoActivate
;     speed := 0
;     SetTimer, UpdateSpeed, -10
;     SetTimer, UpdateSpeed, 1000
; return

; UpdateSpeed:
;     speed++
;     time_display := 23 - speed

;     if (time_display=0)
;         SetTimer, UpdateSpeed, off ; stops the counter

;     GuiControl,, Speed, %time_display%
; return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                Misc                 ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
*insert::reload
*del::exitapp