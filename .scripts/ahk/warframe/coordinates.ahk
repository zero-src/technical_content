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
;;              Globals                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
width := A_ScreenWidth / 2 - 100
height := A_ScreenHeight / 2 + 30

cache := []
cache_cnt := 0
history := ""

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               Hotkeys               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Create point
*NumpadDel::
*NumpadDot::
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

; Clear history
*Numpad9::
*NumpadPgup::
    Progress, off
    cache := []
    cache_cnt := 0
    history := ""
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                Misc                 ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
*home::reload
*end::exitapp