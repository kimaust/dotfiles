#Requires AutoHotkey v2.0

#SingleInstance Force

!+Enter::
{
    terminal := "alacritty.exe"
    alacrittyPath := "C:\Program Files\Alacritty\" . terminal
    alacrittyConfigPath := "C:\msys64\home\k\dotfiles\alacritty\alacritty.toml"

    pid := 0
    Run(alacrittyPath . " --config-file=" . alacrittyConfigPath, "", "", &pid)
    ActivateWindowUntilActive(pid)
}

ActivateWindowUntilActive(pid) {
    WinWait("ahk_pid " pid, , 3)  ; Waits for the window to exist

    ; Seems to require 500ms delay before activation.
    Sleep(500)
    WinActivate("ahk_pid " pid)
}
