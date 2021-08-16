call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'NLKNguyen/papercolor-theme'
Plug 'dense-analysis/ale', { 'tag': 'v3.1.0' }
Plug 'quick-lint/quick-lint-js', {'rtp': 'plugin/vim/quick-lint-js.vim'}
Plug 'mkitt/tabline.vim'
Plug 'sbdchd/neoformat'
Plug 'tomtom/tcomment_vim'
Plug 'junegunn/vim-easy-align'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tyru/open-browser-github.vim'
Plug 'tyru/open-browser.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'vimwiki/vimwiki'
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
" Plug 'hrsh7th/nvim-compe'
" Plug 'hrsh7th/vim-vsnip'
" Plug 'hrsh7th/vim-vsnip-integ'
" Plug 'neovim/nvim-lspconfig'
" Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
" Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
" Plug 'ray-x/lsp_signature.nvim'
" Plug 'seblj/nvim-echo-diagnostics'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
" Plug 'vhyrro/neorg'
" Plug 'lewis6991/gitsigns.nvim'
" Plug 'mfussenegger/nvim-dap'
" Plug 'nvim-telescope/telescope-dap.nvim'
" Plug 'theHamsta/nvim-dap-virtual-text'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'
" Plug 'hoob3rt/lualine.nvim'
" Plug 'nvim-lua/lsp-status.nvim'
Plug 'tjdevries/gruvbuddy.nvim'
Plug 'tjdevries/colorbuddy.nvim'
Plug 'tpope/vim-vinegar'
Plug 'srcery-colors/srcery-vim'
Plug 'ishan9299/nvim-solarized-lua'
call plug#end()

" experimental always center cursor
" set scrolloff=9
set cmdheight=2
set spelllang=en_us
set dictionary=/usr/share/dict/words
" set relativenumber
set updatetime=100
set number
set splitright splitbelow
set encoding=utf-8
scriptencoding utf-8
set nocompatible
set sw=2 et
set softtabstop=2
set noexpandtab
set ts=4
set nosmartindent
set cin noai
" set tw=60 cc=60
set nojoinspaces
set formatoptions=cloqr
set bs=indent,eol,start
set completeopt=menuone,noselect
set hlsearch
set incsearch
set smartcase ignorecase
set nowrap
set ruler
set laststatus=2
set list
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
" set listchars=
" set listchars+=precedes:<,extends:>
" set listchars+=tab:⇥\
set sidescroll=5
set scrolloff=5
set shortmess=a
set shortmess+=tToO
set statusline=\ \ \ %<%f\ %h%m%r
set statusline+=%=%(%l,%c%V%)
set inccommand=nosplit
set termguicolors
syntax on
filetype on
filetype indent on
filetype plugin on

" tab settings
set tabstop=2
set shiftwidth=2
set expandtab
set softtabstop=2
set autoindent
set smartindent

let mapleader = " "
nnoremap <leader>m :make<CR>
nnoremap <leader><CR> :noh<CR>
nnoremap \ gt
nmap Y y$
nnoremap Q gqip
nnoremap <leader>e :Ex<CR>
nnoremap <leader>so :source ~/.config/nvim/init.vim<CR>
nnoremap <leader>y :%y+<CR>
vnoremap <leader>y "+y

set t_Co=256
set background=dark
" lua require('colorbuddy').colorscheme('gruvbuddy')
" colorscheme PaperColor
" colorscheme tango-dark
colorscheme solarized
" colorscheme desert
hi Normal guibg=NONE ctermbg=NONE
" colorscheme srcery
" colorscheme modus-vivendi

" fzf
" let g:fzf_preview_window = []
" let g:fzf_buffers_jump = 1
" let g:fzf_layout = { 'down': '20%' }
" nnoremap <leader><leader> :Files<CR>
" nnoremap <leader>fg :Rg<CR>
" nnoremap <leader>fb :Buffers<CR>
" " search for man pages
" command! -nargs=? Apropos call fzf#run(fzf#wrap({'source': 'man -k '.shellescape(<q-args>).' | cut -d " " -f 1', 'sink': 'tab Man', 'options': ['--preview', 'MANPAGER=cat MANWIDTH='.(&columns/2-4).' man {}']}))
" nnoremap <F1> :Apropos<CR>

