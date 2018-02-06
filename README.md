# .vim
Vim configuration

Run the following command to install:

```
cd ~
git clone https://github.com/MichaelMa2014/.vim.git
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim -c ":PluginInstall"
```

`YouCompleteMe` is *hard* to install. Good luck!

### Install instant-markdown

```
curl https://deb.nodesource.com/setup_9.xhttps://deb.nodesource.com/setup_9.x | sudo bash -
sudo apt install nodejs
# Maybe there are better forks with syntax hightlighting, but this one has MathJex
git clone git@github.com:twidxuga/instant-markdown-d.git
# Change socket.io version to 0.9 in package.json
sudo -i
cd /path/to/instant-markdown-d
npm install -g
```

And then tunnel to 8090 port with `ssh host -L 8090:localhost:8090`.
