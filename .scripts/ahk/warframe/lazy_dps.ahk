﻿SetWorkingDir %A_ScriptDir%  
#MaxHotkeysPerInterval 200
#SingleInstance Force
#Persistent
#NoEnv
#InstallKeybdHook
#InstallMouseHook
SetNumLockState AlwaysOn
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
fps             = 200
shootKey        = LButton
propaKey        = MButton
aimKey          = RButton
meleeKey        = e
switchKey       = f
jumpKey         = Space
shiftKey        = Shift
crouchKey       = Ctrl
operatorKey     = XButton1
archwingKey     = c
energyPadKey    = 5
useKey          = x
hackKey         = y
emoteKey        = -

; Macro binds
CastVoltSkillsKey   = F1
ConsoleHackKey      = XButton2
EnergyDrainKey      = F5
TravelToCrKey       = Numpad0
PPPRZenithKey       = F3
PropaZenithKey      = F4
RapidFireKey        = ~LButton & RButton ; visit 111 line to change bind there
FasterArchwingKey   = c
ShrineTimeManipKey  = NumpadAdd


; Do not touch this
sleepTime := 2000/fps
safeSleepTime := 1000/fps

#IfWinActive ahk_exe Warframe.x64.exe
Hotkey, IfWinActive, ahk_exe Warframe.x64.exe

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               Hotkeys               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Hotkey, *%CastVoltSkillsKey%, CastVoltSkills
Hotkey, *%ConsoleHackKey%, ConsoleHack
Hotkey, *%EnergyDrainKey%, EnergyDrain
Hotkey, *%PropaZenithKey%, PropaZenith
Hotkey, *%TravelToCrKey%, TravelToCr
Hotkey, *%PPPRZenithKey%, PPPRZenith
Hotkey, %RapidFireKey%, RapidFire 
Hotkey, *%FasterArchwingKey%, FasterArchwing 
Hotkey, *%ShrineTimeManipKey%, ShrineTimeManip 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                 GUI                 ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
global g_pos_x := A_ScreenWidth * 0.008
global g_pos_y := A_ScreenHeight * 0.86
global g_width := 50

g_shock_dur := 100
g_eclipse_dur := 62

; GUI background
Gui, desync_bg:+AlwaysOnTop -Caption +LastFound -SysMenu +ToolWindow -DPIScale +E0x20
Gui, desync_bg:Add, Progress, w30 h60 c839DD5 Background141414 vMyBackground, 0
Gui, desync_bg:Color, 151515
Gui, desync_bg:Show, x%g_pos_x% y%g_pos_y% NoActivate
WinSet, Transparent, 180

; Skill duration gui
Gui +AlwaysOnTop -Caption +LastFound -SysMenu +ToolWindow -DPIScale +E0x20
Gui, Color, 000000
Gui, Font, s13 CLEARTYPE_QUALITY, JetBrains Mono Medium
Gui, Add, Text, Center x1 y5 w%g_width% vShock cYellow, xx
Gui, Add, Text, Center x1 y25 w%g_width% vEclipse cWhite, xx
Gui, Show, x%g_pos_x% y%g_pos_y% w%g_width% NoActivate
WinSet, TransColor, 000000

; Script name
Gui, ping_text:+AlwaysOnTop -Caption +LastFound -SysMenu +ToolWindow -DPIScale +E0x20
Gui, ping_text:Font, s10 CLEARTYPE_QUALITY, Smallest Pixel-7
Gui, ping_text:Add, Text, Center x1 y45 w%g_width% vping_text0 cCACACA, ---------
Gui, ping_text:Add, Text, Center x2 y55 w%g_width% vping_text1 cCACACA, _DPS_
Gui, ping_text:Show, x%g_pos_x% y%g_pos_y% w%g_width% NoActivate
Gui, ping_text:Color, 141414
WinSet, TransColor, 141414

; ShrineTimeManip
shrine_manip_y := g_pos_y - 21
Gui, shrine_manip:+AlwaysOnTop -Caption +LastFound -SysMenu +ToolWindow -DPIScale +E0x20
Gui, shrine_manip:Font, s10 CLEARTYPE_QUALITY, Smallest Pixel-7
Gui, shrine_manip:Add, Text, Center x1 y14 w%g_width% vshrine_timer0 cCACACA, ---------
Gui, shrine_manip:Font, s10 CLEARTYPE_QUALITY, JetBrains Mono Medium
Gui, shrine_manip:Add, Text, Center x1 y2 w%g_width% vshrine_timer1 cfa6b79, xx
Gui, shrine_manip:Color, 141414 ;fa6472
WinSet, TransColor, 141414