" au InsertEnter * silent execute "!echo -en \<esc>[5 q"
" au InsertLeave * silent execute "!echo -en \<esc>[2 q"

function! Open_quickfix_window() abort
  let l:window_id = win_getid()
  botright copen
  call win_gotoid(l:window_id)
endfunction

command -complete=dir -nargs=+
  \ Grep silent grep <args>
  \ | redraw!
  \ | call Open_quickfix_window()
set grepformat=%f:%l:%c:%m
set grepformat+=%-GNo\ files\ were\ searched\\,\ which\ means\ ripgrep\ probably\ applied\ a\ filter\ you\ didn't\ expect.\ Try\ running\ again\ with\ --debug.
set grepprg=rg
if has('unix')
  set grepprg+=\ \</dev/null
endif
set grepprg+=\ --color\ never\ --column\ --line-number\ --no-heading\ $*
nmap <Leader>a :tabnew \| Grep <SPACE>

" Use tab for %
nnoremap <tab> %
vnoremap <tab> %

nnoremap <leader>j :cn<CR>
nnoremap <leader>k :cp<CR>

nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

nmap <silent> gx :!xdg-open <cWORD><cr>

" let g:ale_javascritp_quick_lint_js_use_global = 1
" ale
" let g:ale_echo_cursor = v:false
let g:ale_lint_delay = 0
let g:ale_linters_explicit = v:true
let g:ale_set_signs = v:false
" let b:ale_linters = {'javascript': ['quick-lint-js']}

let g:leetcode_browser = 'firefox'
nnoremap <leader>ll :LeetCodeList<cr>
nnoremap <leader>lt :LeetCodeTest<cr>
nnoremap <leader>ls :LeetCodeSubmit<cr>
nnoremap <leader>li :LeetCodeSignIn<cr>

" align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" remove whitespace
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0

" formatting
let g:neoformat_enabled_cpp = ['clangformat']
let g:neoformat_enabled_c = ['clangformat']
nnoremap <leader>lf :Neoformat<CR>

" open file on github
nnoremap <leader>o :OpenGithubFile<CR>
vnoremap <leader>o :OpenGithubFile<CR>

" vim-go
" run :GoBuild or :GoTestCompile based on the go file
let g:go_diagnostics_enabled = 0
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
autocmd FileType go nmap <Leader>t <Plug>(go-test)
autocmd FileType go nmap <Leader>rn :GoRename <C-r><C-w>
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
au BufRead,BufNewFile *.gohtml set filetype=gohtmltmpl
let g:go_def_mode = 'godef'
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 0
let g:go_rename_command = 'gopls'
let g:go_gopls_enabled = 0
let g:go_diagnostics_enabled = 0
" let g:go_highlight_types = 1

autocmd FileType markdown setlocal spell
autocmd FileType gitcommit setlocal spell
autocmd FileType markdown setlocal complete+=kspell
autocmd FileType gitcommit setlocal complete+=kspell

" lua require('lsp')

" vimwiki
let g:vimwiki_list = [{
  \ 'auto_export': 1,
  \ 'automatic_nested_syntaxes':1,
  \ 'path_html': '$HOME/Documents/vimwiki/_site',
  \ 'path': '$HOME/Documents/vimwiki/content',
  \ 'template_path': '$HOME/Documents/vimwiki/templates/',
  \ 'syntax': 'markdown',
  \ 'ext':'.md',
  \ 'template_default':'markdown',
  \ 'custom_wiki2html': '$HOME/.dotfiles/wiki2html.sh',
  \ 'template_ext':'.html'
\}]

" treesitter
lua <<EOF
-- require'nvim-treesitter.configs'.setup {
--   ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
--   -- ignore_install = { "javascript" }, -- List of parsers to ignore installing
--   highlight = {
--     enable = true,              -- false will disable the whole extension
--     disable = { "c", "cpp", "rust" },  -- list of language that will be disabled
--     -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
--     -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
--     -- Using this option may slow down your editor, and you may see some duplicate highlights.
--     -- Instead of true it can also be a list of languages
--     additional_vim_regex_highlighting = false,
--   },
-- }
EOF

" nvim-compe
" let g:compe = {}
" let g:compe.enabled = v:true
" let g:compe.autocomplete = v:true
" let g:compe.debug = v:false
" let g:compe.min_length = 1
" let g:compe.preselect = 'enable'
" let g:compe.throttle_time = 80
" let g:compe.source_timeout = 200
" let g:compe.resolve_timeout = 800
" let g:compe.incomplete_delay = 400
" let g:compe.max_abbr_width = 100
" let g:compe.max_kind_width = 100
" let g:compe.max_menu_width = 100
" let g:compe.documentation = v:true
"
" let g:compe.source = {}
" let g:compe.source.path = v:true
" let g:compe.source.buffer = v:true
" let g:compe.source.calc = v:true
" let g:compe.source.nvim_lsp = v:true
" let g:compe.source.nvim_lua = v:true
" let g:compe.source.vsnip = v:true
" " let g:compe.source.ultisnips = v:true
" let g:compe.source.luasnip = v:true
" let g:compe.source.emoji = v:true
"
" inoremap <silent><expr> <C-Space> compe#complete()
" inoremap <silent><expr> <CR>      compe#confirm('<CR>')
" inoremap <silent><expr> <C-e>     compe#close('<C-e>')
" inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
" inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

lua << EOF
-- local t = function(str)
--   return vim.api.nvim_replace_termcodes(str, true, true, true)
-- end
--
-- local check_back_space = function()
--     local col = vim.fn.col('.') - 1
--     return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
-- end
--
-- -- Use (s-)tab to:
-- --- move to prev/next item in completion menuone
-- --- jump to prev/next snippet's placeholder
-- _G.tab_complete = function()
--   if vim.fn.pumvisible() == 1 then
--     return t "<C-n>"
--   elseif vim.fn['vsnip#available'](1) == 1 then
--     return t "<Plug>(vsnip-expand-or-jump)"
--   elseif check_back_space() then
--     return t "<Tab>"
--   else
--     return vim.fn['compe#complete']()
--   end
-- end
-- _G.s_tab_complete = function()
--   if vim.fn.pumvisible() == 1 then
--     return t "<C-p>"
--   elseif vim.fn['vsnip#jumpable'](-1) == 1 then
--     return t "<Plug>(vsnip-jump-prev)"
--   else
--     -- If <S-Tab> is not working in your terminal, change it to <C-h>
--     return t "<S-Tab>"
--   end
-- end
--
-- vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
-- vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
-- vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
-- vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

EOF


" autocmd CursorHold * lua require('echo-diagnostics').echo_line_diagnostic()

" telescope
" Find files using Telescope command-line sugar.
nnoremap <leader><leader> <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fd <cmd>Telescope lsp_workspace_diagnostics<cr>

lua << EOF
require('telescope').setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    prompt_prefix = "> ",
    selection_caret = "> ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_config = {
      width = 0.95,
      height = 0.85,
      prompt_position = "top",
      horizontal = {
        preview_width = function(_, cols, _)
          if cols > 200 then
            return math.floor(cols * 0.4)
          else
            return math.floor(cols * 0.6)
          end
        end,
      },
      vertical = {
        width = 0.9,
        height = 0.95,
        preview_height = 0.5,
      },
      flex = {
          horizontal = {
            preview_width = 0.9,
          },
        },
    },
    file_sorter =  require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    winblend = 0,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    use_less = true,
    path_display = {},
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
  }
}

