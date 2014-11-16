#/bin/sh
rm -rf ~/.vim ~/.vimrc && git clone git@github.com:Shougo/neobundle.vim.git ~/.vim/bundle/neobundle.vim && ln -s $(pwd)/vimrc ~/.vimrc && vim
