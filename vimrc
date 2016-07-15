execute pathogen#infect()
" decorations
set number                              " show line numbers
set scrolloff=5                         " pad cursor and screen edge
set cursorline                          " highlight current line
set wildmenu                            " visual autocomplete for command menu
set wildignore=*.o,*~,*.pyc
set lazyredraw                          " redraw only when necessary

" syntax highlighting
syntax enable
set t_Co=256                            " 256 terminal colors
colorscheme solarized
set background=dark

" tabs and spaces
set tabstop=2                           " number of visual spaces per TAB
set softtabstop=2                       " number of spaces entered per TAB
set shiftwidth=2                        " number of columns shifted by << and >>
set expandtab                           " tabs are spaces
filetype indent on                      " filetype-specific TAB width

" text search
set ignorecase
set smartcase                           " only ignore case if query is lowercase
set incsearch                           " search as characters are enterd
set hlsearch                            " highlight matches

" folding
"set foldenable
"set foldlevelstart=10
"set foldmethod=indent

" status line
set laststatus=2
set statusline=
set statusline+=%<\                     " cut at start
set statusline+=%2*[%n%H%M%R%W]%*\      " buffer number, and flags
set statusline+=%1*%y%*%*\              " file type
set statusline+=%-40f\                  " relative path
set statusline+=%=                      " seperate between right- and left-aligned
set statusline+=%10(L(%l/%L)%)\         " line
set statusline+=%2(C(%v/125)%)\         " column
set statusline+=%P                      " percentage of file

noremap Q @q
noremap <space> <pagedown>

augroup reload_vimrc " {
  autocmd!
  autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }
