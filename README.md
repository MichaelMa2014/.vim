### New machine setup

```bash
sudo apt-get install -y build-essential clang cmake ncurses-dev python3-dev \
                        libx11-dev libxtst-dev libxt-dev libsm-dev libxpm-dev \
                        x11-apps python3-pip git p7zip-full unzip tmux nginx \
                        python3-venv
# OR
# brew install python cmake tmux ripgrep
git clone https://github.com/vim/vim.git
cd vim
./configure --with-features=huge \
            --with-compiledby="Michael Ma" \
            --enable-multibyte \
            --enable-python3interp=yes \
            --enable-luainterp=yes \
            --enable-cscope
sudo make install
rm -rf ~/.vim
git clone https://github.com/MichaelMa2014/.vim.git ~/.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim -c ":PluginInstall"
cd ~/.vim/bundle/YouCompleteMe
python3 install.py --clang-completer --go-completer --rust-completer
```


### Install instant-markdown

```bash
curl https://deb.nodesource.com/setup_9.xhttps://deb.nodesource.com/setup_9.x | sudo bash -
sudo apt install nodejs
git clone git@github.com:twidxuga/instant-markdown-d.git
# Change socket.io version to 0.9 in package.json
sudo -i
cd /path/to/instant-markdown-d
npm install -g
```

And then tunnel to 8090 port with `ssh host -L 8090:localhost:8090`.
