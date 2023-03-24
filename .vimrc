set number	       " Show line numbers
set showbreak=+++	 " Wrap-broken line prefix
set showmatch	     " Highlight matching brace
set visualbell	   " Use visual bell (no beeping)
set noswapfile     " Disable swap files

set hlsearch	" Highlight all search results
set ignorecase	" Always case-insensitive
set incsearch	" Searches for strings incrementally

set autoindent	" Auto-indent new lines
set expandtab	" Use spaces instead of tabs
set smartindent	" Enable smart-indent
set smarttab	" Enable smart-tabs
set shiftwidth=2	" Number of auto-indent spaces
set softtabstop=2	" Number of spaces per Tab

set ruler	" Show row and column ruler information

set undolevels=1000	" Number of undo levels
set backspace=indent,eol,start	" Backspace behaviour

set autoread " refresh files if vim is unchanged

set updatetime=350 " update gitgutter and other things this often
let g:gitgutter_map_keys = 0

syntax on
filetype plugin on
filetype plugin indent on

setlocal formatoptions-=tc

colorscheme murphy

highlight clear SignColumn
" highlight Normal ctermbg=NONE guibg=NONE
" highlight NonText ctermbg=NONE guibg=NONE
