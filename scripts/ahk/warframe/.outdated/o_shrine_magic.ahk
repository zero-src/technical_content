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
;;                Funcs                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
propasToZimbabwe() 
{
    ; Mid portal
    SendInput {MButton}
    sleep 5 ; extra delay

    ; CL portal
    DllCall("mouse_event", uint, 1, int, -360, int, 0, uint, 0, int, 0)
    SendInput {1} ; madurai ability
    sleep, 800 ; madurai anim is OG
    SendInput {MButton}  

    ; CR portal
    DllCall("mouse_event", uint, 1, int, 770, int, 0, uint, 0, int, 0)
    sleep, 526 ; delay for early propa
    SendInput {MButton}

    ; Ghetto prediction for "long" spot
    sleep 10
    DllCall("mouse_event", uint, 1, int, 1639, int, 291, uint, 0, int, 0)

    return
}

back_to_frame()
{
    sleep 0
    SendInput {e}
    sleep 10
    SendInput {-}
    sleep 0
    SendInput {-}
    sleep 1

    return
}

unstuck(air_time) {
    SendInput {t}
    sleep 6 ; chat can not be opened instant

    sendInput, /unstuck
    sleep, 1

    SendInput {Enter}
    sleep air_time

    return
}

longSpotPropa() {
    SendInput {MButton}
    sleep 50
    back_to_frame()

    return
}

rapidFire(ms) {
    click, down right
    sleep, 5
    loop % ms
    {
        SendInput {LButton}
        sleep 1
    }
    click, up right
    return
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               Hotkeys               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Shoot all portals -> tp to "long" spot
Numpad0::
NumpadIns::
    send {x down}
        propasToZimbabwe()
    send {x up}

    sleep 1 ; extra delay before "/unstuck"
    ;Send {e} ; for safe unstuck (slow)

    unstuck(460) ; 460ms of nothing

    longSpotPropa() ; hope u need only one propa

    rapidFire(90)
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                Misc                 ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
*home::reload
*end::exitapp