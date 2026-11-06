### New Ubuntu 18.10 on GCP
### Has to work interactively for now

# DigitalOcean only
sudo adduser michael
sudo usermod -aG sudo michael

sudo apt-get update
sudo apt-get install -y build-essential clang cmake ncurses-dev python3-dev \
                        libx11-dev libxtst-dev libxt-dev libsm-dev libxpm-dev \
                        x11-apps python3-pip git p7zip-full unzip tmux nginx \
                        python3-venv

# Install brew on Linux and Mac
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install vim ripgrep

# if homebrew vim does not include python3
git clone https://github.com/vim/vim.git
cd vim
./configure --with-features=huge \
            --with-compiledby="Michael Ma" \
            --enable-multibyte \
            --enable-python3interp=yes \
            --enable-luainterp=yes \
            --enable-cscope
sudo make install

# vim
rm -rf ~/.vim
git clone https://github.com/MichaelMa2014/.vim.git ~/.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim -c ":PluginInstall"

# YouCompleteMe
cd ~/.vim/bundle/YouCompleteMe
brew install cmake
python3 ./install.py --clang-completer --rust-completer --go-completer --java-completer

# in case not enough memory
sudo fallocate -l 2G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile

# pbcopy
curl -fsSLo pbcopy https://raw.githubusercontent.com/skaji/remote-pbcopy-iterm2/master/pbcopy.py
chmod +x pbcopy
sudo mv pbcopy /usr/local/bin/

# bash
cp bak.inputrc ~/.inputrc

# zsh
echo "source ~/.vim/bak.zshrc" >> ~/.zshrc

# tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
ln -sf ~/.vim/bak.tmux.conf ~/.tmux.conf
tic tmux-256color.ti
chmod +x ~/.vim/bin/tmux-boot-restore.sh
launchctl bootout "gui/$(id -u)/Tmux.Start.plist" 2>/dev/null || launchctl unload ~/Library/LaunchAgents/Tmux.Start.plist 2>/dev/null || true
rm -f ~/Library/LaunchAgents/Tmux.Start.plist

# claude code (copy, not symlink: Claude Code rewrites settings.json in place)
mkdir -p ~/.claude
cp bak.claude-settings.json ~/.claude/settings.json
mkdir -p ~/.local/bin
ln -sf ~/.vim/bin/claude-notify-tmux ~/.local/bin/claude-notify-tmux

# git hooks (plist lint before commit)
git -C ~/.vim config core.hooksPath githooks
