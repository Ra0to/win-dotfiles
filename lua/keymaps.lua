-- KeyMapping

local function nmap(alias, command)
    vim.api.nvim_set_keymap('n', alias, command, { noremap = true })
end

nmap('<C-L>', ':nohlsearch<CR>')

-- Telescope keymap
nmap('<Leader>ff', ':Telescope find_files<CR>') -- Try to add double shift hotkey

-- NerdTree keymap
nmap('<Leader>n', ':NERDTreeFocus<CR>')
