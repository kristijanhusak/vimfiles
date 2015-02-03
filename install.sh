#/bin/sh
rm -rf ~/.vim ~/.vimrc \
&& git clone git@github.com:gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim \
&& ln -s $(pwd)/vimrc ~/.vimrc \
&& ln -s $(pwd)/snippets ~/.vim/snippets \
&& vim +PluginInstall +qall
