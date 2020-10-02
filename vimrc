" --------------------
" PACKAGES
" --------------------
let g:vimsyn_embed=0

"  Thoughtbot Upcase Videos
"autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))
imap jk <Esc>
imap kj <Esc>
imap <space><space> <Esc>

" trying to stop vim from slowing down when it's been open for a while
" copying visually selected code into clipboard:
set clipboard=unnamed
set mouse=a

" ale
let g:ale_linters = {
      \   'javascript': ['eslint','stylelint'],
      \   'typescript': ['tslint'],
      \   'python': ['flake8', 'pylint']
      \ }
let g:ale_fixers = {
      \   'markdown': ['trim_whitespace'],
      \   'javascript': ['eslint', 'remove_trailing_lines', 'trim_whitespace'],
      \   'typescript': ['tslint','remove_trailing_lines', 'trim_whitespace'],
      \   'python': ['autopep8', 'yapf', 'remove_trailing_lines', 'trim_whitespace']
      \}
let g:ale_fix_on_save = 1
let g:ale_lint_delay = 1000
let g:ale_completion_enabled = 1
let g:ale_ruby_rails_best_practices_executable = 'bundle'
let g:ale_ruby_rubocop_executable = 'bundle'

nmap <silent> [r <Plug>(ale_previous_wrap)
nmap <silent> ]r <Plug>(ale_next_wrap)

set updatetime=1000
" automatically update files that change due to e.g. switching branch, that I have not yet edited
set autoread

" autocmd CursorHold * call ale#Queue(0)
" autocmd CursorHoldI * call ale#Queue(0)
" autocmd InsertLeave * call ale#Queue(0)
" autocmd TextChanged * call ale#Queue(0)
let g:ale_lint_on_text_changed = 0

" ctrlp
" use silver_searcher for lookup
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g "" '
endif
let g:ctrlp_use_caching = 0
let g:ctrlp_open_new_file = 'v'
let g:ctrlp_open_multiple_files = 'v'
set timeoutlen=300 " reduce wait time for amigigous chars
set ttimeoutlen=0 " reduce wait time for amigigous chars

" jshint
" only check syntax on write
let JSHintUpdateWriteOnly = 1

" silver_searcher
let g:ackprg = 'ag --nogroup --nocolor --column'

" --------------------
" APPEARANCE
" --------------------
syntax enable
colorscheme solarized
" switch background
if has('gui_running')
  set background=light
else
  set background=dark
endif

" make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1
highlight ColorColumn ctermbg=235 guibg=#2c2d27

" --------------------
" CONFIG
" --------------------
imap <c-space> <c-x><c-o>
" save
nmap <c-f> :w<cr>,r
imap <c-f> <esc>:w<cr>l,r
" quit
nmap <c-g> :q<cr>
imap <c-g> <esc>:q<cr>
let g:bufferline_echo = 0 " don't show standard budder

" disable the arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

"exit search highlighting on entering insert mode
nnoremap i :noh<cr>i

" map semi-colon to colon
nmap ; :
filetype on " Enable filetype detection
filetype indent on " Enable filetype-specific indenting
filetype plugin on " Enable filetype-specific plugins

set autoindent
set backspace=indent,eol,start " backspace for dummys
set backupdir=/tmp/
set complete+=kspell
set directory=/tmp " don't clutter my dirs up with swp and tmp files
set et|retab
set encoding=utf-8
set expandtab
set grepprg=ag " use sliver_searcher instead of grep
set gdefault " assume the /g flag on :s substitutions to replace all matches
set incsearch
set hlsearch
set laststatus=2  " always show status line.
set list " use :set list! to toggle visible whitespace on/off
set listchars=nbsp:¬,tab:>-,trail:•,extends:➮
set modeline " bash-like filenames completion
set nobackup
set nowritebackup
set noerrorbells " disable vim error noise
set noshowmode "hide default vim mode
set noswapfile " diable swap file
set nocompatible
set number
set numberwidth=5
set history=50
set relativenumber
set ruler
set shiftwidth=2
set showcmd " display incomplete commands
set smartcase " searching
set smarttab
set splitright
set tabstop=2
set wildignore+=tmp/** " ignore stuff that can't be opened
set wildmode=longest,full
set wildmenu
:setlocal spell spelllang=en_gb

" --------------------
" GIT
" --------------------
autocmd Filetype gitcommit setlocal spell textwidth=72 " format commit

" --------------------
" MAPPINGS
" --------------------
let mapleader = ","

" navigate displayed lines rather than physical lines
noremap j gj
noremap k gk

" vim-tmux-runner
nmap <Leader>irb :VtrOpenRunner {'orientation': 'h', 'percentage': 50, 'cmd': 'irb'}<cr>
nmap <Leader>sf :VtrSendFile<cr>
nmap <Leader>sl :VtrSendLinesToRunner<cr>
nmap s ko<Esc>

vmap <Tab> >
vmap <S-Tab> <

map <Leader>a :call RunAllSpecs()<cr>
map <Leader>bb :!bundle install<cr>
map <Leader>c iconsole.log()<Esc>i
map <Leader>cp ggyG``<cr>
map <Leader>d :ALEGoToDefinition<cr>
map <Leader>dd :ImportJSGoto<cr>
map <Leader>e :w<cr>:Explore<cr>
map <Leader>f :Ack<space>
map <Leader>fc :Ack <C-R><C-W><cr>
map <Leader>g gg=G``<space>
map <Leader>gg gggqG``<space>
map <Leader>gw :!git add . && git commit -m 'WIP' && git push<cr>
map <Leader>h :sp<cr>
map <Leader>i :ImportJSFix<cr>
map <Leader>l :call RunLastSpec()<cr>
map <Leader>m :NERDTreeToggle<CR>
map <Leader>mb 0i* <Esc><CR>
map <Leader>ma 0i# <Esc>
map <Leader>ms 0i## <Esc>
map <Leader>md 0i### <Esc>
map <Leader>mf 0i#### <Esc>
map <Leader>p :set paste<cr><esc>"*]p:set nopaste<cr>
map <Leader>q :copen<cr>
map <Leader>r :source ~/.vimrc<cr>
map <Leader>ra :%s/
map <Leader>s :ALEFindReferences<cr>
map <Leader>sc :sp db/schema.rb<cr>
map <Leader>sl :sort<cr>
map <Leader>t :call RunCurrentSpecFile()<cr>
map <Leader>u :Eunittest<cr>
map <Leader>v :vsp<cr>
map <Leader>vr :vsp ~/.vimrc<cr>

"imap { {}<Esc>i
"imap ( ()<Esc>i
"imap [ []<Esc>i

" rename current file - thanks Gary Bernhardt
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
map <Leader>n :call RenameFile()<cr>

" execute pathogen#infect()

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-n>
