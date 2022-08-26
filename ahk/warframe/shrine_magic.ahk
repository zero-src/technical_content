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

width := A_ScreenWidth / 2 - 100
height := A_ScreenHeight / 2 + 30

cache := []
cache_cnt := 0
history := ""

propasToZimbabwe() 
{
    ; Mid portal
    click, middle
    sleep 5 ; extra delay

    ; CL portal
    DllCall("mouse_event", uint, 1, int, -360, int, 0, uint, 0, int, 0)
    send {1} ; madurai ability
    sleep, 800 ; madurai anim is OG
    click, middle   

    ; CR portal
    DllCall("mouse_event", uint, 1, int, 770, int, 0, uint, 0, int, 0)
    sleep, 526 ; delay for early propa
    click, middle

    ; Ghetto prediction for "long" spot
    sleep 10
    DllCall("mouse_event", uint, 1, int, 1639, int, 291, uint, 0, int, 0)

    return
}

back_to_frame()
{
    SendInput {e}
    sleep 1
    SendInput {-}
    sleep 2

    return
}

unstuck(air_time) {
    send {t}
    sleep 6 ; chat can not be opened instant

    sendInput, /unstuck
    sleep, 1

    send {Enter}
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

NumpadDel::
    cache_cnt := cache_cnt + 1

    MouseGetPos, StartX, StartY
    cache.insert([StartX, StartY])

    if cache_cnt <= 1 
        history := StartX "x" StartY "  |  start"
    else {
        delta_x := cache[cache_cnt][1] - cache[cache_cnt-1][1]
        delta_y := cache[cache_cnt][2] - cache[cache_cnt-1][2]

        history := history "`n" cache[cache_cnt][1] "x" cache[cache_cnt][2] "  |  " delta_x " x " delta_y
    }

    Progress, m b1 fs10 w200 ZH WM x%width% y%height%, %history%
return

Numpad9::
NumpadPgup::
    Progress, off
    cache := []
    cache_cnt := 0
    history := ""
return

; Misc Keybinds
home::reload
^home::reload
^end::exitapp
end::exitapp