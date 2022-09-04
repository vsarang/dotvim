# dotvim
Installation:
```
git clone https://github.com/vsarang/dotvim.git ~/.vim
ln -s ~/.vim/vimrc ./.vimrc
ln -s ~/.vim/tern-project ~/.tern-project

cd ~/.vim
git submodule update --init --recursive

cd bundle/YouCompleteMe
python3 install.py --ts-completer
```
