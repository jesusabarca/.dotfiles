call plug#begin('~/.local/share/nvim/plugged')
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rails'
  Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-dispatch'
  Plug 'airblade/vim-gitgutter'
  Plug 'mileszs/ack.vim'
  Plug 'jiangmiao/auto-pairs'
  Plug 'ajh17/vimcompletesme'
  Plug 'kshenoy/vim-signature'
  Plug 'nathanaelkane/vim-indent-guides'
  Plug 'janko-m/vim-test'
  Plug 'altercation/vim-colors-solarized'
  Plug 'itchyny/lightline.vim'
  Plug 'roxma/python-support.nvim'
  Plug 'scrooloose/nerdtree'
  Plug 'neomake/neomake'
  Plug 'vim-ruby/vim-ruby'
call plug#end()

" Auto-update files
set autoread
au CursorHold * checktime

" Solarized colorscheme config
set background=dark
colorscheme solarized

" Indentguides config
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=0
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_exclude_filetypes = ['help']
let g:indent_guides_start_level = 2

" Basic setup
if has('vim_starting') && !has('nvim') && &compatible
  set nocompatible                 " Be iMproved
endif
filetype on                        " Enable filetype detection
filetype plugin on                 " Enable filetype-specific plugins
filetype indent on                 " Enable filetype-specific indenting
set ruler                          " Show line and column number
syntax enable                      " Turn on syntax highlighting allowing local overrides
set path+=**                       " Fuzzy finder
set wildmenu                       " Command-line completion
set ttyfast                        " Speeds things up a little bit
compiler ruby                      " Enable compiler support for ruby

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

" Maps key - to move the current line down
map - ddp

" Maps key _ to move the current line up
map _ ddkP

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

" Faster scrolling
set lazyredraw

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

" Sets mappings for moving between tabs
nnoremap <C-b>h :tabp<CR>
nnoremap <C-b>l :tabn<CR>

inoremap <C-b>h <Esc>:tabp<CR>
inoremap <C-b>l <Esc>:tabn<CR>

vnoremap <C-b>h <Esc>:tabp<CR>
vnoremap <C-b>l <Esc>:tabn<CR>

tnoremap <C-b>h <c-\><c-n>:tabp<CR>
tnoremap <C-b>l <c-\><c-n>:tabn<CR>

" Lightline config
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'relativepath', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

" run NeoMake when writing a buffer.
" call neomake#configure#automake('rw')

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

" This new Sudow command is for writting changes as root
command Sudow :execute ':silent w !sudo tee % > /dev/null' | :edit!

" Toggle terminal split
let g:term_buf = 0
let g:term_win = 0

function! Term_toggle(width)
    if win_gotoid(g:term_win)
        hide
    else
        botright vnew
        exec "vertical resize " . a:width
        try
            exec "buffer " . g:term_buf
        catch
            call termopen($SHELL, {"detach": 0})
            let g:term_buf = bufnr("")
        endtry
        startinsert!
        let g:term_win = win_getid()
    endif
endfunction


nnoremap <leader>t :call Term_toggle(50)<cr>
tnoremap <leader>t <C-\><C-n>:call Term_toggle(50)<cr>

" Set update time for GitGutter to 100 ms
set updatetime=100

" Setup for the vim-test plugin
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
let test#strategy = 'neovim'

function! VagrantTransform(cmd) abort
  let vagrant_project = get(matchlist(s:cat('Vagrantfile'), '\vconfig\.vm.synced_folder ["''].+[''"], ["''](.+)[''"]'), 1)
  return 'vagrant ssh --command '.shellescape('cd '.vagrant_project.'; '.a:cmd)
endfunction

let g:test#custom_transformations = {'vagrant': function('VagrantTransform')}
let g:test#transformation = 'vagrant'

" NERDTree config
map <leader>n :NERDTreeToggle<CR>
let NERDTreeMinimalUI=1
let NERDTreeAutoDeleteBuffer=1
let NERDTreeQuitOnOpen=1
let NERDTreeAutoCenter=0

" Open NERDTree if no file was specified or if open over a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" Closes NERDTree if it's the only window left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Full config: when writing or reading a buffer, and on changes in insert and
" normal mode (after 1s; no delay when writing).
call neomake#configure#automake('nrwi', 500)
