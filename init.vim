set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set nu
set wrap
set noswapfile
set nobackup
set incsearch
set termguicolors
set scrolloff=8
set noshowmode
set completeopt=menuone,noinsert,noselect
set signcolumn=yes
set cmdheight=2
set updatetime=50
set shortmess+=c
set colorcolumn=80
set autowrite
set splitright
set splitbelow
set encoding=utf-8
set list
set background=dark
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
" set listchars=tab:..,trail:_,extends:>,precedes:<,nbsp:~
" set showbreak=↪\
set showbreak=\\ " [bonus]
filetype plugin indent on

call plug#begin()
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'gruvbox-community/gruvbox'
Plug 'tomasiser/vim-code-dark'
Plug 'lifepillar/vim-gruvbox8'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'mbbill/undotree'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-dispatch'
Plug 'Lenovsky/nuake'
Plug 'tpope/vim-repeat'
Plug 'szw/vim-maximizer'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-rhubarb'
Plug 'vimwiki/vimwiki'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'akinsho/nvim-bufferline.lua'
Plug 'nikvdp/neomux'
Plug 'f-person/git-blame.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'glepnir/lspsaga.nvim'
Plug 'onsails/lspkind-nvim'
Plug 'kosayoda/nvim-lightbulb'
Plug 'mfussenegger/nvim-dap'
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'
" Plug 'hoob3rt/lualine.nvim'
Plug 'hardcoreplayers/spaceline.vim'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'vim-test/vim-test'
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'sbdchd/neoformat'
Plug 'lervag/vimtex'
Plug 'srcery-colors/srcery-vim'
Plug 'mattn/webapi-vim'
Plug 'mattn/vim-gist'
Plug 'lervag/vimtex'
Plug 'joshdick/onedark.vim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'christianchiarulli/nvcode-color-schemes.vim'
" Plug 'hzchirs/vim-material'
call plug#end()

if (has('nvim'))
  let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif

let g:gruvbox_contrast_dark='hard'
let g:gruvbox_invert_selection='0'
let g:material_style='oceanic'
let g:material_terminal_italics = 1
let g:material_theme_style = 'ocean'
" colorscheme gruvbox
" colorscheme gruvbox8_hard
" colorscheme srcery
colorscheme nvcode
" highlight Normal guibg=none

let mapleader = " "
let maplocalleader = " "
nnoremap Y y$
nmap <TAB> :bn<CR>
nmap <S-TAB> :bp<CR>
nnoremap <leader>bd :bd<CR>

" start vim from previously opened line
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"Vimwiki
let g:vimwiki_list = [{'path': '~/Dropbox/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

" remove whitespace
autocmd BufWritePre * %s/\s\+$//e

" gitblame
let g:gitblame_enabled  = 0
nnoremap <leader>gb :GitBlameToggle<CR>

lua << EOF
-- require('gitsigns').setup()
EOF

noremap Zz <c-w>_ \| <c-w>\|
noremap Zo <c-w>=

nnoremap <leader>y :%y+<CR>

"firenvim
if exists('g:started_by_firenvim')
  set laststatus=0
else
  set laststatus=2
endif

nmap <silent> <leader>tn :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>ts :TestSuite<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tg :TestVisit<CR>

"vim-test
let test#strategy = "dispatch"
let test#neovim#term_position = "vertical"

if has('nvim')
 tnoremap <Esc> <C-\><C-n>
endif

" nuake
let g:nuake_position = "right"
let g:nuake_per_tab = 1
let g:nuake_start_insert = 1
nnoremap <leader><cr> :Nuake<CR>

nnoremap <leader>v <cmd>CHADopen<cr>

let g:spaceline_seperate_style = 'arrow'

let g:indentLine_char_list = ['|', '|', '|', '|']

au BufNewFile,BufRead Makefile set ts=4 sw=4 noet

nnoremap <silent><leader>m :MaximizerToggle<CR>

nnoremap <leader>f :Neoformat<CR>

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

let g:gist_clip_command = 'xclip -selection clipboard'


" nvim-lspconfig
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> ga <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

" language servers
lua << EOF
local lspconfig = require'lspconfig'

lspconfig.vimls.setup{}

lspconfig.texlab.setup{}

lspconfig.gopls.setup{}

lspconfig.pyright.setup{}

lspconfig.ccls.setup {
  init_options = {
	  compilationDatabaseDirectory = "build";
    index = {
      threads = 0;
    };
    clang = {
      excludeArgs = { "-frounding-math"} ;
    };
  }
}
EOF

" autoformat
autocmd BufWritePre *.go lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.cpp lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.tex lua vim.lsp.buf.formatting_sync(nil, 100)
" autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 100)

" nvim-compe
inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
lua << EOF
vim.o.completeopt = "menuone,noselect"

require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = false;

  source = {
    path = true;
    buffer = true;
    calc = true;
    vsnip = true;
    nvim_lsp = true;
    nvim_lua = true;
    spell = true;
    tags = true;
    snippets_nvim = true;
    treesitter = true;
  };
}

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
    return t "<Plug>(vsnip-jump-prev)"
  else
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
EOF

" highlight yank
augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank("IncSearch", 700)
augroup END

" telescope.nvim
" Using lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "c", "rust" },  -- list of language that will be disabled
  },
}
EOF

