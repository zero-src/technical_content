;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;              OUTDATED               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



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
;;                 DB                  ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
gr_presets := {JustMeeeee: {offset: 15615, ping: 40}
                , Agegon: {offset: 15620, ping: 23}
                , Falco: {offset: 15686, ping: 35}
                , lady: {offset: 15610, ping: 15}}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;              Globals                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
g_offset := gr_presets.Falco.offset
g_ping := gr_presets.Falco.ping

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                 GUI                 ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
g_width := A_ScreenWidth * 0.008
g_height := A_ScreenHeight * 0.86

Gui +AlwaysOnTop +LastFound +Toolwindow -Caption
Gui, Color, 000000
Gui, Font, s19 bold, Verdana
Gui, Add, Text, vDesync cGreen, LC 
WinSet, TransColor, 000000
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;      Propa snd Raplak keybinds      ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
send_propa() 
{
    SendInput {MButton}
    return 
}

send_raplak() 
{
    SendInput {LButton}
    return 
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;              Main area              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
call_shot() {
    SendInput {LButton}
    sleep 1
    return
}

call_ppr()
{
    send_propa()
    Sleep 1100
    send_propa()
    Sleep 525
    send_raplak()

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

kantik_rapidfire(loops)
{
    loop % loops
    {
        send_raplak()
        sleep 20
        SendInput {-}
        sleep 1
        SendInput {-}
        sleep 10
    }
    return
}

rapid_fire(ms) 
{
    loop % ms
    {
        SendInput {LButton}
        sleep 1
    }
    return
}

anti_desync(downtime) 
{
    loop, 5
    {
        call_ppr()

        if (A_Index != 5)
            sleep downtime
    }
    return
}

energy_drain()
{
    SendInput {2}
    SendInput {Shift down}
    Loop, 15
    {
        SendInput {Space}
        SendInput {LButton}
        Sleep 1
    }
    SendInput {Shift up}

    return
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               Hotkeys               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Anti-desync
*XButton2::
    Gui, Show, x%g_width% y%g_height% NoActivate
    anti_desync(g_offset)
    Gui, Cancel
return

; Rapid fire
~LButton & RButton::
    while GetKeyState("LButton", "P") and GetKeyState("RButton", "P")
    {
        call_shot()
        sleep 1
    }
return

; Energy drain
*F5::
    energy_drain()
return

; Travel to 1st spot air pin
Numpad0::
NumpadIns::
    SendInput {Space Down}
        sleep 200
    SendInput {Space Up}

    sleep 5
    DllCall("mouse_event", uint, 1, int, -36, int, 140, uint, 0, int, 0)

    sleep 1000
return

; CR SPOT :c
*Numpad1::
*NumpadEnd::
    DllCall("mouse_event", uint, 1, int, 100, int, -202, uint, 0, int, 0)
    sleep 10

    SendInput {Shift}
    sleep 8

    SendInput {e}
    sleep 1
    SendInput {XButton1}
    
    DllCall("mouse_event", uint, 1, int, -1456, int, 92, uint, 0, int, 0)
    sleep 100

    SendInput {1}
    SendInput {1}
    sleep 700

    kantik_rapidfire(5)
    sleep 180

    back_to_frame()
    DllCall("mouse_event", uint, 1, int, 10, int, -25, uint, 0, int, 0)
    rapid_fire(50)
return

; Kantik rapidfire
*F7::
    while GetKeyState("F7", "P")
    {
        send_raplak()
        sleep 20
        SendInput {-}
        sleep 1
        SendInput {-}
        sleep 10
    }
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