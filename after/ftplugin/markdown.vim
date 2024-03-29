setlocal spell
setlocal complete+=kspell

syntax match todoCheckbox "\v.*\[\ \]"hs=e-2 conceal cchar=
syntax match todoCheckbox "\v.*\[x\]"hs=e-2 conceal cchar=
setlocal conceallevel=2

highlight Conceal guibg=NONE

"https://vi.stackexchange.com/a/4003/16249
syntax match NoSpellAcronym '\<\(\u\|\d\)\{3,}s\?\>' contains=@NoSpell
