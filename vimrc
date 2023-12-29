execute pathogen#infect()
set directory=~/.vim/swap//             " swap file directory (trailing // is intentional)
set encoding=utf-8
set nocompatible                        " use vim defaults instead of 100% vi compatibility
set backspace=2                         " more powerful backspacing
set updatetime=250                      " update once every 250ms

" decorations
set number                              " show line numbers
set scrolloff=5                         " pad cursor and screen edge
set cursorline                          " highlight current line
set colorcolumn=100                     " highlight column
set wildmenu                            " visual autocomplete for command menu
set wildignore=*.o,*~,*.pyc,*.swp,*/node_modules
set lazyredraw                          " redraw only when necessary

" syntax highlighting
syntax enable
set background=dark
colorscheme deep-space
autocmd FileType javascript JsPreTmpl html
set completeopt-=preview

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

" status line
set laststatus=2
let g:airline_theme='deep_space'
let g:airline_powerline_fonts=1

" ultisnip
let g:UltiSnipsExpandTrigger="<c-x>"
let g:UltiSnipsJumpForwardTrigger="<c-x>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"

" ctrl-p
let g:ctrlp_custom_ignore = '\v[\/](node_modules|dist|cdk\.out)|(\.(swp|git))$'

" prettier
let g:prettier#autoformat = 1                     " format on save
let g:prettier#autoformat_require_pragma = 0      " format on save

" NERDTree
let NERDTreeShowHidden=1

noremap Q @q

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check.
if (empty($TMUX))
    if (has("nvim"))
        "For Neovim 0.1.3 and 0.1.4
        let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    endif

    "For Neovim 0.1.5+ and Vim 7.4.1799+
    if (has("termguicolors"))
        set termguicolors
    endif
endif
