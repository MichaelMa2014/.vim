### New machine setup

```bash
# install manually
sudo apt-get install -y build-essential clang cmake ncurses-dev python3-dev \
                        libx11-dev libxtst-dev libxt-dev libsm-dev libxpm-dev \
                        x11-apps python3-pip git p7zip-full unzip tmux nginx \
                        python3-venv
git clone https://github.com/vim/vim.git
cd vim
./configure --with-features=huge \
            --with-compiledby="Michael Ma" \
            --enable-multibyte \
            --enable-python3interp=yes \
            --enable-luainterp=yes \
            --enable-cscope
sudo make install

# OR install with brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install cmake go mosh pipx python ripgrep tmux
pipx install glances
# sudo ln -s /home/linuxbrew/.linuxbrew/bin/mosh-server /usr/local/bin/mosh-server

rm -rf ~/.vim
git clone https://github.com/MichaelMa2014/.vim.git ~/.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim -c ":PluginInstall"
cd ~/.vim/bundle/YouCompleteMe
python3 install.py --clang-completer --go-completer --rust-completer
```

#### iTerm2
Preferences -> Profiles -> Keys -> Key Mappings
Option+Up: Send Escape Sequence, `[5~`  (Send `^[ [5~`)
Option+Down: Send Escape Sequence, `[6~`
Option+Left: Send Escape Sequence, `b`
Option+Right: Send Escape Sequence, `w`
