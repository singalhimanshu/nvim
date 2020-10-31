source ~/.config/nvim/plugins.vim

"General Config
set iskeyword+=-                        " treat dash separated words as a word text object"
"set formatoptions-=cro                  " Stop newline continution of comments
syntax enable                           " Enables syntax highlighing
set hidden                              " Required to keep multiple buffers open multiple buffers
set wrap                              " Display long lines as just one line
set encoding=utf-8                      " The encoding displayed
set pumheight=10                        " Makes popup menu smaller
set fileencoding=utf-8                  " The encoding written to file
set fileformat=unix
set ruler                               " Show the cursor position all the time
set cmdheight=2                         " More space for displaying messages
set mouse=a                             " Enable your mouse
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set t_Co=256                            " Support 256 colors
set conceallevel=0                      " So that I can see `` in markdown files
set tabstop=2                           " Insert 2 spaces for a tab
set nocompatible
filetype plugin indent on
set showcmd
set shiftwidth=2                        " Change the number of space characters inserted for indentation
set softtabstop=2
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set expandtab                           " Converts tabs to spaces
set noexpandtab
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent
set laststatus=2                        " Always display the status line
set number                              " Line numbers
set relativenumber
set cursorline                          " Enable highlighting of the current line
"set cursorcolumn
"set showtabline=2                       " Always show tabs
set noshowmode                          " We don't need to see things like -- INSERT -- anymore
set nobackup                            " This is recommended by coc
set nowritebackup                       " This is recommended by coc
set signcolumn=yes                      " Always show the signcolumn, otherwise it would shift the text each time
set updatetime=300                      " Faster completion
set clipboard=unnamedplus      " Copy paste between vim and everything else
set list
" set showbreak=↪\ 
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
set incsearch
if (has("termguicolors"))
  set termguicolors
endif
set ignorecase
set smartcase
"set colorcolumn=80

" Map leader to space
let mapleader=" "
nnoremap <Space> <Nop>

" Colorscheme
" let g:solarized_visibility='low'
" let g:solarized_termcolors=256
let g:gruvbox_material_background= 'hard'
let g:gruvbox_material_enable_italic = 1
"let g:gruvbox_material_disable_italic_comment = 1
" let g:vim_monokai_tasty_italic = 1
" colorscheme vim-monokai-tasty
let ayucolor="mirage"
let g:gruvbox_bold=0
let g:gruvbox_invert_selection='0'
let g:gruvbox_invert_signs=1
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark = 'hard'
" colorscheme gruvbox-material
" colorscheme gruvbox
" colorscheme doom-one
set background=dark
let g:gruvbox_italicize_strings = 1
" colo gruvbox8
let g:nvcode_termcolors=256
colo onedark

" Simple movement with alt key
nnoremap <C-s> :w<cr>
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" For competitive programming
" autocmd BufNewFile *.cpp -r ~/template.cpp

" Vertically center document when entering insert mode
autocmd InsertEnter * norm zz

" Fix indenting visual block
vmap < <gv
vmap > >gv

" fzf.vim
nnoremap <C-p> :Files<cr>
nnoremap <C-b> :Buffers<cr>
let g:fzf_preview_window = ''
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden'

" ripgrep
nnoremap <C-g> :Rg<cr>

" vim-floaterm
let g:floaterm_keymap_toggle = '<F1>'
let g:floaterm_keymap_next   = '<F2>'
let g:floaterm_keymap_prev   = '<F3>'
let g:floaterm_keymap_new    = '<F4>'
let g:floaterm_gitcommit='floaterm'
let g:floaterm_autoinsert=1
let g:floaterm_width=0.8
let g:floaterm_height=0.8
let g:floaterm_wintitle=0
let g:floaterm_autoclose=1

" airline
let airline#extensions#wordcount#enabled = 1
" enable powerline fonts
let g:airline_powerline_fonts = 1
call airline#parts#define_function('lsp', 'LspStatus')
let g:airline_section_y = airline#section#create_right(['lsp'])
let g:ariline#extensions#tabline#enabled=1
let g:ariline#extensions#tabline#fnamemode=':t'
" let g:airline_theme = 'ayu_mirage'
" next buffer
nnoremap <silent> <TAB> :bnext<CR>
" previous buffer
nnoremap <silent> <S-TAB> :bprevious<CR>

" Close buffer
nnoremap <leader>db :bd<CR>


"Vimwiki
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

