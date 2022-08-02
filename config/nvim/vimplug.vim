call plug#begin('$HOME/.local/share/nvim/vimplug/')
"language server
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'turbio/bracey.vim'
"plug 'dense-analysis/ale'
Plug 'gruvbox-community/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'sonph/onehalf'
"git helpers
Plug 'tpope/vim-fugitive'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'vifm/vifm'

"language
Plug 'rstacruz/sparkup', {'rtp': 'vim/'} "for html
Plug 'sheerun/vim-polyglot'
Plug 'dart-lang/dart-vim-plugin'
Plug 'natebosch/vim-lsc'
Plug 'natebosch/vim-lsc-dart'
"plug 'dense-analysis/ale'

"utils
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'

"fuzzy search
Plug 'junegunn/fzf.vim'
Plug 'ctrlpvim/ctrlp.vim'

"plug 'terryma/vim-multiple-cursors'
Plug 'mattn/emmet-vim'

"statusline and tabline 
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
"colorscheme and syntax highlight
Plug 'ap/vim-css-color'
"Plug 'yggdroot/indentline'
Plug 'ayu-theme/ayu-vim'
Plug 'mhinz/vim-startify'
Plug 'dart-lang/dart-vim-plugin'
Plug 'junegunn/goyo.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
call plug#end()

