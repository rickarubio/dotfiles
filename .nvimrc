" Required Vundle settings
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'benekastah/neomake'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/syntastic'
Plugin 'rking/ag.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'tpope/vim-fugitive'
Plugin 'suan/vim-instant-markdown'

call vundle#end()

filetype plugin indent on

"""""""
" All other non-vundle settings go below here
"""""""

" default vim colorscheme
syntax on
colorscheme molokai

" general vim settings
set number
set colorcolumn=81
" highlight searches and do it incrementally
set hlsearch
set incsearch
" get out of highlight search by pressing enter
nnoremap <CR> :nohlsearch<CR><CR>
" speed up scrolling in vim
set ttyfast
set lazyredraw
" indentation settings
set tabstop=2
set shiftwidth=2
set expandtab
" allow backspacing over everything
set backspace=2
" do not wrap lines
set nowrap

" NERDTree settings
autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-o> :NERDTreeToggle<CR> " open/close nerdtree with ctrl+o

" Easily navigate Vim Splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" vim-airline settings
set laststatus=2
let g:airline_powerline_fonts=1

" Macvim settings
set guifont=Menlo\ for\ Powerline:h14

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list=1
" auto close loc list when no errors present
" but don't open the loc list automatically
let g:syntastic_auto_loc_list=2
" Disable check on open so that we only run checker on saves using Neomake
let g:syntastic_check_on_open=0
let g:syntastic_check_on_wq=0
let g:syntastic_ruby_checkers=['rubocop']
" Signs seem to cause a lot of lag in vim, 1 is on, 0 is off
let g:syntastic_enable_signs=1
" Remove annoying char highlight on line containing error
let g:syntastic_enable_highlighting=0

" Allow NERDTree to show hidden files
let NERDTreeShowHidden=1

" Makes NERDTree ignore certain files in the UI
let NERDTreeIgnore = ['\.swp']

" This allows syntastic to be processed asynchronously, speeding up nvim ui
let g:neomake_ruby_enabled_makers=['rubocop']
" Run the linter on every buffer save
autocmd! BufWritePost * Neomake
" Fixes Neomake Syntastic symbols to have color
let g:neomake_error_sign = {
            \ 'text': '>>',
            \ 'texthl': 'ErrorMsg',
            \ }
hi MyWarningMsg ctermbg=3 ctermfg=0
let g:neomake_warning_sign = {
            \ 'text': '>>',
            \ 'texthl': 'MyWarningMsg',
            \ }
" Defines the <Leader> key
let mapleader=','
" Remap Neovim key to exit terminal mode
if exists(':tnoremap')
  tnoremap <Leader>t <C-\><C-n>
endif
