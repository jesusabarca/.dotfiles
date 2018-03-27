call plug#begin('~/.local/share/nvim/plugged')
Plug 'ngmy/vim-rubocop'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'
Plug 'mileszs/ack.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'sheerun/vim-polyglot'
Plug 'janko-m/vim-test'
Plug 'ervandew/supertab'
Plug 'troydm/zoomwintab.vim'
Plug 'kshenoy/vim-signature'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neomake/neomake'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
call plug#end()

" Activates indent plugin and filetype detection
filetype plugin indent on

" Auto-update files
set autoread
au CursorHold * checktime

" Sets the term cursor red to be easily distinguished from the editor cursor
" which is white.
highlight TermCursor ctermfg=red guifg=red

" Indentguides config
colorscheme default
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red ctermbg=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=red ctermbg=0
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']
let g:indent_guides_default_mapping = 0

" Basic setup
if has('vim_starting') && !has('nvim') && &compatible
  set nocompatible               " Be iMproved
endif
set ruler                          " Show line and column number
syntax enable                      " Turn on syntax highlighting allowing local overrides
let g:polyglot_disabled = ['ruby'] " Disables Ruby highlighting from Polyglot
set path+=**                       " Fuzzy finder
set wildmenu                       " command-line completion
set ttyfast                        " Speeds things up a little bit

" Whitespace
set nowrap                        " don't wrap lines
set tabstop=2                     " a tab is two spaces
set shiftwidth=2                  " an autoindent (with <<) is two spaces
set expandtab                     " use spaces, not tabs
set list                          " Show invisible characters
set backspace=indent,eol,start    " backspace through everything in insert mode

" List chars
set listchars=""                  " Reset the listchars
set listchars=tab:\ \             " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=extends:>          " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
set listchars+=precedes:<         " The character to show in the last column when wrap is
                                  " off and the line continues beyond the left of the screen

" Remember last location in file, but not for commit messages.
" see :help last-position-jump
au BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$")
  \| exe "normal! g`\"" | endif

" Puts new splits below to the right
set splitbelow
set splitright

" Maps leader to ,
let mapleader = ","

" Fixes the copy to system's clipboard
set clipboard+=unnamedplus

" Maps ESC to scape from Terminal's insert mode
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
endif

" Sets all the .conf files to the right filetype
autocmd BufRead,BufNewFile *.conf setfiletype conf

" Set syntax highlighting for specific file types
autocmd BufRead,BufNewFile Appraisals setfiletype ruby
autocmd BufRead,BufNewFile *.prawn setfiletype ruby
autocmd BufRead,BufNewFile *.md setfiletype markdown

" Set hybrid relative line numbers
set number relativenumber

" Uses new Regex engine for faster syntax highlighting
set re=1

" Sets the cursorline
set cursorline
highlight clear CursorLine
highlight CursorLine gui=underline ctermbg=0

" Integrate AG (Silver Searcher) with ack.vim
let g:ackprg = 'ag --nogroup --nocolor --column'

" bind leader+F to Ack + AG word under cursor
nnoremap <leader>F :Ack! --word-regexp "<C-R><C-W>"<CR>:cw<CR>

" Sets mappings for moving between splits
nnoremap <C-h> <c-w>h
nnoremap <C-j> <c-w>j
nnoremap <C-k> <c-w>k
nnoremap <C-l> <c-w>l

inoremap <C-h> <Esc><c-w>h
inoremap <C-j> <Esc><c-w>j
inoremap <C-k> <Esc><c-w>k
inoremap <C-l> <Esc><c-w>l

vnoremap <C-h> <Esc><c-w>h
vnoremap <C-j> <Esc><c-w>j
vnoremap <C-k> <Esc><c-w>k
vnoremap <C-l> <Esc><c-w>l

tnoremap <C-h> <c-\><c-n><c-w>h
tnoremap <C-j> <c-\><c-n><c-w>j
tnoremap <C-k> <c-\><c-n><c-w>k
tnoremap <C-l> <c-\><c-n><c-w>l

" Set mappings for vim-test
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>

" Setup for the vim-test plugin
let test#strategy = 'dispatch'

" Airline!
let g:airline_powerline_fonts = 1
let g:airline_theme='solarized'
let g:airline_solarized_bg = "dark"
let g:airline#extensions#tabline#enabled = 1
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" run NeoMake when writing a buffer.
call neomake#configure#automake('rw')

" Map ctrl-b + c to open a new tab window
nnoremap <C-b>c :tabnew +terminal<CR>

" Map ctrl-b + c to open a new horizontal split with a terminal
nnoremap <C-b>" :new +terminal<CR>

" Map ctrl-b + c to open a new vertical split with a terminal
nnoremap <C-b>% :vnew +terminal<CR>

" Enter Terminal-mode (insert) automatically
autocmd TermOpen * startinsert

" Disables number lines on terminal buffers
autocmd TermOpen * :set nonumber norelativenumber

" NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <Leader>n :NERDTreeToggle<CR>
let NERDTreeMinimalUI=1
let NERDTreeHighlightCursorline=0
let NERDTreeQuitOnOpen=1
let NERDTreeAutoDeleteBuffer=1

" This new Sudow command is for writting changes as root
command Sudow :execute ':silent w !sudo tee % > /dev/null' | :edit!
