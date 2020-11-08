" Automatically download plug.vim if not avaialable
if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
  echo "Downloading junegunn/vim-plug to manage plugins..."
  silent !mkdir -p ~/.config/nvim/autoload/
  silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
  autocmd VimEnter * PlugInstall
endif

" Plugins
call plug#begin()
    " Fuzzy find
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'stsewd/fzf-checkout.vim'
    Plug 'psliwka/vim-smoothie'
    " Gruvbox colorscheme
    Plug 'gruvbox-community/gruvbox'
    Plug 'romgrk/doom-one.vim'
    Plug 'lifepillar/gruvbox8'
    Plug 'christianchiarulli/nvcode-color-schemes.vim'
    " Floating terminal
    Plug 'voldikss/vim-floaterm'
    " LSP
    Plug 'neovim/nvim-lspconfig'
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    " tree-sitter
    Plug 'nvim-treesitter/nvim-treesitter'
    " Completion sources
    Plug 'nvim-lua/completion-nvim'
    Plug 'steelsojka/completion-buffers'
    " Plug 'nvim-treesitter/completion-treesitter'
    " Dignostics
    Plug 'nvim-lua/diagnostic-nvim'
    Plug 'nvim-lua/lsp-status.nvim'
    " Better airline
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    " To track time
    " Plug 'wakatime/vim-wakatime'
    " tpope pluggins
    " Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-scriptease'
    Plug 'tpope/vim-rhubarb'
    " Opening and closing pairs
    Plug 'jiangmiao/auto-pairs'
    " Plug 'rstacruz/vim-closer'
    " Funky icons
    Plug 'ryanoasis/vim-devicons'
    " To show colors like #c31213
    Plug 'norcalli/nvim-colorizer.lua'
    " Git plugins
    Plug 'airblade/vim-gitgutter'
    " Searching stuff
    Plug 'jremmen/vim-ripgrep'
    " for markdown previews
    " Plug 'JamshedVesuna/vim-markdown-preview'
    "Plug 'plasticboy/vim-markdown'
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
    " undo history
    Plug 'mbbill/undotree'
    " explorer
    Plug 'lambdalisue/fern.vim'
    Plug 'lambdalisue/fern-renderer-devicons.vim'
    "Plug 'fern-git-status.vim'
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
    Plug 'gabrielsimoes/cfparser.vim'
    " roots to git
    Plug 'RishabhRD/popfix'
    Plug 'RishabhRD/nvim-lsputils'
    Plug 'benmills/vimux'
    Plug 'tomtom/tcomment_vim'
    Plug 'cdelledonne/vim-cmake'
    Plug 'pboettch/vim-cmake-syntax'
    Plug 'romgrk/barbar.nvim'
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'sjl/badwolf'
    Plug 'dracula/vim'
    Plug 'tomasiser/vim-code-dark'
    Plug 'puremourning/vimspector'
    Plug 'szw/vim-maximizer'
call plug#end()
