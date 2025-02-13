# dotvim

Installation:

```
git clone https://github.com/vsarang/dotvim.git ~/.vim
ln -s ~/.vim/vimrc ./.vimrc
ln -s ~/.vim/tern-project ~/.tern-project

cd ~/.vim
git submodule update --init --recursive

cd bundle/coc.nvim
npm ci
```

Set Claude API key:
```
let g:claude_api_key = 'your_api_key_here'
```
