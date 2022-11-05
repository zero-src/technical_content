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

global gr_presets := {JustMeeeee: {offset: 15615, ping: 40}
                , Agegon: {offset: 15620, ping: 25}
                , Falco: {offset: 15686, ping: 35}
                , lady: {offset: 14998, ping: 0}
                , desort: {offset: 15690, ping: 105}}


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;              Globals                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

global g_cooldown := gr_presets.Falco.offset
; global g_ping := gr_presets.desort.ping

start_pos := [20, A_ScreenHeight - Ceil(A_ScreenHeight / 8)]
global g_positions := {bg: {w: start_pos[1]+14, h: start_pos[2]+10}
                        , txt: {w: start_pos[1]+1, h: start_pos[2]}
                        , bar: {w: start_pos[1]+14, h: start_pos[2]+34}
                        , ping: {w: start_pos[1]+6, h: start_pos[2]+45}}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                 GUI                 ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; desync_bg: background
height := g_positions.bg.h
width := g_positions.bg.w

gui, desync_bg: +AlwaysOnTop -Caption +LastFound -SysMenu +ToolWindow -DPIScale +E0x20
gui, desync_bg: Add, Progress, w29 h29 c839DD5 Background141414 vMyProgress, 0
gui, desync_bg: Color, 141414
gui, desync_bg: Show, x%width% y%height% NoActivate
WinSet, Transparent, 180


; desync: indicator text
height := g_positions.txt.h
width := g_positions.txt.w

gui, desync: +AlwaysOnTop -Caption +LastFound -SysMenu +ToolWindow -DPIScale +E0x20
gui, desync: Font, s17 bold  PROOF_QUALITY, Verdana
gui, desync: Add, Text, cCACACA, LC
gui, desync: Color, 141414
gui, desync: Show, x%width% y%height% NoActivate
WinSet, TransColor, 141414


; lc_slider: ppr cooldown
height := g_positions.bar.h
width := g_positions.bar.w

gui, lc_slider: +AlwaysOnTop -Caption +LastFound -SysMenu +ToolWindow -DPIScale +E0x20
gui, lc_slider: Add, Progress, w29 h7 c839DD5 Background252525 vlc_slider, 0 ; 839DD5-blue EA254E-red
gui, lc_slider: Color, 141414
gui, lc_slider: Show, x%width% y%height% NoActivate
WinSet, TransColor, 141414

return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               Labels                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
lc_timer:
    loop, 25 {
        inc_slider("lc_slider", 4)
        sleep sleep_time 
    }
return

set_slider(name, value)
{
    GuiControl, %name%:, %name%, %value%
    return
}

inc_slider(name, value)
{
    GuiControl, %name%:, %name%, +%value%
    return
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;              Methods                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
call_raplak:
    SendInput {LButton}
return

call_propa:
    SendInput {MButton}
return

call_ppr:
    sleep 0
    gosub call_propa
    sleep 1090
    gosub call_propa
    sleep 525
    gosub call_raplak
return

auto_ppr:
    loop, 5 {
         sleep_time := round( g_cooldown / 25 )
        set_slider("lc_slider", 0)

        gosub call_ppr

        if (A_Index != 5)
        {
            gosub lc_timer

            settimer, lc_timer, %g_cooldown%
            settimer, lc_timer, Off
        }
    }
return

energy_drain:
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

mouse_move(x, y)
{
    DllCall("mouse_event", uint, 1, int, x, int, y, uint, 0, int, 0)
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

; 1 spot
cr_water()
{
    mouse_move(198, -127)
    sleep 70

    SendInput {3}
    sleep 50

    mouse_move(-1417, 185)
    sleep 300
    SendInput {XButton1}

    sleep 200
    SendInput {1}

    return
}

; 2 spot
cl_water()
{
    mouse_move(-209, -110)
    sleep 70

    SendInput {3}
    sleep 50

    mouse_move(1308, 110)
    sleep 300
    SendInput {XButton1}

    sleep 200
    SendInput {1}

    return
}

; 3 spot
md_water()
{
    mouse_move(78, -111)
    sleep 70

    SendInput {3}
    sleep 50

    mouse_move(-1273, 104)
    sleep 300
    SendInput {XButton1}

    sleep 200
    SendInput {1}

    return
}

; 4 spot
lg_water()
{
    mouse_move(-111, -146)
    sleep 70

    SendInput {3}
    sleep 50

    mouse_move(-1497, 332)

    SendInput {RButton Down}
    sleep 300
    SendInput {RButton Up}
    sleep 50

    SendInput {XButton1}

    sleep 200
    SendInput {1}

    return
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               Hotkeys               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Anti-desync
*XButton2::
    gosub auto_ppr
return

; Energy drain
*F5::
    gosub energy_drain
return

; 1 spot
*Numpad1::
*NumpadEnd::
    cr_water()
return

; 2 spot
*Numpad2::
*NumpadDown::
    cl_water()
return

; 3 spot
*Numpad3::
*NumpadPgdn::
    md_water()
return

; 4 spot
*Numpad4::
*NumpadLeft::
    lg_water()
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                Misc                 ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
*insert::reload
*del::exitapp