mkdir -p /usr/local/bin
echo "Un-comment MSYS2_PATH_TYPE=inherit if you want Windows environment variable to be inherited."

# TODO: Automate installing essential packages.
pip install neovim

echo "Un-comment MSYS winsymlink in the msys2_shell.cmd file if you want to use Windows symlinks. You also need to turn on windows developer mode to create native symlink without admin permission"
