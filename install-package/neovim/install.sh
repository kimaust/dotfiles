if [ ! -d neovim ]; then
    git clone https://github.com/neovim/neovim
    ret_code=$?
    if [ $ret_code -ne 0 ]; then
        echo "Failed to clone neovim"
        return $ret_code
    fi
fi

cd neovim

cmake -S cmake.deps -B .deps -G Ninja -D CMAKE_BUILD_TYPE=RelWithDebInfo
cmake --build .deps
cmake -B build -G Ninja -D CMAKE_BUILD_TYPE=RelWithDebInfo
cmake --build build
    
