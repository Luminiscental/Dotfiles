source $VIMRUNTIME/vimrc_example.vim

" Plugin settings "
let g:hybrid_termcolors=256
let g:hybrid_termtrans=1

let g:ycm_confirm_extra_conf = 0
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_complete_in_comments=1
let g:ycm_collect_identifiers_from_tags_files=1
set completeopt-=preview
let g:ycm_min_num_of_chars_for_completion=1
let g:ycm_cache_omnifunc=0
let g:ycm_seed_identifiers_with_syntax=1
"let g:indentLine_char = '│'
let ayucolor="mirage"
let g:Tex_ViewRule_pdf = 'xdg-open'
let g:Tex_DefaultTargetFormat = 'pdf'

" Plugins "
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source ~/.vimrc
endif

call plug#begin('~/.vim/plugged')

Plug 'Valloric/YouCompleteMe'
Plug 'airblade/vim-gitgutter'
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
Plug 'sheerun/vim-polyglot'
"Plug 'Yggdroot/indentLine'
Plug 'jeaye/color_coded'
Plug 'flazz/vim-colorschemes'
Plug 'ap/vim-css-color'
Plug 'KKPMW/sacredforest-vim'
Plug 'ayu-theme/ayu-vim'
Plug 'vim-latex/vim-latex'

call plug#end()

filetype plugin indent on 

" Workflow "
nnoremap - dd
nnoremap <leader>t :retab<CR>
"nnoremap <leader>h i#define val const auto<CR>#define var auto<CR><Esc>

nmap <leader>sp :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

noremap <F1> :YcmCompleter FixIt<CR>  
noremap <F2> :YcmGenerateConfig<CR>:YcmGenerateConfig --format=cc<CR>
noremap <F3> :PlugInstall<CR>
noremap <F4> :noh<CR>
noremap <F8>  :tabp<CR>
noremap <F9>  :tabn<CR>

set hidden
set splitbelow
set splitright
set updatetime=100

" Colours "
syntax enable

set term=xterm
set t_Co=256
set background=dark
set termguicolors
set number
set matchpairs+=<:>

"colorscheme solarized
colorscheme autumn256

" Encoding "
set encoding=utf-8

" Tabs "
set tabstop=4
set shiftwidth=4
set expandtab

