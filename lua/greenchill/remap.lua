vim.g.mapleader = " "
vim.keymap.set("n", "<leader>ds", vim.cmd.NvimTreeFindFile)
-- vim.keymap.set("n", "<leader>,", vim.cmd.EslintFixAll)
vim.keymap.set("n", "<leader>,", vim.lsp.buf.format)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>")

vim.keymap.set("n", "<leader><leader>", function()
  vim.cmd("so")
end)

-- Case-sensitive movement

local camelchar = "A-Z0-9.,;:{([`'\""

_G.search_backward = function()
  vim.fn.search('\\C\\<\\<Bar>\\%(^\\<Bar>[^'..camelchar..']\\@<=\\)['..camelchar..']\\<Bar>['..camelchar..']\\ze\\%([^'..camelchar..']\\&\\>\\@!\\)\\<Bar>\\%^', 'bW')
end

_G.search_forward = function()
  vim.fn.search('\\C\\<\\<Bar>\\%(^\\<Bar>[^'..camelchar..']\\@<=\\)['..camelchar..']\\<Bar>['..camelchar..']\\ze\\%([^'..camelchar..']\\&\\>\\@!\\)\\<Bar>\\%$', 'W')
end

vim.keymap.set('n', '<C-Left>', ':lua search_backward()<CR>', { silent = true, noremap = true })
vim.keymap.set('n', '<C-Right>', ':lua search_forward()<CR>', { silent = true, noremap = true })
vim.keymap.set('i', '<C-Left>', '<C-o>:lua search_backward()<CR>', { silent = true, noremap = true })
vim.keymap.set('i', '<C-Right>', '<C-o>:lua search_forward()<CR>', { silent = true, noremap = true })
vim.keymap.set('v', '<C-Left>', ':lua search_backward()<CR>gv', { silent = true, noremap = true })
vim.keymap.set('v', '<C-Right>', ':lua search_forward()<CR>gv', { silent = true, noremap = true })
