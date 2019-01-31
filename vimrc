execute pathogen#infect()
set nocompatible	                      " Use Vim defaults instead of 100% vi compatibility
set backspace=2		                      " more powerful backspacing
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

noremap Q @q
noremap W @w
noremap <S-k> <Nop>

command! Test execute ':w' | execute ':!clear && npm t %'
command! TestDO execute ':w' | execute ':!clear && cd ~/workspaces/nextcapital-ui && grunt unit:designObjects --file=%:t'
command! Snapshot execute ':w' | execute ':!clear && npm t % -- -u'
command! Commit execute ':w' | execute ':silent !cd %:p:h && git add %:t' | execute ':redraw!'
command! Reset execute ':silent !cd %:p:h && git reset head %:t' | execute ':redraw!'

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
