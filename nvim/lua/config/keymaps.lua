local discipline = require("craftzdog.discipline")

-- discipline.cowboy()

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("n", "x", '"_x')
keymap.set("n", "J", "5j")
keymap.set("n", "K", "5k")
keymap.set("n", "H", "^")
keymap.set("n", "L", "$")
keymap.set("v", "J", "5j")
keymap.set("v", "K", "5k")
keymap.set("v", "H", "^")
keymap.set("v", "L", "$")

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Delete a word backwards
keymap.set("n", "dw", 'vb"_d')

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Save with root permission (not working for now)
--vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

-- Disable continuations
keymap.set("n", "<Leader>o", "o<Esc>^Da", opts)
keymap.set("n", "<Leader>O", "O<Esc>^Da", opts)

-- Jumplist
keymap.set("n", "<C-m>", "<C-i>", opts)

-- New tab
keymap.set("n", "te", ":tabedit")
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)
-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)
-- Close window
keymap.set("n", "sc", "<C-w>c", opts)
keymap.set("n", "so", "<C-w>o", opts)
-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- Resize window
keymap.set("n", "s<left>", "<C-w><")
keymap.set("n", "s<right>", "<C-w>>")
keymap.set("n", "s<up>", "<C-w>+")
keymap.set("n", "s<down>", "<C-w>-")

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")
keymap.set("n", "<C-n>", ":nohl<Return>")

-- Diagnostics
keymap.set("n", "<C-j>", function()
	vim.diagnostic.goto_next()
end, opts)

keymap.set("n", "<leader>r", function()
	require("craftzdog.utils").replaceHexWithHSL()
end)
