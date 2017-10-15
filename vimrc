" Sets the term cursor red to be easily distinguished from the editor cursor
" which is white.
highlight TermCursor ctermfg=red guifg=red

colorscheme default
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=red ctermbg=0
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']
let g:indent_guides_default_mapping = 0

" Basic setup
if has('vim_starting') && !has('nvim') && &compatible
  set nocompatible               " Be iMproved
endif

set number            " Show line numbers
set ruler             " Show line and column number
syntax enable         " Turn on syntax highlighting allowing local overrides

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

" File types
filetype plugin indent on

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

" Set relative line numbers
set relativenumber

" Sets all the .conf files to the right filetype
autocmd BufRead,BufNewFile *.conf setfiletype conf

" Set syntax highlighting for specific file types
autocmd BufRead,BufNewFile Appraisals setfiletype ruby
autocmd BufRead,BufNewFile *.prawn setfiletype ruby
autocmd BufRead,BufNewFile *.md setfiletype markdown

" Sets the cursorline
set cursorline
highlight clear CursorLine
highlight CursorLine gui=underline ctermbg=0

" Integrate AG (Silver Searcher) with ack.vim
let g:ackprg = 'ag --nogroup --nocolor --column'

" bind leader+F to Ack + AG word under cursor
nnoremap <leader>F :Ack! --word-regexp "<C-R><C-W>"<CR>:cw<CR>

" Sets mappings for moving between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Sets colors for terminals
let $PS1='\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ '
let $CLICOLOR=1
let $LSCOLORS='GxFxCxDxBxegedabagaced'

" NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <Leader>n :NERDTreeToggle<CR>


" Set mappings for vim-test
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>Ta :TestSuite<CR>

" Setup for the vim-test plugin
let test#strategy = 'dispatch'

" Airline!
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_theme='solarized'
let g:airline_solarized_bg = "dark"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

call plug#begin('~/.local/share/nvim/plugged')
Plug 'ngmy/vim-rubocop'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-commentary'
Plug 'mileszs/ack.vim'
Plug 'vim-syntastic/syntastic'
Plug 'jiangmiao/auto-pairs'
Plug 'sheerun/vim-polyglot'
Plug 'janko-m/vim-test'
Plug 'tpope/vim-dispatch'
Plug 'ervandew/supertab'
Plug 'troydm/zoomwintab.vim'
Plug 'kshenoy/vim-signature'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()
