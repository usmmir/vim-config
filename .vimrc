color desert
set laststatus=2
set number
set mouse=a
set clipboard=unnamedplus
"set t_Co=256
 
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
 
set showtabline=2
set noshowmode "hide default mode text ( e.g. -- INSERT -- Below the status line )"
"Removes Nerdtree vertical split
highlight VertSplit ctermfg=0 
"Removes Signify (git) gray column
highlight SignColumn ctermbg=NONE cterm=NONE guibg=NONE gui=NONE
"Hides ~ for end of line / not used lined
highlight EndOfBuffer ctermfg=black ctermbg=black
 
"ALE pre load
let g:ale_completetion_enabled = 1
 
call plug#begin('~/./vim/plugged')
 
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'pearofducks/ansible-vim', { 'do': 'cd ./UltiSnips; ./generate.py' }
Plug 'jiangmiao/auto-pairs'
Plug 'w0rp/ale'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-signify'
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'

call plug#end()
 
let NERDTreeShowHidden=1
map <F2> :NERDTreeToggle<CR>
let NERDTreeShowBookmarks=1
let NERDTreeChDirMode=2
 
 
"ansible-vim configs
au BufRead,BufNewFile */Playbooks/*.yml set filetype=yaml.ansible
 
let g:ansible_unindent_after_newline = 1
let g:ansible_attribute_highlight = "ob"
"let g:ansible_name_highlight = 'ob'
 
"Auto pairs
let g:AutoPairsShortcutFastWrap=''
 
"ALE
"let g:ale_sign_warning='>'
let g:ale_fixers = {
\    'ansible': ['yamlfix', 'trim_whitespace']
\    }
 
"signify
let g:signify_vcs_list = [ 'git' ]
 
"fzf and ripgrep
"set grepprg=rg\ --vimgrep\ --smart-case\ --hidden\ --follow\ --no-ignore-vcs

let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'tabline': {
      \   'left': [ ['buffers'] ],
      \   'right': [ ['close'] ]
      \ },
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers'
      \ },
      \ 'component_type': {
      \   'buffers': 'tabsel'
      \ }
      \ }
let g:lightline#bufferline#show_number  = 1
let g:lightline#bufferline#shorten_path = 2

