#/bin/sh
rm -rf ~/.vim ~/.vimrc \
&& curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim \
&& ln -s $(pwd)/vimrc ~/.vimrc \
&& ln -s $(pwd)/snippets ~/.vim/snippets
