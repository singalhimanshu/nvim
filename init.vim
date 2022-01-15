call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'NLKNguyen/papercolor-theme'
" old version for qljs
Plug 'dense-analysis/ale', { 'tag': 'v3.1.0' }
" Plug 'dense-analysis/ale'
Plug 'quick-lint/quick-lint-js', {'rtp': 'plugin/vim/quick-lint-js.vim'}
Plug 'mkitt/tabline.vim'
Plug 'sbdchd/neoformat'
Plug 'tomtom/tcomment_vim'
" Plug 'junegunn/vim-easy-align'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tyru/open-browser-github.vim'
Plug 'tyru/open-browser.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
" nvim-cmp
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/cmp-nvim-lsp-document-symbol'
Plug 'hrsh7th/cmp-calc'
Plug 'hrsh7th/cmp-path'
" lsp
Plug 'neovim/nvim-lspconfig'
Plug 'ray-x/lsp_signature.nvim'
Plug 'seblj/nvim-echo-diagnostics'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'akinsho/flutter-tools.nvim'
" Plug 'vhyrro/neorg'
Plug 'lewis6991/gitsigns.nvim'
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
" note taking
" Plug 'vimwiki/vimwiki'
" Plug 'oberblastmeister/neuron.nvim'
" Plug 'oberblastmeister/neuron.nvim', { 'branch': 'unstable' }
" Plug 'mfussenegger/nvim-lint'
Plug 'singalhimanshu/nvim-lint', { 'branch': 'quick_lint_js' }
Plug 'vim-test/vim-test'
Plug 'rcarriga/vim-ultest', { 'do': ':UpdateRemotePlugins' }
" Plug 'f-person/git-blame.nvim'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
" Plug 'rakr/vim-one'
Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh' }
Plug 'AckslD/nvim-neoclip.lua'
Plug 'posva/vim-vue'
Plug 'whatsthatsmell/codesmell_dark.vim'
Plug 'onsails/lspkind-nvim'
Plug 'nvim-neorg/neorg'
Plug 'navarasu/onedark.nvim'
call plug#end()

" experimental always center cursor
" set scrolloff=9
" set cmdheight=2
" set makeprg=./make
set spelllang=en_us
set dictionary=/usr/share/dict/words
" set relativenumber
set updatetime=100
set number
set pumheight=10
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
set completeopt=menu,menuone,noselect
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
set conceallevel=0
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
set fillchars+=vert:│

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
let g:onedark_style = 'darker'
colorscheme onedark
" colorscheme one
" highlight Comment gui=none cterm=none
" colorscheme PaperColor
" colorscheme codesmell_dark
" colorscheme tango-dark
" colorscheme solarized
" colorscheme desert
" hi Normal guibg=NONE ctermbg=NONE
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

nnoremap <leader>n :cn<CR>
nnoremap <leader>p :cp<CR>

nnoremap <leader>wj <C-W>j
nnoremap <leader>wk <C-W>k
nnoremap <leader>wh <C-W>h
nnoremap <leader>wl <C-W>l

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
nnoremap <leader>go :OpenGithubFile<CR>
vnoremap <leader>go :OpenGithubFile<CR>

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

" format dart code on save
autocmd BufWritePre *.dart lua vim.lsp.buf.formatting_sync(nil, 1000)
lua require('lsp')
lua << EOF
require("flutter-tools").setup {
  ui = {
    border = "rounded",
  },
  decorations = {
    statusline = {
      app_version = true,
      device = true,
    }
  },
  debugger = { -- integrate with nvim dap + install dart code debugger
    enabled = false,
  },
  widget_guides = {
    enabled = true,
  },
  dev_log = {
    open_cmd = "tabedit", -- command to use to open the log buffer
  },
  dev_tools = {
    autostart = false, -- autostart devtools server if not detected
    auto_open_browser = false, -- Automatically opens devtools in the browser
  },
  outline = {
    open_cmd = "30vnew", -- command to use to open the outline buffer
    auto_open = false -- if true this will open the outline automatically when it is first populated
  },
}
EOF

" vimwiki
" let g:vimwiki_list = [{
"   \ 'auto_export': 1,
"   \ 'automatic_nested_syntaxes':1,
"   \ 'path_html': '$HOME/Documents/vimwiki/_site',
"   \ 'path': '$HOME/Documents/vimwiki/content',
"   \ 'template_path': '$HOME/Documents/vimwiki/templates/',
"   \ 'syntax': 'markdown',
"   \ 'ext':'.md',
"   \ 'template_default':'markdown',
"   \ 'custom_wiki2html': '$HOME/.dotfiles/wiki2html.sh',
"   \ 'template_ext':'.html'
" \}]

" treesitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  -- ignore_install = { "javascript" }, -- List of parsers to ignore installing
  highlight = {
    enable = true,
    disable = { "c", "cpp", "rust" },
    additional_vim_regex_highlighting = false,
  },
}
local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()

parser_configs.norg = {
    install_info = {
        url = "https://github.com/nvim-neorg/tree-sitter-norg",
        files = { "src/parser.c", "src/scanner.cc" },
        branch = "main"
    },
}

parser_configs.norg_meta = {
    install_info = {
        url = "https://github.com/nvim-neorg/tree-sitter-norg-meta",
        files = { "src/parser.c" },
        branch = "main"
    },
}

parser_configs.norg_table = {
    install_info = {
        url = "https://github.com/nvim-neorg/tree-sitter-norg-table",
        files = { "src/parser.c" },
        branch = "main"
    },
}
EOF

lua <<EOF
  -- Setup nvim-cmp.
   local has_words_before = function()
     local line, col = unpack(vim.api.nvim_win_get_cursor(0))
     return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
   end

   local feedkey = function(key, mode)
     vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
   end
   local cmp = require'cmp'
   local lspkind = require('lspkind')

   cmp.setup({
     snippet = {
       expand = function(args)
         -- For `vsnip` user.
         vim.fn["vsnip#anonymous"](args.body)

         -- For `luasnip` user.
         -- require('luasnip').lsp_expand(args.body)

         -- For `ultisnips` user.
         -- vim.fn["UltiSnips#Anon"](args.body)
       end,
     },
     mapping = {
       ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
       ["<Tab>"] = cmp.mapping(function(fallback)
       if cmp.visible() then
         cmp.select_next_item()
       elseif vim.fn["vsnip#available"]() == 1 then
         feedkey("<Plug>(vsnip-expand-or-jump)", "")
       elseif has_words_before() then
         cmp.complete()
       else
         fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
       end
     end, { "i", "s" }),

     ["<S-Tab>"] = cmp.mapping(function()
       if cmp.visible() then
         cmp.select_prev_item()
       elseif vim.fn["vsnip#jumpable"](-1) == 1 then
         feedkey("<Plug>(vsnip-jump-prev)", "")
       end
     end, { "i", "s" }),
       ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
       ['<Down>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
       ['<Up>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
       ['<C-d>'] = cmp.mapping.scroll_docs(-4),
       ['<C-f>'] = cmp.mapping.scroll_docs(4),
       ['<C-Space>'] = cmp.mapping.complete(),
       ['<C-e>'] = cmp.mapping.close(),
       ['<CR>'] = cmp.mapping.confirm({
         behavior = cmp.ConfirmBehavior.Replace,
         select = true,
       })
     },
     sources = {
       { name = 'nvim_lsp' },
       { name = 'treesitter' },
       { name = 'path' },
       { name = 'nvim_lsp_document_symbol' },

       -- For vsnip user.
       { name = 'vsnip' },

       -- For luasnip user.
       -- { name = 'luasnip' },

       -- For ultisnips user.
       -- { name = 'ultisnips' },

       { name = 'buffer' },
       { name = 'neorg' },
     },
    formatting = {
      format = lspkind.cmp_format({with_text = false, max_width = 50})
    }
   })

EOF

" autocmd CursorHold * lua require('echo-diagnostics').echo_line_diagnostic()

" telescope
" Find files using Telescope command-line sugar.
nnoremap <leader><leader> <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fd <cmd>Telescope lsp_workspace_diagnostics<cr>
nnoremap <leader>fc <cmd>Telescope flutter commands<cr>
nnoremap <leader>cc <cmd>Telescope neoclip<cr>

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
require("telescope").load_extension("flutter")
EOF

" neuron.nvim
lua << EOF
-- require'neuron'.setup {
--   virtual_titles = true,
--   mappings = true,
--   run = nil,
--   neuron_dir = "/home/himanshu/Dropbox/notes",
--   leader = "gz",
-- }
EOF
 " click enter on [[my_link]] or [[[my_link]]] to enter it
" nnoremap <buffer> <CR> <cmd>lua require'neuron'.enter_link()<CR>

" create a new note
" nnoremap <buffer> gzn <cmd>lua require'neuron/cmd'.new_edit()<CR>

" find your notes, click enter to create the note if there are not notes that match
" nnoremap <buffer> gzz <cmd>lua require'neuron/telescope'.find_zettels()<CR>
" insert the id of the note that is found
" nnoremap <buffer> gzZ <cmd>lua require'neuron/telescope'.find_zettels {insert = true}<CR>

" find the backlinks of the current note all the note that link this note
" nnoremap <buffer> gzb <cmd>lua require'neuron/telescope'.find_backlinks()<CR>
" same as above but insert the found id
" nnoremap <buffer> gzB <cmd>lua require'neuron/telescope'.find_backlinks {insert = true}<CR>

" find all tags and insert
" nnoremap <buffer> gzt <cmd>lua require'neuron/telescope'.find_tags()<CR>

" start the neuron server and render markdown, auto reload on save
" nnoremap <buffer> gzs <cmd>lua require'neuron'.rib {address = "127.0.0.1:8200", verbose = true}<CR>

" go to next [[my_link]] or [[[my_link]]]
" nnoremap <buffer> gz] <cmd>lua require'neuron'.goto_next_extmark()<CR>
" go to previous
" nnoremap <buffer> gz[ <cmd>lua require'neuron'.goto_prev_extmark()<CR>]]


" lsp bindings
nnoremap gD <Cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap gd <Cmd>lua vim.lsp.buf.definition()<CR>
nnoremap K <Cmd>lua vim.lsp.buf.hover()<CR>
nnoremap gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <space>wa <cmd>lua vim.lsp.buf.add_workspace_folder()<CR>
nnoremap <space>wr <cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>
nnoremap <space>wl <cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>
nnoremap <space>D <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <space>rn <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <space>ca <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <space>ld <cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>
nnoremap [d <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap ]d <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <space>q <cmd>lua vim.lsp.diagnostic.set_loclist()<CR>
nnoremap <space>f <cmd>lua vim.lsp.buf.formatting()<CR>

" nvim-lint
lua << EOF
require('lint').linters_by_ft = {
  javascript = {'quick-lint-js',},
  -- markdown = {'vale',},
  python = {'flake8',},
}
EOF
au BufWritePost * lua require('lint').try_lint()

" lewis6991/gitsigns.nvim
lua << EOF
 require('gitsigns').setup({})
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

" vim-test
nmap <silent> tn :UltestNearest<CR>
nmap <silent> tt :Ultest<CR>
nmap <silent> tc :UltestClear<CR>
nmap <silent> tf :TestFile<CR>
nmap <silent> ts :TestSuite<CR>
nmap <silent> tl :TestLast<CR>
nmap <silent> tv :TestVisit<CR>
let test#strategy = {
  \ 'nearest': 'neovim',
  \ 'file':    'neovim',
  \ 'suite':   'neovim',
\}

if has('nvim')
  tmap <C-o> <C-\><C-n>
endif

" git-blame
let g:gitblame_enabled = 0
nnoremap <leader>gb :GitBlameToggle<CR>

" let g:vimwiki_folding='list'

" nvim-neoclip
lua << EOF
require('telescope').load_extension('neoclip')
require('neoclip').setup()
EOF

"neorg
lua << EOF
require('neorg').setup {
    -- Tell Neorg what modules to load
    load = {
        ["core.defaults"] = {}, -- Load all the default modules
        ["core.keybinds"] = { -- Configure core.keybinds
            config = {
                default_keybinds = true, -- Generate the default keybinds
                neorg_leader = "<leader>o" -- This is the default if unspecified
            }
        },
        ["core.norg.concealer"] = {}, -- Allows for use of icons
        ["core.norg.completion"] = {
          config = {
            engine = "nvim-cmp",
            },
          },
        ["core.norg.dirman"] = { -- Manage your directories with Neorg
            config = {
                workspaces = {
                    my_workspace = "~/neorg"
                }
            }
        }
    },
}
EOF

" nvim-gdb
" We're going to define single-letter keymaps, so don't try to define them
" in the terminal window.  The debugger CLI should continue accepting text commands.
function! NvimGdbNoTKeymaps()
  tnoremap <silent> <buffer> <esc> <c-\><c-n>
endfunction

let g:nvimgdb_config_override = {
  \ 'key_next': 'n',
  \ 'key_step': 's',
  \ 'key_finish': 'f',
  \ 'key_continue': 'c',
  \ 'key_until': 'u',
  \ 'key_breakpoint': 'b',
  \ 'set_tkeymaps': "NvimGdbNoTKeymaps",
  \ }


" Copyright Saleem Abdulrasool <compnerd@compnerd.org>
command! GNUFormat :setlocal
    \ cinoptions=>2s,n-1s,{s,^-1s,:1s,=1s,g0,h1s,t0,+1s,(0,u0,w1,m1
    \ noexpandtab
    \ shiftwidth=2
    \ softtabstop=2
    \ tabstop=8
