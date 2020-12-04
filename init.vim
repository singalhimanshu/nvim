" designed for vim 8+
let mapleader = " "
let skip_defaults_vim=1
set nocompatible

set grepprg=rg\ --vimgrep\ --smart-case\ --follow
set colorcolumn=80

"####################### Vi Compatible (~/.exrc) #######################

" automatically indent new lines
set autoindent

" automatically write files when changing when multiple files open
set autowrite

" activate line numbers
set number

" turn col and row position on in bottom right
set ruler

" show command and insert mode
set showmode

set tabstop=2

"#######################################################################

set softtabstop=2
set shiftwidth=2
set smartindent
set smarttab

" stop vim from silently fucking with files that it shouldn't 
set nofixendofline

" replace tabs with spaces automatically
set expandtab

" enough for line numbers + gutter within 80 standard
set textwidth=72 

" disable relative line numbers, remove no to sample it
set norelativenumber

" easier to see characters when `set paste` is on
set listchars=tab:→\ ,eol:↲,nbsp:␣,space:·,trail:·,extends:⟩,precedes:⟨
" turn on default spell checking
"set spell

" more risky, but cleaner
set nobackup
set noswapfile
set nowritebackup

" keep the terminal title updated
set laststatus=2
set icon

" center the cursor always on the screen
set scrolloff=999

" highlight search hits,  \+<cr> to clear 
set hlsearch
set incsearch
set linebreak
map <silent> <leader><leader> :noh<cr>:redraw!<cr>

" avoid most of the 'Hit Enter ...' messages
set shortmess=aoOtI

" prevents truncated yanks, deletes, etc.
set viminfo='20,<1000,s1000

" not a fan of bracket matching or folding
let g:loaded_matchparen=1
set noshowmatch
set foldmethod=manual

" Just the defaults, these are changed per filetype by plugins.
" Most of the utility of all of this has been superceded by the use of
" modern simplified pandoc for capturing knowledge source instead of
" arbitrary raw text files.

set formatoptions-=t   " don't auto-wrap text using text width
set formatoptions+=c   " autowrap comments using textwidth with leader
set formatoptions-=r   " don't auto-insert comment leader on enter in insert
set formatoptions-=o   " don't auto-insert comment leader on o/O in normal
set formatoptions+=q   " allow formatting of comments with gq
set formatoptions-=w   " don't use trailing whitespace for paragraphs
set formatoptions-=a   " disable auto-formatting of paragraph changes
set formatoptions-=n   " don't recognized numbered lists
set formatoptions+=j   " delete comment prefix when joining
set formatoptions-=2   " don't use the indent of second paragraph line
set formatoptions-=v   " don't use broken 'vi-compatible auto-wrapping'
set formatoptions-=b   " don't use broken 'vi-compatible auto-wrapping'
set formatoptions+=l   " long lines not broken in insert mode
set formatoptions+=m   " multi-byte character line break support
set formatoptions+=M   " don't add space before or after multi-byte char
set formatoptions-=B   " don't add space between two multi-byte chars in join 
set formatoptions+=1   " don't break a line after a one-letter word

" requires PLATFORM env variable set (in ~/.bashrc)
if $PLATFORM == 'mac'
  " required for mac delete to work
  set backspace=indent,eol,start
endif

" stop complaints about switching buffer with changes
set hidden

" command history
set history=100

" here because plugins and stuff need it
syntax enable

" faster scrolling
set ttyfast

" allow sensing the filetype
filetype plugin on

" Install vim-plug if not already installed
" (Yes I know about Vim 8 Plugins. They suck.)
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
  echo "Don't forget to GoInstallBinaries if you're doing Go dev."
endif

" high contrast for streaming, etc.
set background=dark

" only load plugins if Plug detected
if filereadable(expand("~/.vim/autoload/plug.vim"))

  " load all the plugins
  call plug#begin('~/.vimplugins')
  Plug 'sheerun/vim-polyglot'
  Plug 'vim-pandoc/vim-pandoc'
  Plug 'https://gitlab.com/rwxrob/vim-pandoc-syntax-simple'
  Plug 'https://gitlab.com/rwx.gg/abnf'
  "Plug 'WolfgangMehner/bash-support' " borkish
  Plug 'cespare/vim-toml'
  Plug 'pangloss/vim-javascript'
  Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
  Plug 'PProvost/vim-ps1'
  "Plug 'airblade/vim-gitgutter'
  Plug 'gruvbox-community/gruvbox'
  Plug 'tomasr/molokai'
  Plug 'gabrielsimoes/cfparser.vim'
  Plug 'SirVer/ultisnips'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'kyazdani42/nvim-web-devicons'
  " Plug 'romgrk/barbar.nvim'
  Plug 'vimwiki/vimwiki'
  Plug 'rust-lang/rust.vim'
  Plug 'NLKNguyen/papercolor-theme'
  Plug 'sainnhe/sonokai'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-dispatch'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-rhubarb'
  Plug 'tpope/vim-repeat'
  Plug 'dart-lang/dart-vim-plugin'
  Plug 'thosakwe/vim-flutter'
  Plug 'dense-analysis/ale'
  Plug 'itchyny/lightline.vim'
  Plug 'airblade/vim-gitgutter'
  Plug 'mattn/emmet-vim'
  Plug 'turbio/bracey.vim'
  Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
  "Plug 'nvim-treesitter/nvim-treesitter'
  "Plug 'nielsmadan/harlequin'
  "Plug 'tomasr/molokai'
  call plug#end()

  let g:gruvbox_contrast_dark='hard'
  let g:gruvbox_invert_selection='0'
  colorscheme gruvbox
  "hi Normal ctermbg=NONE " for transparent background
  "colorscheme elflord
  set cursorline

  " pandoc
  let g:pandoc#formatting#mode = 'h' " A'
  let g:pandoc#formatting#textwidth = 72

  " golang
  let g:go_fmt_fail_silently = 0 " let me out even with errors
  let g:go_fmt_command = 'goimports' " autoupdate import
  let g:go_fmt_autosave = 1
  let g:go_gopls_enabled = 1
  "let g:go_gopls_analyses = { 'composites' : v:false }
  au FileType go nmap <leader>t :GoTest!<CR>
  au FileType go nmap <leader>gtf :GoTestFunc!<CR>
  au FileType go nmap <leader>v :GoVet!<CR>
  au FileType go nmap <leader>b :GoBuild!<CR>
  au FileType go nmap <leader>i :GoInstall!<CR>
  au FileType go nmap <leader>l :GoMetaLinter!<CR>

