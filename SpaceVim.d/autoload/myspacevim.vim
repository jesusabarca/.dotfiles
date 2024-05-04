function! myspacevim#before() abort
  augroup neovim_terminal
    autocmd!
    call SpaceVim#custom#SPC('nnoremap', ['w', 't'], 'tabnew +terminal', 'create new terminal tab', 1)
    " Enter Terminal-mode (insert) automatically
    autocmd TermOpen * startinsert
    " Disables number lines on terminal buffers
    autocmd TermOpen * :set nonumber norelativenumber
    " allows you to use Ctrl-c on terminal window
    autocmd TermOpen * nnoremap <buffer> <C-c> i<C-c>
  augroup END
endfunction

function! myspacevim#after() abort
  tnoremap <Esc> <C-\><C-n>
  set clipboard+=unnamedplus
  set noswapfile

  " Puts new splits below to the right
  set splitbelow
  set splitright

  " Nord config
  augroup nord_config
    autocmd!

    let g:nord_uniform_diff_background = 1
    let g:nord_italic_comments = 1
    let g:nord_italic = 1
    let g:nord_underline = 1
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
endfunction
