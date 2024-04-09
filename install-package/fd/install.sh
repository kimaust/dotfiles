if [ ! -d fd ]; then
    git clone https://github.com/sharkdp/fd.git
    ret_code=$?
    if [ $ret_code -ne 0 ]; then
        echo "Failed to clone fd"
        exit $ret_code
    fi
fi

cd fd

cargo install fd-find
ret_code=$?
if [ $ret_code -ne 0 ]; then
    echo "Failed to install fd"
    exit $ret_code
fi

sudo cp "$HOME"/.cargo/bin/fd /usr/local/bin