else
  autocmd vimleavepre *.go !gofmt -w % " backup if fatih fails
endif

autocmd vimleavepre *.rs !rustfmt %

" fill in empty markdown links with duck.com search
" [some thing]() -> [some thing](https://duck.com/lite?kae=t&q=some thing)
" s,/foo,/bar,g
autocmd vimleavepre *.md !perl -p -i -e 's,\[([^\]]+)\]\(\),[\1](https://duck.com/lite?kd=-1&kp=-1&q=\1),g' %

" if you are gonna visual, might as well...
vmap < <gv
vmap > >gv

" enable omni-completion
set omnifunc=syntaxcomplete#Complete

" force some file names to be specific file type
au bufnewfile,bufRead *.bash* set ft=sh
au bufnewfile,bufRead *.profile set filetype=sh
au bufnewfile,bufRead *.crontab set filetype=crontab
au bufnewfile,bufRead *ssh/config set filetype=sshconfig
au bufnewfile,bufRead *gitconfig set filetype=gitconfig
au bufnewfile,bufRead /tmp/psql.edit.* set syntax=sql

" displays all the syntax rules for current position, useful
" when writing vimscript syntax plugins
function! <SID>SynStack()
	if !exists("*synstack")
		return
	endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc  

" start at last place you were editing
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" functions keys
map <F1> :set number!<CR> :set relativenumber!<CR>
nmap <F2> :call <SID>SynStack()<CR>
set pastetoggle=<F3>
map <F4> :set list!<CR>
map <F5> :set cursorline!<CR>
map <F7> :set spell!<CR>
map <F12> :set fdm=indent<CR>

nmap <leader>2 :set paste<CR>i
" disable arrow keys (vi muscle memory)
noremap <up> :echoerr "Umm, use k instead"<CR>
noremap <down> :echoerr "Umm, use j instead"<CR>
noremap <left> :echoerr "Umm, use h instead"<CR>
noremap <right> :echoerr "Umm, use l instead"<CR>
inoremap <up> <NOP>
inoremap <down> <NOP>
inoremap <left> <NOP>
inoremap <right> <NOP>

nnoremap <TAB> :bn<CR>
nnoremap <S-TAB> :bp<CR>

set clipboard=unnamedplus

nnoremap <silent> <C-p> :GFiles<CR>
nnoremap <silent> <C-t> :Files<CR>
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)
nnoremap <silent> <C-b> :Buffers<CR>
nnoremap <silent> <C-g> :Rg<CR>
nnoremap <silent> <C-s> :BufferPick<CR>

set termguicolors

let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

" RUST
let g:rustfmt_autosave = 1
let g:rust_clip_command = 'xclip -selection clipboard'

set t_Co=256
let g:sonokai_style = 'atlantis'
let g:rehash256 = 1
"colorscheme molokai

set splitbelow
set splitright

let g:dart_format_on_save = 1

nnoremap Y y$

augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=300}
augroup END

nnoremap <leader>n :cnext<CR>
nnoremap <leader>p :cprevious<CR>

nmap <silent> <C-e> <Plug>(ale_next_wrap)
function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))
    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors
    return l:counts.total == 0 ? 'OK' : printf(
        \   '%d⨉ %d⚠ ',
        \   all_non_errors,
        \   all_errors
        \)
endfunction
set statusline+=%=
set statusline+=\ %{LinterStatus()}
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1

let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

nmap ]c <Plug>(GitGutterNextHunk)
nmap [c <Plug>(GitGutterPrevHunk)
nmap <Leader>hs <Plug>(GitGutterStageHunk)
nmap <Leader>hu <Plug>(GitGutterUndoHunk)

let g:mkdp_auto_start = 0

let g:user_emmet_leader_key='<C-Y>'
