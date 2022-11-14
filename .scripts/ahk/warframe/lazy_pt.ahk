SetWorkingDir %A_ScriptDir%  
#MaxHotkeysPerInterval 200
#SingleInstance Force
#Persistent
#NoEnv
#InstallKeybdHook
#InstallMouseHook
ListLines off
SetBatchLines -1
SetKeyDelay, -1, -1
SetMouseDelay, -1, -1
SetControlDelay -1
SetWinDelay -1
SendMode Input

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               Globals               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Game Settings
fps         = 300 			
meleeKey    = e 
switchKey   = f			
jumpKey     = Space
shootKey    = LButton 		
aimKey      = RButton
crouchKey   = Ctrl
operatorKey = XButton1

; Macro binds
ThrowMeleeKey  = XButton2 		
VasarinDashKey = q

; Do not touch this
sleepTime := 2000/fps
#IfWinActive ahk_exe Warframe.x64.exe
Hotkey, IfWinActive, ahk_exe Warframe.x64.exe

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               Hotkeys               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Hotkey, *%ThrowMeleeKey%, ThrowMelee
Hotkey, *%VasarinDashKey%, VasarinDash

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                 GUI                 ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
g_width := A_ScreenWidth * 0.008
g_height := A_ScreenHeight * 0.86

g_speed_dur := 20
g_eclipse_dur := 42

; bg
gui, desync_bg: +AlwaysOnTop -Caption +LastFound -SysMenu +ToolWindow -DPIScale +E0x20
gui, desync_bg: Add, Progress, w30 h60 c839DD5 Background141414 vMyProgress, 0
gui, desync_bg: Color, 151515
gui, desync_bg: Show, x%g_width% y%g_height% NoActivate
WinSet, Transparent, 180

; dur
Gui +AlwaysOnTop -Caption +LastFound -SysMenu +ToolWindow -DPIScale +E0x20
Gui, Color, 000000
Gui, Font, s13 DRAFT_QUALITY, JetBrains Mono Medium
Gui, Add, Text, x15 y5 vShock cYellow, xx
Gui, Add, Text, x15 y25 vEclipse cWhite, xx
WinSet, TransColor, 000000
Gui, Show, x%g_width% y%g_height% NoActivate

; name
gui, ping_text: +AlwaysOnTop -Caption +LastFound -SysMenu +ToolWindow -DPIScale +E0x20
gui, ping_text: Font, s10 DRAFT_QUALITY, Smallest Pixel-7
gui, ping_text: Add, Text, x3 y45 vping_text0 cCACACA, ---------
gui, ping_text: Add, Text, x12 y55 vping_text1 cCACACA, _PT_
gui, ping_text: Color, 141414
gui, ping_text: Show, x%g_width% y%g_height% NoActivate
WinSet, TransColor, 141414
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               Hotkeys               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Vasarin dash
VasarinDash:
    voidTime := sleepTime * 15
    SendInput {Blind}{%operatorKey%}

    SendInput {Blind}{%aimKey%}
    Sleep %sleepTime%
    SendInput {Blind}{%aimKey%}

    Sleep %voidTime%

    SendInput {Blind}{%crouchKey% Down}
        Sleep %voidTime%
        SendInput {Blind}{S Down}
            Sleep %sleepTime%
            SendInput {Blind}{%jumpKey%}
            Sleep %sleepTime%
        SendInput {Blind}{S Up}
        Sleep %sleepTime%
    SendInput {Blind}{%crouchKey% Up}

    Sleep %sleepTime%
    SendInput {Blind}{%aimKey%}
    Sleep %sleepTime%

    SendInput {Blind}{%operatorKey%}
return

; Zaw air attack
ThrowMelee:
	SendInput {Blind}{%jumpKey%}
	Sleep, %sleepTime%
	SendInput {Blind}{%jumpKey%}
	Sleep, %sleepTime%
	SendInput {Blind}{%aimKey% Down}
	Sleep, %sleepTime%
	SendInput {Blind}{%meleeKey%}
	Sleep, %sleepTime%
	SendInput {Blind}{%aimKey% Up}
	Sleep, 480
return

; Broken
; PhaseHelper:
; while GetKeyState("XButton2", "P")
; {
;     Sleep, %sleepTime%

;     gosub ThrowMelee
;     Sleep 316

;     SendInput {Blind}{%shootKey%}
;     Sleep 250 ; zenith shot delay
;     SendInput {Blind}{%shootKey%}
;     Sleep, %sleepTime%

;     SendInput {Blind}{%switchKey%}
;     Sleep 316

;     SendInput {Blind}{%shootKey% Down}
;     Sleep 350
;     SendInput {Blind}{%shootKey% Up}
;     Sleep, %sleepTime%

;     SendInput {Blind}{%switchKey%}
;     Sleep 316

;     Sleep, %sleepTime%
; }
; return

; Archwing
*c::
    SendInput {2} ; 2 Volt skill
    SendInput {c} ; Arch bind
return

; Rapid fire
*LButton::
    while GetKeyState("LButton", "P")
    {
        SendInput {Blind}{%shootKey%}
        Sleep %sleepTime%
    }
return

; Skill spam
*F1::
    Gui, Show, x%g_width% y%g_height% NoActivate

    SendInput {Blind}{5}

    speed_timer := 0
    SendInput {Blind}{2 down}
    sleep, 100

    SetTimer, UpdateSpeed, -10
    SetTimer, UpdateSpeed, 1000

    eclipse_timer := 0
    sleep 350
    SendInput {Blind}{4}

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
    timeDisplay := g_eclipse_dur - eclipse_timer

    if (timeDisplay=0)
    {
        SetTimer, UpdateEclipse, off ; stops the counter
        GuiControl,, Eclipse, xx
        return
    }

    GuiControl,, Eclipse, %timeDisplay%
return

UpdateSpeed:
    speed_timer++
    timeDisplay := g_speed_dur - speed_timer

    if (timeDisplay=0)
    {
        SetTimer, UpdateSpeed, off ; stops the counter
        GuiControl,, Speed, xx
        return
    }

    GuiControl,, Speed, %timeDisplay%
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                Misc                 ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
#IfWinActive
*Insert::reload
*Del::exitapp

*F11::
    suspend, toggle
    state := A_IsSuspended ? "PAUSE" : "_PT_"
    GuiControl, ping_text:, ping_text1, %state%
return