; Do not touch this
SystemTime()
{
    freq := 0, tick := 0
    If (!freq)
        DllCall("QueryPerformanceFrequency", "Int64*", freq)
    DllCall("QueryPerformanceCounter", "Int64*", tick)
    Return tick / freq * 1000
}
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                Funcs                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Delay(value)
{
    s_begin_time := SystemTime()
    freq := 0, t_current := 0
    DllCall("QueryPerformanceFrequency", "Int64*", freq)
    s_end_time := (s_begin_time + value) * freq / 1000 
    While, (t_current < s_end_time)
    {
        If (s_end_time - t_current) > 20000
        {
            DllCall("Winmm.dll\timeBeginPeriod", UInt, 1)
            DllCall("Sleep", "UInt", 1)
            DllCall("Winmm.dll\timeEndPeriod", UInt, 1)
            DllCall("QueryPerformanceCounter", "Int64*", t_current)
        }
        Else
            DllCall("QueryPerformanceCounter", "Int64*", t_current)
    }
}

MouseMove(move_x, move_y) 
{
    DllCall("mouse_event", uint, 1, int, move_x, int, move_y, uint, 0, int, 0)
    return
}

; Reworking "Rapid Fire" bind system may cause fps issues
RapidFire:
    while GetKeyState("LButton", "P") and GetKeyState("RButton", "P")
    {
        SendInput, {Blind}{%shootKey%}
        Delay(sleepTime)
    }
return

TravelToCr:
    SendInput, {Blind}{%jumpKey% Down}
        Delay(150)
    SendInput, {Blind}{%jumpKey% Up}

    Delay(110) ; stagger delay
    SendInput, {Blind}{%shiftKey%}
    Delay(15) ; stagger delay
    
    MouseMove(-1496, 475) ; aim on CR loc-pin

    SendInput, {Blind}{%switchKey%}
    Delay(316) ; delay before weapon switch
    SendInput, {Blind}{%switchKey%}
    Delay(290)


    loop % 90
    {
        SendInput, {Blind}{%shootKey%}
        Delay(10)
    }

    MouseMove(241, -96) ; aim to nothing
    SendInput, {Blind}{d Down}
        Delay(500)
    SendInput, {Blind}{d Up}
    MouseMove(-75, 176) ; aim on mid loc-pin

    loop % 90
    {
        SendInput, {Blind}{%shootKey%}
        Delay(10)
    }
return

ConsoleHack:
    SendInput, {Blind}{%aimKey% Down}
        Delay(safeSleepTime)
            SendInput, {Blind}{%shiftKey%}
        Delay(safeSleepTime)
    SendInput, {Blind}{%aimKey% Up}

    Delay(75) ; blink time

    loop, 3
    {
        SendInput, {Blind}{%useKey%}
        Delay(safeSleepTime)
        SendInput, {Blind}{%hackKey%}
        Delay(50)
    }
return

PPPRZenith:
    SendInput, {Blind}{%propaKey%}
    Delay(525)
    SendInput, {Blind}{%propaKey%}
    Delay(550)
    SendInput, {Blind}{%propaKey%}
    Delay(550)

    SendInput, {Blind}{%shootKey%} ; raplak
    Delay(10)

    SendInput, {Blind}{%meleeKey%} ; melee
    Delay(12 + sleepTime)
    SendInput, {Blind}{%emoteKey%} ; agree emote
    Delay(2 + sleepTime)
    SendInput, {Blind}{%emoteKey%} ; agree emote

    SendInput, {Blind}{%aimKey% Down}
    loop, 30
    {
        SendInput, {Blind}{%shootKey%}
        Delay(15)
    }
    SendInput, {Blind}{%aimKey% Up}
return

PropaZenith:
    SendInput, {Blind}{%propaKey%}
    Delay(1560)

    SendInput, {Blind}{%shootKey%} ; raplak
    Delay(5)

    SendInput, {Blind}{%meleeKey%} ; melee
    Delay(12 + sleepTime)
    SendInput, {Blind}{%emoteKey%} ; agree emote
    Delay(2 + sleepTime)
    SendInput, {Blind}{%emoteKey%} ; agree emote

    SendInput, {Blind}{%aimKey% Down}
    loop, 30
    {
        SendInput, {Blind}{%shootKey%}
        Delay(15)
    }
    SendInput, {Blind}{%aimKey% Up}
