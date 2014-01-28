"
" Reset
"

set nocp             "nocompatible: disable vi compatibility settings
let mapleader=','    "leader mapping needs to be here for bindings to work
set tf               "ttyfast: smooth changes
set noeb             "noerrorbells: no error bells
set novb             "novisualbell: no visual warning on errors
set mh               "mousehide: hide the mouse while typing
set sc               "showcmd: show executed commands
set hi=1000          "history: command history
set ul=1000          "undolevels: undo a thousand times
set wmnu             "wildmenu: tab completion when searching
set wig=*.swp,*.pyc  "wildignore: ignore some filetypes
set is               "incsearch: use incremental search
set scs		     "smartcase: ignore case when searching unless it's uppercase
set so=3             "scrolloff: do not move the cursor above/below this threshold
set cuc              "cursorcolumn: highlight the column of the cursor
set cul              "cursorline: highlight the line of the cursor
set et               "expandtab: no real tab (spaces used instead)
set sts=4            "softtabstop: number of spaces entered when tab is pressed
set sw=4             "shiftwidth: number of spaces deindented '<<' and indented with '>>'
set ai               "autoindent: use the built-in autoindent
set udf              "undofile: create undo files to undo/redo after reopening files
set nobk             "nobackup: do not create backups
set noswf            "noswapfile: do not create swap files
set pt=<F3>          "pastetoggle: toggle autoindenting (for when when pasting)
set nu               "number: show line numbers
set nuw=1            "numberwidth: minimum number column width
set tw=79            "textwidth: ensures that lines aren't too long
set cc=80            "colorcolumn: highlight a column
set nofen            "nofoldenable: disable folding
set hls              "hlsearch: highlight search matches
set sb               "splitbelow: open a new split below the current one
set spr              "splitright: open a new split on the right of the current one
set tm=500           "timeoutlen: delay before O works and leader commands can be used

"
" Vundle
"

" Settings
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()
Bundle 'gmarik/vundle'

" Colorscheme and syntax highlighting
Bundle 'altercation/vim-colors-solarized'
colorscheme solarized
set bg=dark
set t_Co=256
syntax enable

" Quickly navigate between lines
Bundle 'Lokaltog/vim-easymotion'
let g:EasyMotion_leader_key = '<Leader>'
hi link EasyMotionTarget WarningMsg
hi link EasyMotionShade  Comment

" Post a Gist without leaving Vim
Bundle 'mattn/webapi-vim'
Bundle 'mattn/gist-vim'
let g:gist_clip_command = 'pbcopy'
nnoremap <Leader>g :Gist<space>

" Filetype-specific colorscheme extensions
Bundle 'groenewege/vim-less'
Bundle 'kchmck/vim-coffee-script'
Bundle 'vim-ruby/vim-ruby'

" Quickly navigate within a line
Bundle 'goldfeld/vim-seek'

" Automaitcally insert end
Bundle 'tpope/vim-endwise'

" Github flavored markdown
Bundle 'jtratner/vim-flavored-markdown'

" Search for code within Vim
Bundle 'mileszs/ack.vim'

" Make it easier to tabularize code
Bundle 'godlygeek/tabular'

" Git wrapper
Bundle 'tpope/vim-fugitive'

" Show diff
Bundle 'airblade/vim-gitgutter'
hi SignColumn ctermbg=Black

" Open files with ease
Bundle 'kien/ctrlp.vim'

" Not used for now
"Bundle 'Valloric/YouCompleteMe'
"Bundle 'wting/gitsessions.vim'

" Set filetype to the correct value after all Vundle settings
filetype plugin indent on

"
" Autocommands
"

" Automatically remove trailing whitespace
au BufWritePre *.rb,*.py :%s/\s\+$//e

" Set indentation level to two spaces for the given filetypes
au FileType ruby,less,coffee,javascript,eruby,html setl sts=2 sw=2 tw=200
au FileType ruby setl fo-=r et
au FileType eruby,html setl tw=200

" Specific filetype resets
au BufNewFile,BufRead Gemfile,Guardfile,Vagrantfile,Rakefile set ft=ruby
au BufNewFile,BufRead *.less set ft=less
au BufNewFile,BufRead *.coffee set ft=coffee

" Automatically resize splits when window is resized
au VimResized * wincmd =

" Turn off paste mode when leaving insert mode
au InsertLeave * set nopaste

" Hide cursorline and cursorcolumn on inactive splits
au WinLeave * setl nocul nocuc
au WinEnter,BufRead * setl cul cuc

"
" Bindings
"

" More comfortable split switching
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

" Turn off highlighting after a search
nnoremap <silent> <Leader>h :noh<CR>

" Show a git diff for the open file (press q to quit)
nnoremap <silent> <Leader>d :!git diff %<CR><redraw>

" Shortcuts to split window
nnoremap _ :spl<space>
nnoremap <bar> :vsp<space>

" Equalize or maximize splits
nnoremap ,m <c-w>=
nnoremap ,M <c-w>_<c-w><bar>

" Resize splits
nnoremap <up> <c-w>+
nnoremap <down> <c-w>-
nnoremap <left> <c-w><
nnoremap <right> <c-w>>

" Visual indenting/deindenting with tabs
xmap <Tab> >
xmap <s-tab> <

" Retain visual select after indenting or deindenting
xnoremap < <gv
xnoremap > >gv

" Repeat command on every line
xnoremap . :normal.<cr>

" Repeat macro on every line
xnoremap @ :normal@

" Enter a new line with enter in normal mode
nnoremap <enter> i<enter>

" Remove a character with backspace in normal mode
nnoremap <backspace> i<backspace><right><esc>

" Add a space with space in normal mode
nnoremap <space> i<space><right><esc>
