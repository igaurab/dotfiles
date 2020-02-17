call plug#begin('~/.vim/plugged')
"Language Server
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'dense-analysis/ale'

"Git helpers
Plug 'tpope/vim-fugitive'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'

"Html
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}

"Utils
Plug 'scrooloose/nerdtree'

"Fuzzy Search
Plug 'junegunn/fzf.vim'
Plug 'ctrlpvim/ctrlp.vim'

Plug 'terryma/vim-multiple-cursors'
Plug 'mattn/emmet-vim'

"StatusLine and Tabline 
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'itchyny/lightline.vim'

"colorscheme and syntax highlight
Plug 'ap/vim-css-color'
Plug 'morhetz/gruvbox'
Plug 'dart-lang/dart-vim-plugin'
Plug 'chriskempson/base16-vim'

call plug#end()

