"**********************
"PATHOGEN
"**********************
" Put these two calls to pathogen at the top of the vimrc file
" The must definitely be before the file type detection code
call pathogen#infect('bundle/{}')
call pathogen#helptags()
" End put these two calls to pathogen at the top of the vimrc file

filetype off

syntax on
colorscheme crt
set hlsearch
:hi Search ctermfg='red' ctermbg='white'

"**********************
"SEARCHING
"**********************
"With both ignorecase and smartcase turned on, a search is
"case-insensitive if you enter the search string in ALL lower case. For
"example, searching for apple will find Apple and APPLE.
"However, if your search string has one or more characters in upper
"case, it will assume that you want a case-sensitive search. So,
"searching for Apple will only give you Apple but not apple or APPLE.
set ignorecase
set smartcase

"Do incremental searches.
"incsearch stands for incremental search. It means that you will see
"what vim matches as you type in each letter of your search string
"(without having to hit return before search is even attempted).
"For example, you type / to initiate search, and right after you type
"the letter a, vim will highlight the a in apple. As you type the next
"letter p, vim will highlight ap in the word apple
set incsearch

"**********************
"LINE NUMBERS
"**********************
"Absolute and relative line numbering:
"Since Vim 7.4, you can enable both the number and relativenumer settings at
"the same time, which will give you something I'll call hybrid line number
"mode. Using that, all lines will show their relative line number, except for
"the line you're currently on, which will show its absolute line number.
"The following turns on relative line numbers
set relativenumber
"The following turns line numbers on
set number

"**************
"MAKING COMMANDS:
"**************
"Format is:  command!  command_name  command
"Example of a command 
"command! Status echo "All systems are go!"
"Now :Status would display 'All systems are go'

" File type detection 
if has("autocmd")
  filetype plugin indent on
endif
" End file type detection

"**************
"SHOW Vim HIGHLIGHTING GROUPS FOR CURRENT WORD
"**************
"This will display the group and/or name of the word under the cursor
"for purposes of modifying the syntax files
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'),col('.')), 'synIDattr(v:val, "name")')
endfunc

