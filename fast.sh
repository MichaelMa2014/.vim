git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim -c ":PluginInstall"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
cp bak.tmux.conf ~/.tmux.conf
tic tmux-256color.ti
cat bak.bashrc >> ~/.bashrc

