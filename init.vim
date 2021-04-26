" vim-plug
filetype off
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" languages
Plug 'leafgarland/typescript-vim'
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'
Plug 'neovimhaskell/haskell-vim'
Plug 'hashivim/vim-terraform'
Plug 'vim-syntastic/syntastic'
Plug 'juliosueiras/vim-terraform-completion'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'joshglendenning/vim-caddyfile'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'purescript-contrib/purescript-vim'
Plug 'kylelaker/riscv.vim'
Plug 'qnighy/satysfi.vim'
" Plug 'neovim/nvim-lsp'
" Plug 'neovim/nvim-lspconfig'

" colorscheme
Plug 'kirisaki/sweet-lolita'

call plug#end()
filetype plugin indent on
syntax on

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
set listchars=tab:\|\ ,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
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
autocmd FileType yaml setlocal sw=2 sts=2 ts=2 et
autocmd BufRead,BufNewFile *.jl :set filetype=julia

" haskell
let g:haskell_indent_disable = 1

" go
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

" Julia
function! Exe()
  echo "Exe"
  let filename = expand('%:t')
  if stridx(filename, ".py") != -1 
    !python %
  elseif stridx(filename, ".jl") != -1
    !julia %
  elseif stridx(filename, ".cpp") != -1 
    !./build_run.sh
  else
    echo "unknown filetype"+filename
  endif
endfunction
command! Exe :call Exe()
nmap <F5> :Exe

nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>

" vim-racer
set hidden
let g:racer_cmd = "/home/kirisaki/.cargo/bin/racer"
let g:racer_experimental_completer = 1
" Syntastic Config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" additional key mapping
nnoremap <silent> <C-j> :bprev<CR>
nnoremap <silent> <C-k> :bnext<CR>