EOF

" lewis6991/gitsigns.nvim
lua << EOF
--  require('gitsigns').setup({})
EOF

" 'hoob3rt/lualine.nvim'
lua << EOF
  -- require('lualine').setup({
  -- options = {
  --   theme = "papercolor_dark"
  --  },
  -- --  sections = {
  -- --   lualine_c = {"os.data('%a')", 'data', require'lsp-status'.status}
  -- -- }
  -- })
EOF

lua << EOF
    -- require('neorg').setup {
    --     -- Tell Neorg what modules to load
    --     load = {
    --         ["core.defaults"] = {}, -- Load all the default modules
    --         ["core.norg.concealer"] = {}, -- Allows for use of icons
    --         ["core.norg.dirman"] = { -- Manage your directories with Neorg
    --             config = {
    --                 workspaces = {
    --                     my_workspace = "~/Dropbox/neorg"
    --                 }
    --             }
    --         }
    --     },
    -- }
EOF

" let g:vimwiki_folding='list'

" Copyright Saleem Abdulrasool <compnerd@compnerd.org>
command! GNUFormat :setlocal
    \ cinoptions=>2s,n-1s,{s,^-1s,:1s,=1s,g0,h1s,t0,+1s,(0,u0,w1,m1
    \ noexpandtab
    \ shiftwidth=2
    \ softtabstop=2
    \ tabstop=8
