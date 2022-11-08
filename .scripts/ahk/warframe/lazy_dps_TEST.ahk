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
fps             = 200		
meleeKey        = e
switchKey       = f
hackKey         = y
useKey          = x
emoteKey        = -
jumpKey         = Space
shiftKey        = Shift
shootKey        = LButton
propaKey        = MButton
aimKey          = RButton
crouchKey       = Ctrl
operatorKey     = XButton1
energyPadKey    = 5

; Macro binds
CastVoltSkillsKey   = F1
ConsoleHackKey      = XButton2
EnergyDrainKey      = F5
TravelToCrKey1      = NumpadIns
TravelToCrKey2      = Numpad0
PPPRZenithKey       = F4
RapidFireKey        = ~LButton & RButton

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
Hotkey, *%TravelToCrKey1%, TravelToCr 
Hotkey, *%TravelToCrKey2%, TravelToCr
Hotkey, *%PPPRZenithKey%, PPPRZenith
Hotkey, %RapidFireKey%, RapidFire

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                 GUI                 ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
g_width := A_ScreenWidth * 0.008
g_height := A_ScreenHeight * 0.86

g_shock_dur := 100
g_eclipse_dur := 62

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
Gui, Add, Text, x15 y5 vShock cYellow, 00
Gui, Add, Text, x15 y25 vEclipse cWhite, 00
WinSet, TransColor, 000000
Gui, Show, x%g_width% y%g_height% NoActivate

; name
gui, ping_text: +AlwaysOnTop -Caption +LastFound -SysMenu +ToolWindow -DPIScale +E0x20
gui, ping_text: Font, s10 DRAFT_QUALITY, Smallest Pixel-7
gui, ping_text: Add, Text, x3 y45 vping_text0 cCACACA, ---------
gui, ping_text: Add, Text, x9 y55 vping_text1 cCACACA, _DPS_
gui, ping_text: Color, 141414
gui, ping_text: Show, x%g_width% y%g_height% NoActivate
WinSet, TransColor, 141414
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                Funcs                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
MouseMove(move_x, move_y) 
{
    DllCall("mouse_event", uint, 1, int, move_x, int, move_y, uint, 0, int, 0)
    return
}

; TODO: rework "Rapid Fire" bind system
RapidFire:
    while GetKeyState("LButton", "P") and GetKeyState("RButton", "P")
    {
        SendInput, {Blind}{%shootKey%}
        Sleep, %sleepTime%
    }
return

TravelToCr:
    SendInput, {Blind}{%jumpKey% Down}
        Sleep, 150
    SendInput, {Blind}{%jumpKey% Up}

    Sleep, 110 ; stagger delay
    SendInput, {Blind}{%shiftKey%}
    Sleep, 15 ; stagger delay
    
    MouseMove(-1496, 485) ; aim on loc-pin

    SendInput, {Blind}{%switchKey%}
    Sleep, 316 ; delay before weapon switch
    SendInput, {Blind}{%switchKey%}

    Sleep, 290

    loop % 40
    {
        SendInput, {Blind}{%shootKey%}
        Sleep, %safeSleepTime%
    }
return

ConsoleHack:
    SendInput, {Blind}{%aimKey% Down}
        Sleep, %safeSleepTime%
            SendInput, {Blind}{%shiftKey%}
        Sleep, %safeSleepTime%
    SendInput, {Blind}{%aimKey% Up}

    sleep 65 ; blink time

    loop, 3
    {
        SendInput, {Blind}{%useKey%}
        Sleep, %safeSleepTime%
        SendInput, {Blind}{%hackKey%}
        Sleep, %safeSleepTime%
    }
return

PPPRZenith:
    SendInput, {Blind}{%propaKey%}
    Sleep, 525
    SendInput, {Blind}{%propaKey%}
    Sleep, 550
    SendInput, {Blind}{%propaKey%}
    Sleep, 545

    SendInput, {Blind}{%shootKey%} ; raplak
    Sleep, 0

    SendInput, {Blind}{%meleeKey%} ; melee
    Sleep, %sleepTime%
    SendInput, {Blind}{%emoteKey%} ; agree emote
    Sleep, 1
    SendInput, {Blind}{%emoteKey%} ; agree emote

    SendInput, {Blind}{%aimKey% Down}
    loop, 30
    {
        SendInput, {Blind}{%shootKey%}
        Sleep, %safeSleepTime%
    }
    SendInput, {Blind}{%aimKey% Up}
return

EnergyDrain:
    SendInput, {Blind}{%shiftKey% Down}
    Loop, 20
    {
        SendInput, {Blind}{%jumpKey%}
        SendInput, {Blind}{%shootKey%}
        Sleep, 1
    }
    SendInput, {Blind}{%shiftKey% Up}
return

CastVoltSkills:
    Gui, Show, x%g_width% y%g_height% NoActivate

    SendInput, {Blind}{%energyPadKey%}
    Sleep, %sleepTime%

    shockTimer := 0
    SendInput, {Blind}{1 Down}
        sleep 450 ; cast delay (+25% cast speed)
    SendInput, {Blind}{1 Up}

    SetTimer, UpdateShock, -10
    SetTimer, UpdateShock, 1000

    eclipseTimer := 0
    sleep 350
    SendInput, {Blind}{4}

    SetTimer, UpdateEclipse, -10
    SetTimer, UpdateEclipse, 1000
    
    sleep 2000
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               Timers                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

~*1::
    Gui, Show, x%g_width% y%g_height% NoActivate
    shockTimer := 0

    SetTimer, UpdateShock, -10
    SetTimer, UpdateShock, 1000
return

~*4::
    Gui, Show, x%g_width% y%g_height% NoActivate
    eclipseTimer := 0

    SetTimer, UpdateEclipse, -10
    SetTimer, UpdateEclipse, 1000
return

UpdateEclipse:
    eclipseTimer++
    timeDisplay := g_eclipse_dur - eclipseTimer

    if (timeDisplay=0)
    {
        SetTimer, UpdateEclipse, off ; stops the counter
        GuiControl,, Eclipse, 00
        return
    }

    GuiControl,, Eclipse, %timeDisplay%
return

UpdateShock:
    shockTimer++
    timeDisplay := g_shock_dur - shockTimer

    if (timeDisplay=0)
    {
        SetTimer, UpdateEclipse, off ; stops the counter
        GuiControl,, Shock, 00
        return
    }

    GuiControl,, Shock, %timeDisplay%
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                Misc                 ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
#IfWinActive
*insert::reload
*f11::suspend, toggle
*del::exitapp
