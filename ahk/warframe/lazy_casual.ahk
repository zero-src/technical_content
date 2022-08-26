#NoEnv
#MaxHotkeysPerInterval 99000000
#HotkeyInterval 99000000
#KeyHistory 0
ListLines Off
Process, Priority, , A
SetBatchLines, -1
SetKeyDelay, -1, -1
SetMouseDelay, -1
SetDefaultMouseSpeed, 0
SetWinDelay, -1
SetControlDelay, -1
SendMode Input

zaw_air_heavy_attack() 
{
    send {s down}
        sleep 1
        send {CtrlDown}
            sleep 50
            click, middle
        send {CtrlUp}
    send {s up}

    return
}

XButton2::
^XButton2::
    zaw_air_heavy_attack()
return

; Misc Keybinds
insert::reload
^insert::reload
^del::exitapp
del::exitapp