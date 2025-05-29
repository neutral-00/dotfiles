" Set Leader
let mapleader = " "
" reload config
nnoremap <leader>r :source ~/.vimrc<Cr>
" enable mouse
set mouse=a
" use system clipboard for copy and paste
set clipboard+=unnamedplus
" see line number
set number
" tab width and indentation
set tabstop=4
set shiftwidth=4
set expandtab
" use jj to switch to normal mode 
inoremap <silent> jj <Esc>:update<CR>
inoremap <silent> jk <Esc>:update<CR>
nnoremap <silent> jk <Esc>:update<CR>
" use ctrl-s to q!
inoremap <C-S> <Esc>:update<CR>g
nnoremap <silent> <C-S> :update<CR>
" [n]ew [t]ab
nnoremap <leader>tn :tabnew<CR>
" close/[x] [t]ab
nnoremap <leader>tx :q!<CR>	
" Title Case the current Line
nnoremap <leader>tc :s/\<\(\w\)\(\w*\)\>/\u\1\L\2/g<CR>:nohlsearch<CR>
" set wildmenu for tab completions in command mode
set wildmenu
" set cursor style in normal mode and insert mode
	let &t_SI = "\e[5 q"
	let &t_EI = "\e[1 q"
	let &t_SR = "\e[5 q"
	let &t_ER = "\e[1 q"
" for copy to work in :E
let g:netrw_localcopycmd=""
let g:netrw_localmovecmd="move"
" ignore whitespace during file comparison
set diffopt+=iwhite
" netrw options for file explorer
let g:netrw_liststyle = 3       " Start in tree view mode
let g:netrw_banner = 0          " Disable the banner at the top
let g:netrw_altv = 1            " Open files in vertical splits by default
let g:netrw_winsize = 75        " Set the width of the netrw window
let g:netrw_preview = 1
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1
" for opening links in browser
let g:netrw_browsex_viewer="chrome"
let g:netrw_browsex_viewer="start"  " Windows (Git Bash uses 'start' internally)
" confirm before copy/delete/move
let g:netrw_localcopycmd = "cp"
let g:netrw_localmovecmd = "mv"
set splitbelow " force horizontal splits below current window
set splitright " force horizontal splits right current window
set nowritebackup		" don't create backup file and 
set noswapfile
" Search behavior
set hlsearch
set ignorecase
set smartcase
set incsearch
noremap <leader>nh :nohlsearch<CR>
" insert comment for .vimrc
nnoremap <Leader>c I"<Esc>
" Esc twice to exit terminal mode
tnoremap <Esc><Esc> <C-\><C-n>
" retain visual mode while indenting
vnoremap < <gv
vnoremap > >gv
" folding behavior
set foldenable
set foldmethod=marker

" Copy just the filename
nnoremap <leader>yy :let @+ = expand('%:t')<CR>
" Copy the relative path
nnoremap <leader>yr :let @+ = expand('%:.')<CR>
" Copy the absolute path
nnoremap <leader>yf :let @+ = expand('%:p')<CR>



" move lines in visual mode 
vnoremap <leader>j :m '>+1<CR>gv=gv
vnoremap <leader>k :m '<-2<CR>gv=gv

" quit
nnoremap <leader>q :q<CR>



" ------------------- Plugins ------------------------
set runtimepath+=~/vimfiles
call plug#begin('~/.vim/plugged')
" Plugin list
"Plug 'sainnhe/everforest'
Plug 'arcticicestudio/nord-vim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/seoul256.vim'
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Plugin with custom directory and name
Plug 'junegunn/vim-easy-align', { 'dir': '~/plugins/vim-easy-align', 'as': 'vim-easy-align' }
Plug 'christoomey/vim-tmux-navigator'
call plug#end()


" -- vim-visual-multi keymappings
"  C-n
"
"  -- vim-easy-motion keymappings
"  generally follow <leader><leader> and a vim motion
" search with a letter forward : <leader><leader>f
" search with a letter backward : <leader><leader>F
" search with a letter both side : <leader><leader>s
" search with a letter until forward : <leader><leader>t
map <leader><leader>2f <Plug>(easymotion-overwin-f2)
" search up and down with 2 chars
map <leader><leader>2s <Plug>(easymotion-s2)
" search up with 2 chars
map <leader><leader>2F <Plug>(easymotion-F2)
" search on same line with 2 chars
map <leader><leader>2ls <Plug>(easymotion-sl2)
" -- end of vim-easy-motion-----------------------------------

" -- Colorscheme --
if has('termguicolors')
  set termguicolors
endif
" For dark version.
set background=dark
"colorscheme everforest
colorscheme nord
" -- End of Color Scheme --

" -- NerdTree --
" -- Turn off netwr and its plugins
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1
" Open nerdtree when vim is launched without any file as param
autocmd VimEnter * if isdirectory(expand('%'))
      \ | execute 'NERDTree'
      \ | wincmd p
      \ | endif
" toggle file explorer
nnoremap <leader>ee :NERDTreeToggle<CR>
" reveal current file in file explorer
nnoremap <leader>ef :NERDTreeFind<CR>
" for file/directory operations - navigate to the directory and press m
" -- End of NerdTree --

" -- fzf --
" fuzzy find files in cwd
nnoremap <leader>ff :Files<CR>



