﻿SetWorkingDir %A_ScriptDir%  
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
;;                Funcs                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; TODO: fix throw algorithm
zaw_air_heavy_attack() 
{
    SendInput {RButton down}
    sleep 1

    SendInput {s down}
        sleep 1
        SendInput {CtrlDown}
            sleep 10
            SendInput {MButton}
        SendInput {CtrlUp}
    SendInput {s up}

    SendInput {RButton up}

    return
}

console_hack()
{
    SendInput {x}
    sleep 30
    SendInput {y}

    return
}

back_to_frame()
{
    SendInput {LButton}
    sleep 0
    SendInput {e}
    sleep 10
    SendInput {-}
    sleep 1
    SendInput {-}

    return
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               Hotkeys               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Zaw heavy attack ( IN_AIR )
XButton2::
^XButton2::
    zaw_air_heavy_attack()
return

; Console hack
*x::
    console_hack()
return

; Madurai + 4 skill
Numpad0::
NumpadIns::
    SendInput {XButton1}
    sleep 300

    SendInput {CtrlDown}
        sleep 200
        SendInput {Space}
        sleep 100
        SendInput {Space}
        sleep 100
        SendInput {Space}
        sleep 100
        SendInput {Space}
        sleep 300
    SendInput {CtrlUp}

    SendInput {2}
    sleep 300

    SendInput {e}
    sleep 200

    SendInput {4}
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                Misc                 ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
*insert::reload
*del::exitapp