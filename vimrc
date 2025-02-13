execute pathogen#infect()
set directory=~/.vim/swap//             " swap file directory (trailing // is intentional)
set encoding=utf-8
set nocompatible                        " use vim defaults instead of 100% vi compatibility
set backspace=2                         " more powerful backspacing
set updatetime=250                      " update once every 250ms

" keybindings
noremap Q @q

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
set termguicolors
set background=dark
let g:deepspace_italics=1
colorscheme deep-space
autocmd FileType javascript JsPreTmpl
set completeopt-=preview
autocmd BufEnter * syntax sync fromstart

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

" vimdiff
highlight DiffAdd    cterm=NONE ctermfg=NONE ctermbg=17  gui=NONE guifg=NONE guibg=#324147
highlight DiffDelete cterm=NONE ctermfg=52 ctermbg=52  gui=NONE guifg=#232936 guibg=#232936
highlight DiffChange cterm=NONE ctermfg=NONE ctermbg=17  gui=NONE guifg=NONE guibg=#324147
highlight DiffText   cterm=bold ctermfg=NONE ctermbg=28  gui=bold guifg=NONE guibg=#1c6b4c

" claude.vim
let g:claude_api_key = ''
let g:claude_model = 'claude-3-5-haiku-20241022'
" let g:claude_model = 'claude-3-5-sonnet-20241022'

" prettier
" let g:prettier#autoformat = 1                     " format on save
" let g:prettier#autoformat_require_pragma = 0      " format on save

" ctrl-p
let g:ctrlp_custom_ignore = '\v[\/](node_modules|dist|cdk\.out)|(\.(swp|git))$'

" Coc
let s:gray1     = '#1b202a'
let s:gray2     = '#232936'
let s:gray3     = '#323c4d'
let s:gray4     = '#51617d'
let s:gray5     = '#9aa7bd'
let s:red       = '#b15e7c'
let s:green     = '#709d6c'
let s:yellow    = '#b5a262'
let s:blue      = '#608cc3'
let s:purple    = '#8f72bf'
let s:cyan      = '#56adb7'
let s:orange    = '#b3785d'
let s:pink      = '#c47ebd'

hi CocHintSign guibg=#608cc3
hi CocInfoSign guibg=#b5a262
hi CocWarningSign guifg=#b3785d
hi CocErrorSign guifg=#b15e7c
hi CocUnusedHighlight guibg=#2b3343
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" NERDTree
let NERDTreeShowHidden=1

" nerdtree-git-plugin
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'*',
                \ 'Ignored'   :'✗',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }

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
