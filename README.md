git clone git@github.com:jphustman/root.vimfiles.git

ln -s root.vimfiles/.vimrc .vimrc
git clone git@github.com:Shougo/neobundle.vim .vim/bundle/neobundle.vim
vim +NeoBundleInstall!

