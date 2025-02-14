execute pathogen#infect()
set directory=~/.vim/swap//             " swap file directory (trailing // is intentional)
set encoding=utf-8
set nocompatible                        " use vim defaults instead of 100% vi compatibility
set backspace=2                         " more powerful backspacing
set updatetime=250                      " update once every 250ms
set termguicolors                       " use full color
set signcolumn=yes                      " always show signcolumn

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
set noexpandtab                         " tabs are tabs
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

" claude.vim
let g:claude_api_key = ''
let g:claude_model = 'claude-3-5-haiku-20241022'
" let g:claude_model = 'claude-3-5-sonnet-20241022'

" prettier
" let g:prettier#autoformat = 1                     " format on save
" let g:prettier#autoformat_require_pragma = 0      " format on save

" ctrl-p
let g:ctrlp_custom_ignore = '\v[\/](node_modules|dist|cdk\.out)|(\.(swp|git))$'

" Text Colors
" gray1     = '#1b202a'
" gray2     = '#232936'
" gray3     = '#323c4d'
" gray4     = '#51617d'
" gray5     = '#9aa7bd'
" red       = '#b15e7c'
" green     = '#709d6c'
" yellow    = '#b5a262'
" blue      = '#608cc3'
" purple    = '#8f72bf'
" cyan      = '#56adb7'
" orange    = '#b3785d'
" pink      = '#c47ebd'

" Background Colors
" red_bg    = '#3a1f2a'
" green_bg  = '#1f332a'
" yellow_bg = '#3a3420'
" blue_bg   = '#1f2a40'
" purple_bg = '#2a1f3a'
" cyan_bg   = '#1f3a3a'
" orange_bg = '#3a2a1f'
" pink_bg   = '#3a1f36'

hi ColorColumn guifg=NONE guibg=#232936
hi Search guifg=#1b202a guibg=#b5a262

" vimdiff
hi DiffAdd     gui=NONE guifg=#709d6c guibg=#1f332a
hi DiffDelete  gui=NONE guifg=#3a1f2a guibg=#3a1f2a
hi DiffChange  gui=NONE guifg=NONE guibg=#161a22
hi DiffText    gui=bold guifg=#709d6c guibg=#1f332a

" Coc
" Gray
hi CocFadeOut guibg=#323c4d " for faded out text, such as for highlighting unnecessary code.
hi CocHintSign guibg=#323c4d " for hint signs.
hi CocHintHighlight guibg=#323c4d " for hint code range.

" Red
hi CocErrorSign guibg=#3a1f2a guifg=#b15e7c " for error signs.
hi CocErrorHighlight cterm=underline guifg=#b15e7c " for error code range.

" Orange
hi CocWarningSign guifg=#b3785d guibg=#3a2a1f " for warning signs.
hi CocWarningHighlight guifg=#b3785d " for warning code range.

" Yellow
hi CocInfoSign guifg=#b5a262 guibg=#3a3420 " for information signs.
hi CocInfoHighlight guifg=#b5a262 " for information code range.

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

"""""""""""""""""""""""""""""""""""
"                                 "
"               CoC               "
"                                 "
"""""""""""""""""""""""""""""""""""

" https://raw.githubusercontent.com/neoclide/coc.nvim/master/doc/coc-example-config.vim

" May need for Vim (not Neovim) since coc.nvim calculates byte offset by count
" utf-8 byte sequence
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s)
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
" xmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>aa  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
" xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
" nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line
" nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
" xmap if <Plug>(coc-funcobj-i)
" omap if <Plug>(coc-funcobj-i)
" xmap af <Plug>(coc-funcobj-a)
" omap af <Plug>(coc-funcobj-a)
" xmap ic <Plug>(coc-classobj-i)
" omap ic <Plug>(coc-classobj-i)
" xmap ac <Plug>(coc-classobj-a)
" omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> to scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges
" Requires 'textDocument/selectionRange' support of language server
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer
" command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
" command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
" command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
