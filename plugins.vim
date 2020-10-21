" Automatically download plug.vim if not avaialable
if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
  echo "Downloading junegunn/vim-plug to manage plugins..."
  silent !mkdir -p ~/.config/nvim/autoload/
  silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
  autocmd VimEnter * PlugInstall
endif

" Plugins
call plug#begin('~/.vim/plugged')
  " Fuzzy find
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'stsewd/fzf-checkout.vim'
  Plug 'psliwka/vim-smoothie'
  " Gruvbox colorscheme
  Plug 'whatyouhide/vim-gotham'
  Plug 'sickill/vim-monokai'
  Plug 'patstockwell/vim-monokai-tasty'
  Plug 'ayu-theme/ayu-vim'
  Plug 'gruvbox-community/gruvbox'
  Plug 'sainnhe/gruvbox-material'
  Plug 'habamax/vim-gruvbit'
  Plug 'tomasiser/vim-code-dark'
  Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
  Plug 'arcticicestudio/nord-vim'
  Plug 'sjl/badwolf'
  Plug 'tjdevries/gruvbuddy.nvim'
  Plug 'tjdevries/colorbuddy.vim'
  Plug 'kyazdani42/blue-moon'
  Plug 'lifepillar/vim-solarized8'
  Plug 'dracula/vim', { 'as': 'dracula' }
  " Floating terminal
  Plug 'voldikss/vim-floaterm'
  " LSP
  " Plug 'neovim/nvim-lsp'
  Plug 'neovim/nvim-lspconfig'
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
  " tree-sitter
  Plug 'nvim-treesitter/nvim-treesitter'
  " Completion sources
  Plug 'nvim-lua/completion-nvim'
  Plug 'steelsojka/completion-buffers'
  Plug 'nvim-treesitter/completion-treesitter'
  " Dignostics
  Plug 'nvim-lua/diagnostic-nvim'
  Plug 'nvim-lua/lsp-status.nvim'
  " different color for parentheses
  Plug 'luochen1990/rainbow'
  " Better airline
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'bling/vim-bufferline'
  " To track time
  Plug 'wakatime/vim-wakatime'
  " tpope pluggins
  " Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-scriptease'
  " Opening and closing pairs
  Plug 'jiangmiao/auto-pairs'
  " Plug 'rstacruz/vim-closer'
  " Funky icons
  Plug 'ryanoasis/vim-devicons'
  " To show colors like #c31213
  Plug 'norcalli/nvim-colorizer.lua'
  " Git plugins
  Plug 'airblade/vim-gitgutter'
  Plug 'kdheepak/lazygit.nvim'
  " Searching stuff
  Plug 'jremmen/vim-ripgrep'
  " for markdown previews
  " Plug 'JamshedVesuna/vim-markdown-preview'
  "Plug 'plasticboy/vim-markdown'
  " To remove whitespace
  Plug 'ntpeters/vim-better-whitespace'
  " Wiki for vim
  Plug 'vimwiki/vimwiki'
  " snippets setup
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  Plug 'hrsh7th/vim-vsnip-integ'
  Plug 'hrsh7th/vim-vsnip'
  " Flutter development
  Plug 'thosakwe/vim-flutter'
  Plug 'dart-lang/dart-vim-plugin'
  " Find, Filter, Preview, Pick. All lua, all the time
  Plug 'nvim-lua/telescope.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-lua/popup.nvim'
  Plug 'the-codingguy/telescope-checkout'
  " undo history
  Plug 'mbbill/undotree'
  " explorer
  Plug 'lambdalisue/fern.vim'
  Plug 'lambdalisue/fern-renderer-devicons.vim'
  "Plug 'fern-git-status.vim'
  " code runner
  Plug 'michaelb/sniprun', {'do': 'bash install.sh'}
  " Markdown preview
  " Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
  " Indent guides
  Plug 'Yggdroot/indentLine'
  " lua stuff
  Plug 'tjdevries/nlua.nvim'
  Plug 'euclidianAce/BetterLua.vim'
  "Plug 'vim-scripts/a.vim'
  " highlighting stuff
  Plug 'sheerun/vim-polyglot'
  Plug 'cdelledonne/vim-cmake'
  Plug 'majutsushi/tagbar'
  Plug 'christoomey/vim-run-interactive'
  Plug 'puremourning/vimspector'
  Plug 'gabrielsimoes/cfparser.vim'
  Plug 'mhinz/vim-startify'
  " roots to git
  "Plug 'airblade/vim-rooter'
  Plug 'RishabhRD/popfix'
  Plug 'RishabhRD/nvim-lsputils'
  Plug 'benmills/vimux'
  Plug 'tomtom/tcomment_vim'
call plug#end()
