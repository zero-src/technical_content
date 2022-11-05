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
g_width := A_ScreenWidth * 0.008
g_height := A_ScreenHeight * 0.86

g_speed_dur := 20
g_eclipse_dur := 42

gui, desync_bg: +AlwaysOnTop -Caption +LastFound -SysMenu +ToolWindow -DPIScale +E0x20
gui, desync_bg: Add, Progress, w30 h60 c839DD5 Background141414 vMyProgress, 0
gui, desync_bg: Color, 141414
gui, desync_bg: Show, x%g_width% y%g_height% NoActivate
WinSet, Transparent, 180

Gui +AlwaysOnTop -Caption +LastFound -SysMenu +ToolWindow -DPIScale +E0x20
Gui, Color, 000000
Gui, Font, s14
Gui, Add, Text, x15 y5 vSpeed cYellow, 00
Gui, Add, Text, x15 y25 vEclipse cWhite, 00
WinSet, TransColor, 000000
Gui, Show, x%g_width% y%g_height% NoActivate

gui, ping_text: +AlwaysOnTop -Caption +LastFound -SysMenu +ToolWindow -DPIScale +E0x20
gui, ping_text: Font, s10 DRAFT_QUALITY, Smallest Pixel-7
gui, ping_text: Add, Text, x3 y45 vping_text0 cCACACA, ---------
gui, ping_text: Add, Text, x12 y55 vping_text1 cCACACA, _PT_
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
;;                Funcs                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

call_shot() {
    SendInput {LButton}
    return
}

anim_skip()
{
    sleep 10
    SendInput {-}
    sleep 1
    SendInput {-}
    return
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               Hotkeys               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Vasarin dash
*q::
    SendInput {XButton1}
    sleep 50

    SendInput {RButton Down}
    sleep 50
    SendInput {RButton Up}

    sleep 100

    SendInput {Ctrl Down}
        sleep 300
        SendInput {S Down}
        sleep 50

        SendInput {Space}

        sleep 10
        SendInput {S Up}
        sleep 10
    SendInput {Ctrl Up}

    sleep 150
    SendInput {RButton}
    sleep 0
    SendInput {XButton1}
return

; Zaw attack
*XButton2::
    SendInput {Space}
    sleep 90
    SendInput {Space}
    sleep 110

    SendInput {RButton Down}
    sleep 30
    SendInput {e}
    sleep 30
    SendInput {RButton Up}
return

;Phase helper
~RButton & LButton::
    while GetKeyState("LButton", "P") and GetKeyState("RButton", "P")
    {
        sleep 0

        loop % 20 ; wisp?
        {
            SendInput {LButton}
            sleep 1
        }

        sleep 20
        SendInput {f}

        anim_skip()

        SendInput {LButton Down}
            sleep 450 ; wisp?
        SendInput {LButton Up}

        SendInput {f}

        anim_skip()
        sleep 350

        SendInput {Space}
        sleep 90
        SendInput {Space}
        sleep 110

        SendInput {RButton Down}
        sleep 30
        SendInput {e}
        sleep 30
        SendInput {RButton Up}

        anim_skip()
    }
return

; Rapid fire
~LButton & RButton::
    while GetKeyState("LButton", "P") and GetKeyState("RButton", "P")
    {
        call_shot()
        sleep 10
    }
return

; Skill spam
*F1::
    Gui, Show, x%g_width% y%g_height% NoActivate

    SendInput {5}
    ; sleep 1
    ; SendInput {5}

    speed_timer := 0
    SendInput {2 down}
    sleep, 100

    SetTimer, UpdateSpeed, -10
    SetTimer, UpdateSpeed, 1000

    eclipse_timer := 0
    sleep 350
    SendInput {4}

    SetTimer, UpdateEclipse, -10
    SetTimer, UpdateEclipse, 1000
    
    sleep 2000
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               Timers                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

~*2::
    Gui, Show, x%g_width% y%g_height% NoActivate
    speed_timer := 0
    SetTimer, UpdateSpeed, -10
    SetTimer, UpdateSpeed, 1000
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

    GuiControl,, Eclipse, %time_display%
return

UpdateSpeed:
    speed_timer++
    time_display := g_speed_dur - speed_timer

    if (time_display=0)
        SetTimer, UpdateSpeed, off ; stops the counter

    GuiControl,, Speed, %time_display%
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                Misc                 ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
*insert::reload
*del::exitapp

#IfWinActive, Warframe 
{
    *c::
        SendInput {5} ; Energy pad
        SendInput {2} ; 2 Volt skill
        SendInput {c} ; Arch bind
    return
}