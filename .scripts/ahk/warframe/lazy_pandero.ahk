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
global gr_presets := {Pandero: 17220}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;              Globals                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
global g_cooldown := gr_presets.Pandero

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                 GUI                 ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
g_width := A_ScreenWidth * 0.008
g_height := A_ScreenHeight * 0.86

Gui +AlwaysOnTop -Caption +LastFound -SysMenu +ToolWindow -DPIScale +E0x20
Gui, Color, 000000
Gui, Font, s11
Gui, Add, Text, x1 y0 vpandero cGreen, na
WinSet, TransColor, 000000
Gui, Show, x%g_width% y%g_height% NoActivate
GuiControl,, pandero, 
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               Hotkeys               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; pandero timer
~RButton & WheelDown::
    GuiControl,, pandero, ✔️

    loop, 5 {
        SendInput {MButton}

        if (A_Index != 5)
        {
            sleep g_cooldown
        }
    }

    GuiControl,, pandero,
    sleep 2000
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                Misc                 ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
*home::reload
*end::exitapp