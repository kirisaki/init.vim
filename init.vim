" vim-plug
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" languages
Plug 'leafgarland/typescript-vim'
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'

" colorscheme
Plug 'kirisaki/sweet-lolita'

call plug#end()

" colorscheme
colorscheme sweet-lolita

" airline setting
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'

" editor behavior
set number
set title
set tabstop=4
set expandtab
set shiftwidth=4
set smartindent
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
set nrformats-=octal
set hidden
set history=50
set virtualedit=block
set whichwrap=b,s,[,],<,>
set backspace=indent,eol,start
set wildmenu
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx
autocmd FileType javascript  setlocal sw=2 sts=2 ts=2 et
autocmd FileType typescript  setlocal sw=2 sts=2 ts=2 et
autocmd FileType typescript.tsx  setlocal sw=2 sts=2 ts=2 et

" vim-racer
set hidden
let g:racer_cmd = "/home/kirisaki/.cargo/bin/racer"
let g:racer_experimental_completer = 1

" additional key mapping
nnoremap <silent> <C-j> :bprev<CR>
nnoremap <silent> <C-k> :bnext<CR>
