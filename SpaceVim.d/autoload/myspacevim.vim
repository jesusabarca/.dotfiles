function! myspacevim#before() abort
  " Maps leader to ,
  let g:mapleader  = ','

  " Puts new splits below to the right
  set splitbelow
  set splitright

  " Indent line config
  augroup indentLine_config
    autocmd!

    let g:indentLine_char_list = ['┊', '¦']
  augroup END

  " Nord config
  augroup nord_config
    autocmd!

    let g:nord_uniform_diff_background = 1
    let g:nord_italic_comments = 1
    let g:nord_italic = 1
    let g:nord_underline = 1
  augroup END

  " Neomake
  augroup neomake_config
    autocmd!

    let g:neomake_open_list = 0
  augroup END

  " NERDTree config
  augroup nerdtree_config
    autocmd!

    let g:NERDTreeMinimalUI=1
    let g:NERDTreeAutoDeleteBuffer=1
    let g:NERDTreeQuitOnOpen=1
    let g:NERDTreeAutoCenter=0
    let g:NERDTreeShowLineNumbers=1
  augroup END

  " Terminal config
  augroup neovim_terminal
    autocmd!

    " Enter Terminal-mode (insert) automatically
    autocmd TermOpen * startinsert

    " Disables number lines on terminal buffers
    autocmd TermOpen * :set nonumber norelativenumber
  augroup END

  " Clipboard
  set clipboard+=unnamedplus

  " Auto-update files
  set autoread
  au CursorHold * checktime

  " Maps keys to toggle the current word's case while in normal mode
  call SpaceVim#custom#SPC('noremap', ['t', 'u'], 'viw~e', "toggle the current word's case", 0)

  " Usefull Git mappings mapping
  call SpaceVim#custom#SPC('noremap', ['g', 'D'], 'Git diff --staged', 'view git staged diff', 1)

  " Custom mapping for creating a new terminal tab
  call SpaceVim#custom#SPC('noremap', ['w', 't'], 'tabnew +terminal', 'create new terminal tab', 1)
endfunction
