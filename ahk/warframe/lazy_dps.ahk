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
; g_width := A_ScreenWidth / 2 - 1800
; g_height := A_ScreenHeight - 300

g_width := A_ScreenWidth / 2 - 1700
g_height := A_ScreenHeight - 200

g_shock_dur := 94
g_eclipse_dur := 58

gui, desync_bg: +AlwaysOnTop -Caption +LastFound -SysMenu +ToolWindow -DPIScale +E0x20
gui, desync_bg: Add, Progress, w30 h60 c839DD5 Background141414 vMyProgress, 0
gui, desync_bg: Color, 141414
gui, desync_bg: Show, x%g_width% y%g_height% NoActivate
WinSet, Transparent, 180

Gui +AlwaysOnTop -Caption +LastFound -SysMenu +ToolWindow -DPIScale +E0x20
Gui, Color, 000000
Gui, Font, s16
Gui, Add, Text, x13 y5 vShock cYellow, 00
Gui, Add, Text, x13 y25 vEclipse cWhite, 00
WinSet, TransColor, 000000
Gui, Show, x%g_width% y%g_height% NoActivate

gui, ping_text: +AlwaysOnTop -Caption +LastFound -SysMenu +ToolWindow -DPIScale +E0x20
gui, ping_text: Font, s10 DRAFT_QUALITY, Smallest Pixel-7
gui, ping_text: Add, Text, x3 y45 vping_text0 cCACACA, ---------
gui, ping_text: Add, Text, x9 y55 vping_text1 cCACACA, _DPS_
gui, ping_text: Color, 141414
gui, ping_text: Show, x%g_width% y%g_height% NoActivate
WinSet, TransColor, 141414
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
    call_shot()
    sleep 0
    SendInput {e}
    sleep 10
    SendInput {-}
    sleep 1
    SendInput {-}

    return
}

; pp_r_zenith()
; {
;     send_propa()
;     sleep 1625

;     SendInput {LButton} ; raplak
;     sleep 20

;     SendInput {e}
;     sleep 10
;     SendInput {-} ; agree emote
;     sleep 1
;     SendInput {-} ; agree emote

;     SendInput {RButton Down}
;     loop, 30
;     {
;         SendInput {LButton}
;         sleep 10
;     }
;     SendInput {RButton Up}

;     return
; }

pp_r_zenith()
{
    send_propa()
    sleep 1625

    SendInput {LButton} ; raplak
    sleep 10

    SendInput {e}
    sleep 40

    SendInput {RButton Down}
    loop, 30
    {
        SendInput {LButton}
        sleep 10
    }
    SendInput {RButton Up}

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
    sleep 10
    
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
    sleep 350
    SendInput {4}

    SetTimer, UpdateEclipse, -10
    SetTimer, UpdateEclipse, 1000
    
    sleep 2000
return

~LButton & RButton::
    while GetKeyState("LButton", "P") and GetKeyState("RButton", "P")
    {
        call_shot()
        sleep 10
    }
return

F4::
^F4::
    ; loop, 5
    ; {
        pp_r_zenith()
    ;     sleep 14990
    ; }
    sleep 3000
return

*F5::
    energy_drain()
return

; *F7::
;     while GetKeyState("F7", "P")
;     {
;         send_propa()
;         sleep 20
;         SendInput {-}
;         sleep 1
;         SendInput {-}
;         sleep 10
;     }
; return

*F7::
    SendInput {f}
    sleep 316
    SendInput {f}
return

Numpad0::
NumpadIns::
    travel_to_cr()

    SendInput {f}
    sleep 316
    SendInput {f}

    sleep 284
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