set encoding=UTF-8
set mouse=a
syntax enable

colorscheme dogrun
let g:lightline = {
  \ 'colorscheme': 'dogrun',
  \ }
let g:clap_theme = 'dogrun'
highlight Comment cterm=italic

set termguicolors
set tabstop=2
set shiftwidth=2
set expandtab
set number relativenumber
set nowrap

" Mapping
map <C-s> :w<CR>
map <C-n> :NERDTreeToggle<CR>
map <C-c> :q<CR>
map <C-x> :q!<CR>
map <C-\> :cd ~<CR>
map <C-i> :tabnext<CR>
map <C-u> :tabprevious<CR>
map <C-f> :Clap<CR>

" tmux
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
nnoremap <silent> <C-/> :TmuxNavigatePrevious<cr>

" Vim rooter
" let g:rooter_targets = '*'
" let g:rooter_patterns = ['.git']

" coc
nmap <silent> gd <Plug>(coc-definition)

" coc-explorer
:nnoremap <space>e :CocCommand explorer<CR>

" prettier
" command! -nargs=0 Prettier :CocCommand prettier.formatFile

" ariline
let g:airline#extensions#tabline#formatter = 'unique_tail'
" let g:airline_theme='tender'

" Emmet
let g:user_emmet_leader_key=','
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
Plug 'christoomey/vim-tmux-navigator'

call plug#end()

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'Yggdroot/indentLine'
Plugin 'eslint/eslint'

call vundle#end()            " required
filetype plugin indent on    " required

" indentLine
let g:indentLine_enabled = 1  
let g:indentLine_setColors = 1
let g:indentLine_char = '┆'
let g:indentLine_leadingSpaceEnabled = 0 
let g:indentLine_leadingSpaceChar = '·'