" nvim-tree
let g:nvim_tree_side = 'right'
let g:nvim_tree_width = 40 "30 by default
let g:nvim_tree_ignore = [ '.git', 'node_modules', '.cache' ] "empty by default
let g:nvim_tree_auto_open = 1 "0 by default, opens the tree when typing `vim $DIR` or `vim`
let g:nvim_tree_auto_close = 1 "0 by default, closes the tree when it's the last window
"let g:nvim_tree_auto_ignore_ft = {'startify', 'dashboard'} "empty by default, don't auto open tree on specific filetypes.
let g:nvim_tree_quit_on_open = 1 "0 by default, closes the tree when you open a file
let g:nvim_tree_follow = 1 "0 by default, this option allows the cursor to be updated when entering a buffer
let g:nvim_tree_indent_markers = 1 "0 by default, this option shows indent markers when folders are open
let g:nvim_tree_hide_dotfiles = 1 "0 by default, this option hides files and folders starting with a dot `.`
let g:nvim_tree_git_hl = 1 "0 by default, will enable file highlight for git attributes (can be used without the icons).
let g:nvim_tree_root_folder_modifier = ':~' "This is the default. See :help filename-modifiers for more options
let g:nvim_tree_tab_open = 1 "0 by default, will open the tree when entering a new tab and the tree was previously open
let g:nvim_tree_width_allow_resize  = 1 "0 by default, will not resize the tree when opening a file
let g:nvim_tree_disable_netrw = 0 "1 by default, disables netrw
let g:nvim_tree_hijack_netrw = 0 "1 by default, prevents netrw from automatically opening when opening directories (but lets you keep its other utilities)
let g:nvim_tree_show_icons = {
    \ 'git': 1,
    \ 'folders': 1,
    \ 'files': 1,
    \ }
"If 0, do not show the icons for one of 'git' 'folder' and 'files'
"1 by default, notice that if 'files' is 1, it will only display
"if nvim-web-devicons is installed and on your runtimepath

" default will show icon by default if no icon is provided
" default shows no icon by default
let g:nvim_tree_icons = {
    \ 'default': '',
    \ 'symlink': '',
    \ 'git': {
    \   'unstaged': "✗",
    \   'staged': "✓",
    \   'unmerged': "",
    \   'renamed': "➜",
    \   'untracked': "★"
    \   },
    \ 'folder': {
    \   'default': "",
    \   'open': "",
    \   'empty': "",
    \   'empty_open': "",
    \   'symlink': "",
    \   }
    \ }

nnoremap <leader>e :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>
" NvimTreeOpen and NvimTreeClose are also available if you need them

" a list of groups can be found at `:help nvim_tree_highlight`
highlight NvimTreeFolderIcon guibg=blue

" nvim-lightbulb
autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()

" lspkind
lua << EOF
require('lspkind').init({
    with_text = false,
    symbol_map = {
      Text = '  ',
      Method = '  ',
      Function = '  ',
      Constructor = '  ',
      Variable = '[]',
      Class = '  ',
      Interface = ' 蘒',
      Module = '  ',
      Property = '  ',
      Unit = ' 塞 ',
      Value = '  ',
      Enum = ' 練',
      Keyword = '  ',
      Snippet = '  ',
      Color = '',
      File = '',
      Folder = ' ﱮ ',
      EnumMember = '  ',
      Constant = '  ',
      Struct = '  '
    },
})
EOF

nnoremap <silent> K <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>
" -- scroll down hover doc or scroll in definition preview
nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
" -- scroll up hover doc
nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>
" signature
nnoremap <silent> gs <cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>

nnoremap <leader>lc :VimtexCompile<CR>

lua << EOF
require "bufferline".setup {
    options = {
        buffer_close_icon = "",
        modified_icon = "●",
        close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",
        max_name_length = 14,
        max_prefix_length = 13,
        tab_size = 18,
        enforce_regular_tabs = true,
        view = "multiwindow",
        show_buffer_close_icons = true,
        separator_style = "thin"
    }
}
EOF

lua << EOF
require("gitsigns").setup {
    signs = {
        add = {hl = "DiffAdd", text = "▌", numhl = "GitSignsAddNr"},
        change = {hl = "DiffChange", text = "▌", numhl = "GitSignsChangeNr"},
        delete = {hl = "DiffDelete", text = "_", numhl = "GitSignsDeleteNr"},
        topdelete = {hl = "DiffDelete", text = "‾", numhl = "GitSignsDeleteNr"},
        changedelete = {hl = "DiffChange", text = "~", numhl = "GitSignsChangeNr"}
    },
    numhl = false,
    keymaps = {
        -- Default keymap options
        noremap = true,
        buffer = true,
        ["n ]c"] = {expr = true, '&diff ? \']c\' : \'<cmd>lua require"gitsigns".next_hunk()<CR>\''},
        ["n [c"] = {expr = true, '&diff ? \'[c\' : \'<cmd>lua require"gitsigns".prev_hunk()<CR>\''},
        ["n <leader>hs"] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
        ["n <leader>hu"] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
        ["n <leader>hr"] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
        ["n <leader>hp"] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
        ["n <leader>hb"] = '<cmd>lua require"gitsigns".blame_line()<CR>'
    },
    watch_index = {
        interval = 100
    },
    sign_priority = 5,
    status_formatter = nil -- Use default
}
EOF