return

EnergyDrain:
    SendInput, {Blind}{2} ; 2nd madurai ability
    Delay(50)

    SendInput, {Blind}{%shiftKey% Down}
    Loop, 20
    {
        SendInput, {Blind}{%jumpKey%}
        SendInput, {Blind}{%shootKey%}
        Delay(15)
    }
    SendInput, {Blind}{%shiftKey% Up}
return

CastVoltSkills:
    SendInput, {Blind}{%energyPadKey%}
    Delay(sleepTime)

    shockTimer := 0
    SendInput, {Blind}{1 Down}
        Delay(350) ; cast delay (+37.5% cast speed)
    SendInput, {Blind}{1 Up}

    SetTimer, UpdateShock, -10
    SetTimer, UpdateShock, 1000

    eclipseTimer := 0
    Delay(450)

    SendInput, {Blind}{4}

    SetTimer, UpdateEclipse, -10
    SetTimer, UpdateEclipse, 1000
    
    Delay(1000)
return

ShrineTimeManip:
    new_y := g_pos_y - 23

    ShrineTimerf := 0.0
    warp_duration := 20

    Gui, desync_bg:Show, x%g_pos_x% y%new_y% h95 NoActivate
    Gui, shrine_manip:Show, x%g_pos_x% y%shrine_manip_y% w%g_width% NoActivate

    SetTimer, BeforeShrineManip, 100
    Delay(7900) ; afret last limb timer  

    SendInput, {Blind}{PgDn} ; custom bind for 15 fps lock
    ShrineTimer := 0

    SetTimer, ShrineManip, 1000

    Delay(warp_duration * 1000) ; main timer

    Gui, shrine_manip:Hide
    Gui, desync_bg:Show, x%g_pos_x% y%g_pos_y% h72 NoActivate

    SendInput, {Blind}{Up} ; custom bind for fps uncap Background
    Delay(500)
return

FasterArchwing:
    SendInput, {Blind}{%energyPadKey%}
    SendInput, {Blind}{2} ; 2nd volt skill
    SendInput, {Blind}{%archwingKey%}
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               Timers                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
~*1::
    Gui, Show, x%g_pos_x% y%g_pos_y% NoActivate
    shockTimer := 0

    SetTimer, UpdateShock, -10
    SetTimer, UpdateShock, 1000
return

~*4::
    Gui, Show, x%g_pos_x% y%g_pos_y% NoActivate
    eclipseTimer := 0

    SetTimer, UpdateEclipse, -10
    SetTimer, UpdateEclipse, 1000
return

UpdateEclipse:
    eclipseTimer++
    timeDisplay := g_eclipse_dur - eclipseTimer

    if (timeDisplay <= 0)
    {
        SetTimer, UpdateEclipse, off ; stops the counter
        GuiControl,, Eclipse, xx
        return
    }

    GuiControl,, Eclipse, %timeDisplay%
return

UpdateShock:
    shockTimer++
    timeDisplay := g_shock_dur - shockTimer

    if (timeDisplay <= 0)
    {
        SetTimer, UpdateShock, off ; stops the counter
        GuiControl,, Shock, xx
        return
    }

    GuiControl,, Shock, %timeDisplay%
return

BeforeShrineManip:
    ShrineTimerf += 0.1
    timeDisplay := 7.5 - ShrineTimerf
    SetFormat, FloatFast, 0.1

    if (timeDisplay <= 0)
    {
        SetTimer, BeforeShrineManip, off ; stops the counter
        GuiControl, shrine_manip:, shrine_timer1, xx
        return
    }

    GuiControl, shrine_manip:, shrine_timer1, %timeDisplay%
return

ShrineManip:
    ShrineTimer++
    timeDisplay := warp_duration - ShrineTimer

    if (timeDisplay <= 0)
    {
        SetTimer, ShrineManip, off ; stops the counter
        GuiControl, shrine_manip:, shrine_timer1, xx
        return
    }

    GuiControl, shrine_manip:, shrine_timer1, %timeDisplay%
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                Misc                 ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
#IfWinActive
*Insert::reload
*Del::exitapp

*F11::
    suspend, toggle
    state := A_IsSuspended ? "PAUSE" : "_DPS_"
    GuiControl, ping_text:, ping_text1, %state%
return