let g:powerline_pycmd="py3"
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup
execute pathogen#infect()
set laststatus=2 " Always display the statusline in all windows
set showtabline=2 " Always display the tabline, even if there is only one tab
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)

set t_Co=256

"Solarized színek
"A :set list által megjelenített karakterek láthatósága
"let g:solarized_visibility="low"
syntax enable
set background=dark
let g:solarized_termtrans=1
colorscheme solarized
hi clear SpellBad
hi SpellBad cterm=underline

"Tabok helyett 4 szóköz
:set tabstop=4 shiftwidth=4 expandtab

"Autoindent
:set autoindent
if has("autocmd")
  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on
  " ...
endif

:set tw=79
:set fo+=t
:set fo-=l

" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

" Set up Hungarian spellcheck
:set spell spelllang=hu

" Show line numbering
:set nu

" Set 80-column indication
:set cc=80

augroup filetypedetect
    au BufRead,BufNewFile *.sage set filetype=python
augroup END

augroup filetypedetect
    au! BufRead,BufNewFile *.g        set filetype=gap
    au! BufRead,BufNewFile *.gi       set filetype=gap
    au! BufRead,BufNewFile *.gd       set filetype=gap
    au! BufRead,BufNewFile .gaprc     set filetype=gap
    au! BufRead,BufNewFile *.Rnw      set filetype=tex
augroup END

let c='a'
while c <= 'z'
    exec "set <A-".c.">=\e".c
    exec "imap \e".c." <A-".c.">"
    let c = nr2char(1+char2nr(c))
endw
set timeout ttimeoutlen=1
set hlsearch
