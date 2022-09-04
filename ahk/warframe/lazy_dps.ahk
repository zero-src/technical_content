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

g_width := A_ScreenWidth / 2 - 1700
g_height := A_ScreenHeight - 240

g_shock_dur := 94
g_eclipse_dur := 58

Gui +AlwaysOnTop +LastFound +Toolwindow -Caption
Gui, Color, 000000
Gui, Font, s19
Gui, Add, Text, vShock cYellow, 00
Gui, Add, Text, vEclipse cWhite, 00
WinSet, TransColor, 000000
Gui, Show, x%g_width% y%g_height% NoActivate
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
    sleep 1
    SendInput {-}
    sleep 1

    return
}

pp_r_zenith()
{
    send_propa()
    sleep 525

    send_propa()
    sleep 1100

    call_shot()
    sleep 1

    back_to_frame()
    rapidFire(40)

    return
}

console_hack()
{
    SendInput {w}
        sleep 2
        SendInput {Shift}
    SendInput {w}

    sleep 65

    loop, 3
    {
        SendInput {x}
        sleep 20
        SendInput {y}
        sleep 50
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
    SendInput {Shift Up}

    return
}

travel_to_cr()
{
    SendInput {Space Down}
    sleep 150

    SendInput {Space Up}
    sleep 110

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
    Gui, Show, x%g_width% y%g_height% NoActivate

    SendInput {5}
    ; sleep 1
    ; SendInput {5}

    shock_timer := 0
    SendInput {1 down}
        sleep 500
    SendInput {1 up}

    SetTimer, UpdateShock, -10
    SetTimer, UpdateShock, 1000

    eclipse_timer := 0
    sleep 150
    SendInput {4}

    SetTimer, UpdateEclipse, -10
    SetTimer, UpdateEclipse, 1000
    

    sleep 2000
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
    pp_r_zenith()
    sleep 3000
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

    rapidFire(80)
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               Timers                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

~*1::
    Gui, Show, x%g_width% y%g_height% NoActivate
    shock_timer := 0
    SetTimer, UpdateShock, -10
    SetTimer, UpdateShock, 1000
return

~*4::
    Gui, Show, x%g_width% y%g_height% NoActivate
    eclipse_timer := 0
    SetTimer, UpdateEclipse, -10
    SetTimer, UpdateEclipse, 1000
return

UpdateEclipse:
    eclipse_timer++
    time_display := g_eclipse_dur - eclipse_timer

    if (time_display=0)
        SetTimer, UpdateEclipse, off ; stops the counter

    GuiControl,, eclipse, %time_display%
return

UpdateShock:
    shock_timer++
    time_display := g_shock_dur - shock_timer

    if (time_display=0)
        SetTimer, UpdateShock, off ; stops the counter

    GuiControl,, Shock, %time_display%
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                Misc                 ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
*insert::reload
*del::exitapp

#IfWinActive, Warframe 
{
    *c::
        SendInput {5}
        SendInput {2}
        SendInput {c}
    return
}