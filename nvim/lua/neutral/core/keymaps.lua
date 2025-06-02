-- set leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opts = { noremap = true, silent = true }
local keymap = vim.keymap -- for conciseness
-- General Keymaps ------------------

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>:update<CR>", { desc = "Exit insert mode and save with jk" })
keymap.set("i", "<C-s>", "<ESC>:update<CR>", { desc = "Exit insert mode and save with Ctrl-s" })
keymap.set("n", "<C-s>", "<ESC>:update<CR>", { desc = "Save in mode and save with Ctrl-s" })

-- Clear Search Highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- Delete Single Character Without Copying Into Register
-- keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- Window Management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

-- tab management
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- Harpoon
-- keymap.set("n", "<leader>ha", require("harpoon.mark").add_file, { desc = "[a]dd file to harpoon" })
-- keymap.set("n", "<leader>hh", require("harpoon.ui").toggle_quick_menu, { desc = "toggle harpoon ui" })

--Comment Custom keybindings
keymap.set("n", "gc", function() require("Comment.api").toggle.linewise.current() end, { desc = "Toggle line comment" })
keymap.set("v", "gc", function() require("Comment.api").toggle.linewise.visual() end, { desc = "Toggle line comment in visual mode" })
keymap.set("n", "gC", function() require("Comment.api").toggle.blockwise.current() end, { desc = "Toggle block comment" })
keymap.set("v", "gC", function() require("Comment.api").toggle.blockwise.visual() end, { desc = "Toggle block comment in visual mode" })

-- LSP
opts.desc = "Go to references"
keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)
opts.desc = "Smart rename"
keymap.set("n", "<leader>gr", "<cmd>lua vim.lsp.buf.rename", opts)
opts.desc = "Go to declaration"
keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration", opts)
opts.desc = "Show LSP definitions"
keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
opts.desc = "Show LSP implementations"
keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
opts.desc = "Show LSP type definitions"
keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)
opts.desc = "See available code actions"
keymap.set({ "n", "v" }, "<leader>ga", "<cmd>lua vim.lsp.buf.code_action", opts)
opts.desc = "Format Buffer"
keymap.set({ "n", "v" }, "<leader>gf", "<cmd>lua vim.lsp.buf.format({ async = true })", opts)
opts.desc = "Show buffer diagnostics"
keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)
opts.desc = "Show line diagnostics"
keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
opts.desc = "Go to previous diagnostic"
keymap.set("n", "[d", function() vim.diagnostic.jump({ count = -1, float = true }) end, opts)
opts.desc = "Go to next diagnostic"
keymap.set("n", "]d", function() vim.diagnostic.jump({ count = 1, float = true }) end, opts)
opts.desc = "Show documentation for what is under cursor"
keymap.set("n", "K", vim.lsp.buf.hover, opts)
opts.desc = "Restart LSP"
keymap.set("n", "<leader>lr", ":LspRestart<CR>", opts)
keymap.set("i", "<C-Space>", "<cmd>lua vim.lsp.buf.completion()<CR>")

-- Miscellaneous
keymap.set("n", "<leader>tC","<cmd>s/\\<\\(\\w\\)\\(\\w*\\)\\>/\\u\\1\\L\\2/g<CR>:nohlsearch<CR>",{ desc = "Title case current line" })
-- File path copy
-- Copy just the filename
keymap.set("n", "<leader>yy", [[:let @+ = expand('%:t')<CR>]], opts)
-- Copy the relative path
keymap.set("n", "<leader>yr", [[:let @+ = expand('%:.')<CR>]], opts)
-- Copy the absolute path
keymap.set("n", "<leader>yf", [[:let @+ = expand('%:p')<CR>]], opts)

-- Move line in visual mode
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move lines down in visual selection" })
keymap.set("v", "K", ":m '>-2<CR>gv=gv", { desc = "Move lines up in visual selection" })

-- Indent lines in visual mode
keymap.set("v", "<", "<gv", opts)
keymap.set("v", ">", ">gv", opts)

-- Delete the selected text (_d) and paste (P) without overwriting clipboard
keymap.set("x", "<leader>p", [["_dP]])
-- paste without replacing clipboard in the selected text including lines
keymap.set("v", "p", '"_dP', opts)
-- delete selected text without overwriting clipboard
keymap.set("v", "<leader>xx", [["_d]])
-- delete word in normal mode without overwriting clipboard
keymap.set("n", "<leader>xw", [["_diw]])
keymap.set("n", "<leader>xW", [["_dW]])
-- delete line in normal mode without overwriting clipboard
keymap.set("n", "<leader>xx", [["_dd]])
-- delete char in normal mode without overwriting clipboard
keymap.set("n", "x", '"_x', opts)

-- Hilighlight on Yank
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highling on yanking text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
