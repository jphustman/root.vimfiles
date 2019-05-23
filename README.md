
Note! when compiling vim use this configure script:
./configure --enable-gui=gtk2 --enable-pythoninterp --prefix=/usr

git clone git@github.com:jphustman/root.vimfiles.git

ln -s root.vimfiles/.tmux.conf .tmux.conf
ln -s root.vimfiles/.vimrc .vimrc
ln -s root.vimfiles/.bash_profile .bash_profile #Arch Linux
ln -s root.vimfiles/.bashrc .bashrc

git clone git@github.com:Shougo/dein.vim ~/.cache/dein/repos/github.com/Shougo/dein.vim

call dein#update() to update
call dein#install() to install



