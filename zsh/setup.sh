# May need administrator permission.
export MSYS=winsymlinks:nativestrict
cp ./antigen.zsh "$HOME/antigen.zsh"
ln -s "$PWD/.zshrc" "$HOME/.zshrc"
