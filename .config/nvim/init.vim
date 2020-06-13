"Source Files
source ~/dotfiles/.config/nvim/settings.vim
source ~/dotfiles/.config/nvim/keybindings.vim
source ~/dotfiles/.config/nvim/vimplug.vim
source ~/dotfiles/.config/nvim/cocConf.vim
source ~/dotfiles/.config/nvim/color_scheme.vim

"Make calcurse notes markdown compatible:
autocmd BufRead,BufNewFile /tmp/calcurse* set filetype=markdown
autocmd BufRead,BufNewFile ~/.calcurse/notes/* set filetype=markdown

"Folding
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview
autocmd FileType json syntax match Comment +\/\/.\+$+

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_winsize = 20
" _   _                       _                   
"| |_| |__   ___ _ __ ___  __| | ___ __ _ _ __  
"| __| '_ \ / _ \ '__/ _ \/ _` |/ __/ _` | '_ \    Website: gaurabpanthee.com.np
"| |_| | | |  __/ | |  __/ (_| | (_| (_| | |_) |   Email:   gaurabpanthee@gmail.com
" \__|_| |_|\___|_|  \___|\__,_|\___\__,_| .__/    Twitter: @igaurab
"                                        |_|    
"                                       
