set encoding=UTF-8
set mouse=a
syntax enable
set nocompatible

" Remember line when reopen file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

" Center cursor verticaly
augroup VCenterCursor
  au!
  au BufEnter,WinEnter,WinNew,VimResized *,*.*
        \ let &scrolloff=winheight(win_getid())/3
augroup END

colorscheme gruvbox

set termguicolors
set tabstop=2
set shiftwidth=2
set expandtab
set number relativenumber
set nowrap

" Mapping
map <C-s> :w<CR>
map <C-n> :CocCommand explorer<CR>
map <C-c> :q<CR>
map <C-a> :q!<CR>
map <C-\> :cd ~<CR>
map <C-i> :tabnext<CR>
map <C-u> :tabprevious<CR>
map <C-f> :Clap files<CR>
map <C-g> :Clap<CR>

" tmux
let g:tmux_navigator_no_mappings = 1

noremap <silent> <C-h> :TmuxNavigateLeft<cr>
noremap <silent> <C-j> :TmuxNavigateDown<cr>
noremap <silent> <C-k> :TmuxNavigateUp<cr>
noremap <silent> <C-l> :TmuxNavigateRight<cr>
noremap <silent> <C-/> :TmuxNavigatePrevious<cr>

" Move lines
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
vnoremap <A-l> :m '>+1<CR>gv=gv
vnoremap <A-h> :m '<-2<CR>gv=gv

" Vim rooter
" let g:rooter_targets = '*'
" let g:rooter_patterns = ['.git']

" coc
nmap <silent> gd <Plug>(coc-definition)

" coc-explorer
" :nnoremap <space>e :CocCommand explorer<CR>

" prettier
" command! -nargs=0 Prettier :CocCommand prettier.formatFile

" ariline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_theme='base16_gruvbox_dark_hard'

" Emmet
let g:user_emmet_leader_key='<space>'
let g:javascript_plugin_jsdoc = 1

" devicons
let g:airline_powerline_fonts = 1
let g:webdevicons_enable_airline_statusline = 1
let g:webdevicons_enable_airline_tabline = 1

" Set ultisnips triggers
" :UltiSnipsEdit to edit snippets
let g:UltiSnipsExpandTrigger="<tab>"                                            
let g:UltiSnipsJumpForwardTrigger="<tab>"                                       

" Vim Javascript
let g:javascript_plugin_jsdoc = 1

" Ultisnips
let g:UltiSnipsExpandTrigger="<tab>"

" Easymotion
let mapleader=" "
map <Leader>s <Plug>(easymotion-s9)

call plug#begin()

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'preservim/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-rooter'
Plug 'SirVer/ultisnips'
Plug 'mlaursen/vim-react-snippets'
Plug 'easymotion/vim-easymotion'
Plug 'jiangmiao/auto-pairs'
Plug 'wadackel/vim-dogrun'
Plug 'liuchengxu/vim-clap'
Plug 'mattn/emmet-vim'
Plug 'arcticicestudio/nord-vim' 

call plug#end()

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'Yggdroot/indentLine'
Plugin 'eslint/eslint'
Plugin 'christoomey/vim-tmux-navigator'

call vundle#end() 
filetype plugin indent on 

" indentLine
let g:indentLine_enabled = 1
let g:indentLine_setColors = 1
let g:indentLine_char = '┆'
let g:indentLine_leadingSpaceEnabled = 0
let g:indentLine_leadingSpaceChar = '·'
