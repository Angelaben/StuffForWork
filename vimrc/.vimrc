set nocompatible
set number
filetype plugin indent on
syntax on 
" Initialisation de pathogen
call pathogen#infect()
call pathogen#helptags()

function! StartUp()
    if 0 == argc()
	            NERDTree
		        end
		endfunction

autocmd VimEnter * call StartUp()
nmap <F6> :NERDTreeToggle<CR>
:set ignorecase # If lower case, insensitive
:set smartcase # if some upper case, then case sensitive
