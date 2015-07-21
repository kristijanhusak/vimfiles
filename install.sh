#/bin/sh
rm -rf ~/.vim ~/.vimrc \
&& git clone git@github.com:gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim \
&& ln -s $(pwd)/vimrc ~/.vimrc \
&& ln -s $(pwd)/ackrc ~/.ackrc \
&& ln -s $(pwd)/snippets ~/.vim/snippets \
&& vim +PluginInstall +qall \
&& cd ~/.vim/bundle/tern_for_vim \
&& npm install \
&& cd node_modules/tern/plugin \
&& wget https://raw.githubusercontent.com/Slava/tern-meteor/master/meteor.js
