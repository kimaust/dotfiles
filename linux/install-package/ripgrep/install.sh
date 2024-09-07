if [ ! -d ripgrep ]; then
    git clone https://github.com/BurntSushi/ripgrep
    ret_code=$?
    if [ $ret_code -ne 0 ]; then
        echo "Failed to clone ripgrep"
        return $ret_code
    fi
fi

cd ripgrep

cargo build --release
ret_code=$?
if [ $ret_code -ne 0 ]; then
    echo "Failed to build ripgrep"
    return $ret_code
fi

cd target/release
sudo cp rg /usr/local/bin
