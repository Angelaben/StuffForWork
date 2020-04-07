execute pathogen#infect()
filetype plugin indent on
filetype plugin on
set t_Co=256
set t_ut=
colorscheme codedark
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 2

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1
" enable spyntax highlighting
syntax enable
syntax on
" show line numbers
set number
" If lower case, insensitive
set ignorecase 

" if some upper case, then case sensitive
set smartcase 

" set tabs to have 4 spaces
set ts=4

" How many a tab takes
set tabstop=4

set shiftwidth=4
" Convert tabs to space
set expandtab

" indent when moving to the next line while writing code
set autoindent
" Indent after if for and stuff
set smartindent

" expand tabs into spaces
set expandtab

" when using the >> or << commands, shift lines by 4 spaces
set shiftwidth=4

" show a visual line under the cursor's current line
set cursorline

" show the matching part of the pair for [] {} and ()
set showmatch

" Show command in bottom bar
set showcmd

" Search as characters are entered
set incsearch
"Auto Reload files when changed on Vim
set autoread
"Auto Reload when cursor is not moving
au CursorHold,CursorHoldI * :checktime
au FocusGained,BufEnter * :checktime


"Update update time
set updatetime=10

" and highlight them
set hlsearch 
" enable all Python syntax highlighting features
let python_highlight_all = 1

" Toggle nerdtree with ctrl+n
map <C-n> :NERDTreeToggle<CR>


 "Ctrl + / for comments
 nmap <C-_> <plug>NERDCommenterToggle 
  " Ctrl + S to save current file
 noremap <silent> <C-s> :update<CR>
 vnoremap <silent> <C-s> <C-C>:update<CR>
 inoremap <silent> <C-s> <C-O>:update<CR>
 
 "NerdTree style
 
let g:NERDTreeGitStatusWithFlags = 0
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:NERDTreeGitStatusNodeColorization = 1
let g:NERDTreeIndicatorMapCustom = {
\ "Modified"  : "",
         \ "Staged"    : "",
         \ "Unmerged"  : "",
         \ "Untracked" : "",
         \ "Renamed"   : "",
         \ "Deleted"   : "",
         \ "Dirty"     : "",
         \ "Clean"     : "",
         \ 'Ignored'   : '',
         \ "Unknown"   : "?"
         \ }
" NerdTree Git Colors
let g:NERDTreeColorMapCustom = {
  \ "Modified"  : "#e1c46b",  
  \ "Dirty"     : "#e1c46b",
  \ "Staged"    : "#e1c46b",  
  \ "Untracked" : "#6BBE89",  
  \ "Clean"     : "#87939A",   
  \ "Ignored"   : "#808080"   
    \ }

let g:ctrlp_max_files=0

let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
let g:ctrlp_working_path_mode = 'r'
if executable('ag')
      let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  endif
" Reduce amount of file parsed
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/third_party/*,*/\.git/*,*.jpg
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
set list
highlight ColorColumn ctermbg=red
if exists('+colorcolumn')
   set colorcolumn=80
else
   au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif



" Customise autopep 8
autocmd FileType python noremap <buffer> <F8> :! autopep8 --aggressive --aggressive -i %<CR>

let g:autopep8_aggressive=2
"" let g:autopep8_on_save=1



let g:jedi#use_splits_not_buffers = "left"
set runtimepath^=~/.vim/bundle/ag
let g:ag_working_path_mode="r"


""" Require vim 8 - COC config
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
" Copy for external source - thanks michalis
noremap Y "+y
