if [ ! -d fzf ]; then
    git clone https://github.com/junegunn/fzf.git
    ret_code=$?
    if [ $ret_code -ne 0 ]; then
        echo "Failed to clone fzf repository. Exiting..."
        exit $ret_code
    fi
fi

cd fzf

# Use if cannot install to bin directory
# make

# Otherwise, install to bin directory
sudo make install
ret_code=$?
if [ $ret_code -ne 0 ]; then
    echo "Failed to install fzf. Exiting..."
    exit $ret_code
fi

sudo cp bin/fzf /usr/local/bin
