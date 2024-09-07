#Requires AutoHotkey v2.0

#SingleInstance Force

!+Enter::
{
    alacrittyPath = "C:\Program Files\Alacritty\alacritty.exe"
    alacrittyConfigPath := "C:\msys64\home\k\dotfiles\alacritty\alacritty.toml"
    Run alacrittyPath . " --config-file=" . alacrittyConfigPath
}
