" no
set nocompatible                " vi compatible is LAME
set noerrorbells 
set noswapfile
set nobackup
set nojoinspaces
set nowrap

" indent
set autoindent
set smartindent     " indent when
set tabstop=4       " tab width
set softtabstop=4   " backspace
set shiftwidth=4    " indent width
set smarttab
set expandtab       " expand tab to space

" search
set incsearch
set hlsearch  
set ignorecase  
set smartcase

" fold
set foldmethod=manual
set foldlevel=1
command! FoldIf call s:FoldIf()
function! s:FoldIf()
    setl foldmethod=marker
    setl foldmarker=#if,#endif
    setl foldlevel=0
    setl foldmethod=manual
endfunction

" undo
set undodir=~/.vim/undo/
set undofile                " So is persistent undo ...
set undolevels=1000         " Maximum number of changes that can be undone
set undoreload=10000        " Maximum number lines to save for undo on a buffer reload

" common
set wildignorecase
set fileignorecase
set wildmenu                " visual autocomplete for command menu
set showmode                " show the current mode
set showcmd
set clipboard+=unnamed           

" grocery
set report=0                                                      " always report number of lines changed                "
set scrolloff=3                                                   " 5 lines above/below cursor when scrolling
set title                                                         " show file in titlebar
set matchtime=2                                                   " show matching bracket for 0.2 seconds
set matchpairs+=<:>                                               " specially for html

" uncomment for table edit
" set virtualedit=all

set splitright
set laststatus=2                  " make the last line where the status is two lines deep so you can see status always
set backspace=indent,eol,start    " make that backspace key work the way it should
set showtabline=0                 " disable tab page promps
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1

" syntax
filetype plugin indent on
syntax on

set background=dark
" colorscheme desert
set nu
set relativenumber
set cursorline
" set colorcolumn=78
" au WinLeave * set nocursorcolumn
" au WinEnter * set cursorcolumn

augroup my_ft
    autocmd FileType text setlocal textwidth=78
    autocmd FileType vim imap <tab> <c-x><c-v>
augroup END

" remap {{{
noremap zl zL
noremap zh zH
noremap H ^
noremap L $
nnoremap gV `[v`]
noremap Y y$
nnoremap U <C-R>
" Wrapped lines goes down/up to next row, rather than next line in file.
noremap j gj
noremap k gk
" Visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv
" visual searching :search for visually highlighted text
vmap * y/<C-R>"<CR>
vmap # y?<C-R>"<CR>
" Most prefer to toggle search highlighting rather than clear the current
" search results. To clear search highlighting rather than toggle it on
" and off, add the following to your .vimrc.before.local file:
nmap <silent> <leader><space> :nohlsearch<CR>
nnoremap <space><space>v :source ~/.vim/basic.vim<cr>
map gi l
map gw <c-w>
map <space>w <c-w>

inoremap <silent><expr> <space> pumvisible() ? "\<C-Y>" : "\<space>"
" }}}

if has("cscope")
    if (executable('gtags') && executable('gtags-cscope'))
        set csprg=gtags-cscope
        source ~/.vim/plugin/gtags.vim
        source ~/.vim/plugin/gtags-cscope.vim
        let GtagsCscope_Auto_Map = 1
        let GtagsCscope_Ignore_Case = 1
        " let GtagsCscope_Absolute_Path = 1
        " let GtagsCscope_Keep_Alive = 1
        let GtagsCscope_Auto_Load = 1
    elseif (executable('cscope'))
        set csprg=/usr/local/bin/cscope
        " add any database in current directory
        if filereadable("cscope.out")
            cs add cscope.out
        " else add database pointed to by environment
        elseif $CSCOPE_DB != ""
            cs add $CSCOPE_DB
        endif
    endif
    set csto=0
    set cst
    set nocsverb
    set csverb
	set cscopequickfix=s-,c-,d-,i-,t-,e-,a-
endif

map gi l
nmap gis :cs find s <C-R>=expand("<cword>")<CR><CR>
" nmap gig :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap gig :tag <C-R>=expand("<cword>")<CR><CR>
nmap gic :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap git :cs find t <C-R>=expand("<cword>")<CR><CR>
" nmap gie :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap gif :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap gid :cs find d <C-R>=expand("<cword>")<CR><CR>
nmap gia :cs find a <C-R>=expand("<cword>")<CR><CR>

" builtin package
packadd matchit

" iabbrev fo for (size_t i = 0; i < len; i++) {}

" vim:fdm=marker:fmr={{{,}}}:fdl=0:

