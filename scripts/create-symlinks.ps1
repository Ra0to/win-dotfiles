New-Item -ItemType SymbolicLink -Path "$HOME\AppData\local\nvim\init.lua" -Target "$HOME\.configs\nvim\init.lua"
New-Item -ItemType SymbolicLink -Path "$HOME\.gitconfig" -Target "$HOME\.configs\git\.gitconfig"
New-Item -ItemType SymbolicLink -Path "$HOME\.ideavimrc" -Target "$HOME\.configs\rider\.ideavimrc"
