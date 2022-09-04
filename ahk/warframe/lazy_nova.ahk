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
g_offset := gr_presets.lady.offset
g_ping := gr_presets.lady.ping

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                 GUI                 ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; A_ScreenWidt
; A_ScreenHeight

g_width := 20
g_height := A_ScreenHeight - Ceil(A_ScreenHeight / 8)

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
*XButton2::
    Gui, Show, x%g_width% y%g_height% NoActivate
    anti_desync(g_offset)
    Gui, Cancel
return

*F5::
    energy_drain()
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                Misc                 ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
*insert::reload
*del::exitapp