" nothing

" basic
source ~/.vim/basic.vim

if exists('g:loaded_plugins')
    finish
else
    source ~/.vim/plugins.vim
    let g:loaded_plugins = 1
endif
