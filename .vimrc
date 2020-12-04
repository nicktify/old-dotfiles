syntax on
set nocompatible
set encoding=UTF-8

let g:coc_disable_startup_warning = 1


set list listchars=tab:❘-,trail:·,extends:»,precedes:«,nbsp:×
colorscheme iceberg
let g:monokai_term_italic = 1
set termguicolors
set tabstop=4
"set smartindent
set shiftwidth=4
set expandtab
set number relativenumber
"set showcmd
set wrap
set textwidth=80
"set wildmenu
set showmatch
"set incsearch
"set hlsearch
"set foldenable
"set foldmethod=indent

"Ale Lint
"let b:ale_fixers = ['prettier', 'eslint']

" NERDTree git plugin
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }

map <C-n> :NERDTreeToggle<CR>
map <C-h> :tabprevious<CR>
map <C-l> :tabnext<CR>
map <C-c> :tabclose<CR>

" ariline
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_theme='minimalist'

" Emmet
let g:user_emmet_leader_key=','

let g:javascript_plugin_jsdoc = 1

" Python, JavaScript, Go
let g:kite_supported_languages = ['python', 'javascript', 'go']

" devicons
let g:airline_powerline_fonts = 1
let g:webdevicons_enable_airline_statusline = 1
let g:webdevicons_enable_airline_tabline = 1


call plug#begin()


Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin' |
            \ Plug 'ryanoasis/vim-devicons'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'crusoexia/vim-monokai'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dense-analysis/ale'
Plug 'ryanoasis/vim-devicons'
Plug 'mattn/emmet-vim'
Plug 'https://github.com/AndrewRadev/tagalong.vim'

call plug#end()



set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'ap/vim-css-color'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line

" Plugins installed by myself

Plugin 'jiangmiao/auto-pairs'
Plugin 'Yggdroot/indentLine'

call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" Auto Pairs

let g:AutoPairsFlyMode = 0
let g:AutoPairsShortcutBackInsert = '<M-b>'


" indentLine

let g:indentLine_enabled = 0
let g:indentLine_setColors = 0
let g:indentLine_char = '┆'
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_leadingSpaceChar = '·'
let g:indentLine_fileTypeExclude = ['nerdtree']




" Dev Icons
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable_unite = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1


let g:sol = {
			\"gui": {
				\"base03": "#002b36",
				\"base02": "#073642",
				\"base01": "#586e75",
				\"base00": "#657b83",
				\"base0": "#839496",
				\"base1": "#93a1a1",
				\"base2": "#eee8d5",
				\"base3": "#fdf6e3",
				\"yellow": "#b58900",
				\"orange": "#cb4b16",
				\"red": "#dc322f",
				\"magenta": "#d33682",
				\"violet": "#6c71c4",
				\"blue": "#268bd2",
				\"cyan": "#2aa198",
				\"green": "#719e07"
			\},
			\"cterm": {
				\"base03": 8,
				\"base02": 0,
				\"base01": 10,
				\"base00": 11,
				\"base0": 12,
				\"base1": 14,
				\"base2": 7,
				\"base3": 15,
				\"yellow": 3,
				\"orange": 9,
				\"red": 1,
				\"magenta": 5,
				\"violet": 13,
				\"blue": 4,
				\"cyan": 6,
				\"green": 2
			\}
		\}





function! DeviconsColors(config)
			let colors = keys(a:config)
			augroup devicons_colors
				autocmd!
				for color in colors
					if color == 'normal'
						exec 'autocmd FileType nerdtree,startify if &background == ''dark'' | '.
							\ 'highlight devicons_'.color.' guifg='.g:sol.gui.base01.' ctermfg='.g:sol.cterm.base01.' | '.
							\ 'else | '.
							\ 'highlight devicons_'.color.' guifg='.g:sol.gui.base1.' ctermfg='.g:sol.cterm.base1.' | '.
							\ 'endif'
					elseif color == 'emphasize'
						exec 'autocmd FileType nerdtree,startify if &background == ''dark'' | '.
							\ 'highlight devicons_'.color.' guifg='.g:sol.gui.base1.' ctermfg='.g:sol.cterm.base1.' | '.
							\ 'else | '.
							\ 'highlight devicons_'.color.' guifg='.g:sol.gui.base01.' ctermfg='.g:sol.cterm.base01.' | '.
							\ 'endif'
					else
						exec 'autocmd FileType nerdtree,startify highlight devicons_'.color.' guifg='.g:sol.gui[color].' ctermfg='.g:sol.cterm[color]
					endif
					exec 'autocmd FileType nerdtree,startify syntax match devicons_'.color.' /\v'.join(a:config[color], '|').'/ containedin=ALL'
				endfor
			augroup END
		endfunction
		let g:devicons_colors = {
			\'normal': ['', '', '', '', ''],
			\'emphasize': ['', '', '', '', '', '', '', '', '', '', ''],
			\'yellow': ['', '', ''],
			\'orange': ['', '', '', 'λ', '', ''],
			\'red': ['', '', '', '', '', '', '', '', ''],
			\'magenta': [''],
			\'violet': ['', '', '', ''],
			\'blue': ['', '', '', '', '', '', '', '', '', '', '', '', ''],
			\'cyan': ['', '', '', ''],
			\'green': ['', '', '', '']
		\}
		call DeviconsColors(g:devicons_colors)