" Git Gutter
highlight GitGutterAdd guifg=#009900 ctermfg=Green
highlight GitGutterChange guifg=#bbbb00 ctermfg=Yellow
highlight GitGutterDelete guifg=#ff2222 ctermfg=Red
nmap ) <Plug>(GitGutterNextHunk)
nmap ( <Plug>(GitGutterPrevHunk)
let g:gitgutter_enabled = 1
let g:gitgutter_map_keys = 0
let g:gitgutter_highlight_linenrs = 1


"Commenting
function! Comment()
  if (mode() == "n" )
    execute "Commentary"
  else
    execute "'<,'>Commentary"
  endif
endfunction
vnoremap <silent> <space>/ :call Comment()


" Highlight Yank
augroup highlight_yank
  autocmd!
  autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
augroup END


let g:python_host_prog = '/usr/bin/python3.8'
let g:one_allow_italics = 1

" Autoformat while save
autocmd BufWritePost *.cpp lua vim.lsp.buf.formatting()
autocmd BufWritePost *.go lua vim.lsp.buf.formatting()

" diagnostic.nvim
let g:diagnostic_auto_popup_while_jump = 1
let g:diagnostic_enable_virtual_text = 0
let g:diagnostic_virtual_text_prefix = ' '
nnoremap <leader>do :OpenDiagnostic<CR>

command! Format  execute 'lua vim.lsp.buf.formatting()'

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

" Avoid showing message extra message when using completion
set shortmess+=c

" Use tab as trigger key
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

"autocmd BufEnter * lua require'completion'.on_attach()

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ completion#trigger_completion()

let g:completion_confirm_key = ""
imap <expr> <cr>  pumvisible() ? complete_info()["selected"] != "-1" ?
                 \ "\<Plug>(completion_confirm_completion)"  : "\<c-e>\<CR>" :  "\<CR>"
let g:completion_enable_snippet = 'UltiSnips'
" let g:completion_enable_auto_popup = 0

" ultisnip stuff
let g:UltiSnipsExpandTrigger="<f5>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
autocmd BufRead,BufNewFile,BufEnter *.dart UltiSnipsAddFiletypes dart-flutter

" telescope.nvim
" nnoremap <C-p> :lua require'telescope.builtin'.git_files{}<CR>
" nnoremap <leader>ss :lua require'telescope.builtin'.grep_string{}<CR>
" nnoremap <leader>sg :lua require'telescope.builtin'.live_grep{}<CR>
" nnoremap <leader>qf :lua require'telescope.builtin'.quickfix{}<CR>
" nnoremap <leader>ll :lua require'telescope.builtin'.loclist{}<CR>
" nnoremap <leader>of :lua require'telescope.builtin'.oldfiles{}<CR>
" nnoremap <leader>b :lua require'telescope.builtin'.buffers{}<CR>
" nnoremap <leader>ch :lua require'telescope.builtin'.command_history{}<CR>
" nnoremap <silent> gr <cmd>lua require'telescope.builtin'.lsp_references{}<CR>
" nnoremap <leader>gc :lua require'telescope.git'.checkout{}<CR>



" removes highlight after search
nnoremap <leader><leader> :nohl<CR>

" lazygit
nnoremap <silent> <leader>lg :LazyGit<CR>

"undotree
nnoremap <leader>u :UndotreeToggle<CR>

" open config file
nnoremap <leader>. :e ~/.config/nvim/init.vim<CR>

" vim-go
let g:go_fmt_fail_silently = 1
let g:go_fmt_command = "goimports"

" Disable 'K' for godoc, we're using it for lsp hover
let g:go_doc_keywordprg_enabled=0

" Use nvim lsp to handle jumping around
let g:go_def_mapping_enabled=0
let g:go_gopls_enabled=0
"let g:go_textobj_enabled=0

"nvim-colorizer
lua require'colorizer'.setup()

"vim-fugitive
nnoremap <leader>gs :G<CR>

" save using ctrl+s
nnoremap <C-s> :update<CR>

" Make the gutters darker than the background.
"let g:badwolf_darkgutter = 1

" Yank to end of line
nnoremap Y y$

" gruvbuddy colorscheme
" lua  require('colorbuddy').colorscheme('gruvbuddy')

" set spell check for certain file types
autocmd FileType markdown setlocal spell
autocmd FileType wiki setlocal spell
autocmd FileType gitcommit setlocal spell


nnoremap <leader>y :%y+<CR>

nnoremap <leader>cmb :CMakeBuild<CR>
nnoremap <leader>cmg :CMakeGenerate<CR>

" tagbar
nmap <leader>tb :TagbarToggle<CR>

"vimspector
let g:vimspector_enable_mappings = 'HUMAN'
nmap <leader>dd :call vimspector#Launch()<CR>
nmap <leader>dx :VimspectorReset<CR>
nmap <leader>de :VimspectorEval
nmap <leader>dw :VimspectorWatch
nmap <leader>do :VimspectorShowOutput

"lf
nnoremap <leader>lf :FloatermNew lf<CR>

" let g:vimwiki_global_ext = 0

"vsnip
imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

noremap <leader>sc 1z=e


nnoremap <leader>ri :RunInInteractiveShell<space>

nnoremap <leader>me :Messages<CR>

"................................................
" fern.vim
"................................................

let fern#drawer_width = 30
let fern#default_hidden = 1
"let fern#disable_drawer_auto_quit = 1

function! s:init_fern() abort
  " Use 'select' instead of 'edit' for default 'open' action
  nmap <buffer> H <Plug>(fern-action-open:split)
  nmap <buffer> V <Plug>(fern-action-open:vsplit)
  nmap <buffer> R <Plug>(fern-action-rename)
  nmap <buffer> M <Plug>(fern-action-move)
  nmap <buffer> C <Plug>(fern-action-copy)
  nmap <buffer> N <Plug>(fern-action-new-path)
  nmap <buffer> T <Plug>(fern-action-new-file)
  nmap <buffer> D <Plug>(fern-action-new-dir)
  nmap <buffer> S <Plug>(fern-action-hidden-toggle)
  nmap <buffer> dd <Plug>(fern-action-trash)
  nmap <buffer> <leader> <Plug>(fern-action-mark)
endfunction

augroup fern-custom
  autocmd! *
  autocmd FileType fern call s:init_fern()
augroup END

nnoremap <silent><leader>e :Fern . -drawer -toggle<CR>

let g:fern#renderer = "devicons"
let g:fern_renderer_devicons_disable_warning = 1

nnoremap ,g :GoRun ./%<CR>

" Disable netrw
let g:loaded_netrw             = 1
let g:loaded_netrwPlugin       = 1
let g:loaded_netrwSettings     = 1
let g:loaded_netrwFileHandlers = 1

augroup my-fern-hijack
  autocmd!
  autocmd BufEnter * ++nested call s:hijack_directory()
augroup END

function! s:hijack_directory() abort
  let path = expand('%:p')
  if !isdirectory(path)
    return
  endif
  bwipeout %
endfunction

let g:VimuxOrientation = "h"
let g:VimuxHeight = "40"
map <Leader>vp :VimuxPromptCommand<CR>
map <Leader>vl :VimuxRunLastCommand<CR>
map <Leader>vs :VimuxRunCommand("cfs")<CR>
map <Leader>vt :VimuxRunCommand("cft")<CR>
map <Leader>vq :VimuxCloseRunner<CR>
map <Leader>vx :VimuxInterruptRunner<CR>
map <Leader>vm :VimuxPromptCommand("make ")<CR>

"nvim-lsp
lua require('lsp_config')

tnoremap <Esc> <C-\><C-n>

" solves some weird bug
lua require "nvim-treesitter.parsers".get_parser_configs().markdown = nil

set noexpandtab
au BufNewFile,BufRead Makefile set ts=4 sw=4 noet

hi Comment cterm=italic
let g:nvcode_hide_endofbuffer=1
let g:nvcode_terminal_italics=1
let g:nvcode_termcolors=256

" syntax on
" colorscheme felipec


" checks if your terminal has 24-bit color support
if (has("termguicolors"))
    set termguicolors
		" hi Normal guifg=#ffffff ctermfg=231 guibg=#000000 ctermbg=16 gui=NONE cterm=NONE
endif
"
" Magic buffer-picking mode
nnoremap <silent> <C-b> :BufferPick<CR>
" Sort automatically by...
nnoremap <silent> <Space>bd :BufferOrderByDirectory<CR>
nnoremap <silent> <Space>bl :BufferOrderByLanguage<CR>
" Move to previous/next
nnoremap <silent>    <A-,> :BufferPrevious<CR>
nnoremap <silent>    <A-.> :BufferNext<CR>
" Re-order to previous/next
nnoremap <silent>    <A-<> :BufferMovePrevious<CR>
nnoremap <silent>    <A->> :BufferMoveNext<CR>
" Goto buffer in position...
nnoremap <silent>    <A-1> :BufferGoto 1<CR>
nnoremap <silent>    <A-2> :BufferGoto 2<CR>
nnoremap <silent>    <A-3> :BufferGoto 3<CR>
nnoremap <silent>    <A-4> :BufferGoto 4<CR>
nnoremap <silent>    <A-5> :BufferGoto 5<CR>
nnoremap <silent>    <A-6> :BufferGoto 6<CR>
nnoremap <silent>    <A-7> :BufferGoto 7<CR>
nnoremap <silent>    <A-8> :BufferGoto 8<CR>
nnoremap <silent>    <A-9> :BufferLast<CR>
