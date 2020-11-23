hi Comment cterm=italic
let g:nvcode_termcolors=256

syntax on
" colorscheme nord
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_invert_selection='0'
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
" colorscheme OceanicNext
set background=dark
" colorscheme gruvbox
let base16colorspace=256
colorscheme base16-irblack
" colorscheme nvcode
" colorscheme onedark
" colorscheme TSnazzy
" colorscheme aurora


" checks if your terminal has 24-bit color support
if (has("termguicolors"))
    set termguicolors
    hi LineNr ctermbg=NONE guibg=NONE
endif
