
Note! when compiling vim use this configure script:

./configure --enable-gui=gtk2 --enable-pythoninterp --prefix=/usr

cd /usr/share/vim

git clone git@github.com:jphustman/root.vimfiles.git

ln -s root.vimfiles/.vimrc vimrc

# In /root/
cd /root

ln -s root.vimfiles/.tmux.conf .tmux.conf

# Maybe not these
ln -s root.vimfiles/.bash_profile .bash_profile #Arch Linux

ln -s root.vimfiles/.bashrc .bashrc

cd /usr/share/vim

git clone git@github.com:Shougo/dein.vim /usr/share/vim/.cache/dein/repos/github.com/Shougo/dein.vim

- In Solaris you need to go into that folder and git checkout 2.2

vim

call dein#update() to update

call dein#install() to install



