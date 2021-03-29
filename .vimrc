" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
      \ quit | endif

"Map NERDTreeToggle to ctrl t
nnoremap <C-t> :NERDTreeToggle<CR>

"Set line number on
set number

"set the gutter width
set numberwidth=3

set ignorecase
set smartcase

set tabstop=2
set shiftwidth=2
set shiftround
set sts=2
set expandtab
set backspace=indent,eol,start
set mouse=a
set noswapfile

"Set the arrow keys to not work
noremap <Up> <Nop>
noremap <Down> <Nop> 
noremap <Left> <Nop> 
noremap <Right> <Nop>

"Set the keymap for cycling through buffers
:nnoremap <C-n> :bnext<CR>
:nnoremap <C-p> :bprevious<CR>

"Setup for eslint with syntastic
set laststatus=2
set statusline+=\ %P
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe = 'npm run lint --'

"Colors for youcomepleteme
hi Pmenu ctermfg=233 ctermbg=249 guibg=#b2b2b2 guifg=#121212 
hi PmenuSel ctermfg=251 ctermbg=240 guibg=#585858 guifg=#262626

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

"Surround plugin
Plug 'tpope/vim-surround'

" Make sure you use single quotes
"Todo List
Plug 'aserebryakov/vim-todo-lists'

Plug 'arcticicestudio/nord-vim'

"Airline
Plug 'vim-airline/vim-airline'

"YCM
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --all' }

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'

"Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'

"Sysntastic for eslink
Plug 'vim-syntastic/syntastic'

"UtilSnips
" Track the engine.
Plug 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

" One half theme
Plug 'sonph/onehalf', { 'rtp': 'vim' }

" Initialize plugin system
call plug#end()

" Trigger configuration. Do not use <tab> if you use 
" https://github.com/Valloric/YouCompleteMe.
" You complete me
" Start autocompletion after 4 chars
let g:ycm_min_num_of_chars_for_completion = 4
let g:ycm_min_num_identifier_candidate_chars = 4
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]

" Don't show YCM's preview window [ I find it really annoying ]
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0

"UltiSnips
"let g:UltiSnipsExpandTrigger="<c-space>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetDir = "~/.vim/plugged/vim-snippets/snippets"

" If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"

"Set nerdtree size
let g:NERDTreeWinSize=20

syntax enable
set t_Co=256
set cursorline
colorscheme onehalfdark
let g:airline_theme='onehalfdark'
" lightline
" let g:lightline = { 'colorscheme': 'onehalfdark' }

" Add true colors
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
