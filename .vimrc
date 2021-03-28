syntax on
set nocompatible
set encoding=UTF-8
set mouse=a
filetype off
syntax enable
autocmd BufEnter * lcd %:p:h

set background=dark " or light if you prefer the light version
let g:two_firewatch_italics=1
colorscheme two-firewatch
highlight Comment cterm=italic

let g:airline_theme='twofirewatch'

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



" Vim rooter
let g:rooter_targets = '*'
let g:rooter_patterns = ['=src', '.git']


" Disable highlighting autopairs
" let g:loaded_matchparen=1

" autopair
let g:AutoPairsFlyMode = 1

" coc
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ ]

nmap <silent> gd <Plug>(coc-definition)

" prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" tmux
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
nnoremap <silent> <C-/> :TmuxNavigatePrevious<cr>

"NERDTree sizing
let g:NERDTreeWinSize=40

"NERDTree ignore
let g:NERDTreeIgnore = ['^node_modules$']
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

" Start NERDTree, unless a file or session is specified, eg. vim -S session_file.vim.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') && v:this_session == '' | NERDTree | endif

" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

"NERDTree git plugin
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

" ariline
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_theme='tender'

" Emmet
let g:user_emmet_leader_key=','
let g:javascript_plugin_jsdoc = 1

" Python, JavaScript, Go
let g:kite_supported_languages = ['python', 'javascript', 'go']

" devicons
let g:airline_powerline_fonts = 1
let g:webdevicons_enable_airline_statusline = 1
let g:webdevicons_enable_airline_tabline = 1

" Vim Javascript
let g:javascript_plugin_jsdoc = 1

" React snippets
let g:UltiSnipsExpandTrigger="<C-l>"

" Easymotion
let mapleader=" "
map <Leader>s <Plug>(easymotion-s2)

call plug#begin()

Plug 'jacoborus/tender.vim'
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
Plug 'ryanoasis/vim-devicons'
Plug 'mattn/emmet-vim'
Plug 'https://github.com/AndrewRadev/tagalong.vim'
Plug 'larsbs/vimterial_dark'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
Plug 'arcticicestudio/nord-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'flrnprz/plastic.vim'
Plug 'epilande/vim-react-snippets'
Plug 'SirVer/ultisnips'
Plug 'christoomey/vim-tmux-navigator'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'easymotion/vim-easymotion'
Plug 'jiangmiao/auto-pairs'

call plug#end()

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'Yggdroot/indentLine'
Plugin 'larsbs/vimterial_dark'
Plugin 'othree/yajs.vim'
Plugin 'othree/html5.vim'
Plugin 'https://github.com/HerringtonDarkholme/yats.vim/'
Plugin 'mhartington/oceanic-next'
Plugin 'eslint/eslint'
Plugin 'https://github.com/othree/javascript-libraries-syntax.vim'
Plugin 'https://github.com/rakr/vim-two-firewatch'

call vundle#end()            " required
filetype plugin indent on    " required

" Javascrip libraries syntax
let g:used_javascript_libs = 'react, jasmine, vue, handlebars, jquery'


" indentLine

let g:indentLine_enabled = 1  
let g:indentLine_setColors = 1
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

" FZF

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

map <C-f> :Files<CR>
map <leader>b :Buffers<CR>
nnoremap <leader>g :Rg<CR>
nnoremap <leader>t :Tags<CR>
nnoremap <leader>m :Marks<CR>


let g:fzf_tags_command = 'ctags -R'
" Border color
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.6,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } }

let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'
let $FZF_DEFAULT_COMMAND="rg --files --hidden"

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }


"Get Files
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)

" Get text in files with Rg
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

" Ripgrep advanced
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" Git grep
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)
