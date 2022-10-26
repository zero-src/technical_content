#NoEnv
SetWorkingDir %A_ScriptDir%  
#SingleInstance Force
#Persistent
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

global g_cooldown := gr_presets.lady.offset
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
; gui, desync_bg: Add, Progress, w29 h47 c839DD5 Background141414 vMyProgress, 0
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

; ping_text: ping
; height := g_positions.ping.h
; width := g_positions.ping.w

; gui, ping_text: +AlwaysOnTop -Caption +LastFound -SysMenu +ToolWindow -DPIScale +E0x20
; gui, ping_text: Font, s10 DRAFT_QUALITY, Smallest Pixel-7
; gui, ping_text: Add, Text, vping_text cCACACA, _ping__
; gui, ping_text: Color, 141414
; gui, ping_text: Show, x%width% y%height% NoActivate
; WinSet, TransColor, 141414

; GuiControl, ping_text:, ping_text, %g_ping% ms
return


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

clamp(num, min, max) 
{
    return num > 700 ? 700 : num < 0 ? 0 : num
}

auto_ppr:
    ; delay := 695 - clamp(g_ping, 0, 695)
    ; sleep_time := round( delay / 25 )

    ; counter := 100
    ; set_slider("lc_slider", counter)

    ; loop, 25 {
    ;     counter -= 4
    ;     set_slider("lc_slider", counter)
    ;     sleep sleep_time 
    ; }
    
    
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;              Keybinds               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
*XButton2::
    gosub auto_ppr
return

*F5::
    gosub energy_drain
return

; *Up::
;     g_ping += 5
;     g_ping := clamp(g_ping, 0, 700)

;     GuiControl, ping_text:, ping_text, %g_ping% ms
; return

; *Down::
;     g_ping -= 5
;     g_ping := clamp(g_ping, 0, 700)

;     GuiControl, ping_text:, ping_text, %g_ping% ms
; return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                Misc                 ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
*insert::reload
*del::exitapp