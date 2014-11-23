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
set backspace=indent,eol,start "fix not being able to delete with backspace in insert mode

"
" Vundle
"

" Settings
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

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
nmap s <Plug>(easymotions2)
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion

" Quick save
nnoremap <Leader>, :w<CR>
nnoremap <Leader>. :wq<CR>

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

Bundle 'guns/vim-clojure-static'

Bundle 'rizzatti/dash.vim'

Bundle 'digitaltoad/vim-jade'

Bundle 'wincent/command-t'
set wildignore+=*~
set wildignore+=node_modules/**
set wildignore+=bower_components/**

Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'garbas/vim-snipmate'
Bundle 'honza/vim-snippets'


" Not used for now
"Bundle 'Valloric/YouCompleteMe'
"Bundle 'wting/gitsessions.vim'

call vundle#end()

" Set filetype to the correct value after all Vundle settings
filetype plugin indent on

"
" Autocommands
"

" Automatically remove trailing whitespace
"au BufWritePre *.rb,*.py,*.js :%s/\s\+$//e

" Set indentation level to two spaces for the given filetypes
au FileType ruby,less,coffee,javascript,eruby,html,jade,sass,scss,css setl sts=2 sw=2 tw=200
au FileType ruby setl fo-=r et
au FileType eruby,html setl tw=200
au FileType tex setl tw=300

" Specific filetype resets
au BufNewFile,BufRead Gemfile,Guardfile,Vagrantfile,Rakefile,config.ru set ft=ruby
au BufNewFile,BufRead *.jade set ft=jade
au BufNewFile,BufRead *.less set ft=less
au BufNewFile,BufRead *.coffee set ft=coffee
au BufNewFile,BufRead *.clj set ft=clojure
au BufNewFile,BufRead *.md set ft=markdown
au BufNewFile,BufRead *.jade set ft=jade

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

" Show a git diff for the current directory
nnoremap <silent> <Leader>D :!git diff<CR><redraw>

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

"
" Other
"

" Fix loading JVM when using JRuby
if !empty(matchstr($MY_RUBY_HOME, 'jruby'))
  let g:ruby_path = join(split(glob($MY_RUBY_HOME.'/lib/ruby/*.*')."\n".glob($MY_RUBY_HOME.'/lib/rubysite_ruby/*'),"\n"),',')
endif
