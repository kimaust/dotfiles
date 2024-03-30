mkdir -p ~/.local/share/fonts
if test -f "FiraCodeNerdFontMono-Regular.ttf"; then
    (cd ~/.local/share/fonts && curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraCode.tar.xz && tar -xf FiraCode.tar.xz)
    rm ~/.local/share/fonts/FiraCode.tar.xz
fi
