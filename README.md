git clone git@github.com:jphustman/root.vimfiles.git

ln -s root.vimfiles/.tmux.conf .tmux.conf
ln -s root.vimfiles/.vimrc .vimrc

git clone git@github.com:Shougo/dein.vim .vim/bundle/repos/github.com/Shougo/dein.vim

call dein#update() to update
call dein#install() to install



