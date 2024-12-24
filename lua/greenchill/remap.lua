vim.g.mapleader = " "
vim.keymap.set("n", "<leader>ds", vim.cmd.NvimTreeFindFile)
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

-- Remap c-w pane movement

vim.keymap.set('n', '<leader>wh', '<cmd>wincmd h<CR>', { silent = true })
vim.keymap.set('n', '<leader>wj', '<cmd>wincmd j<CR>', { silent = true })
vim.keymap.set('n', '<leader>wk', '<cmd>wincmd k<CR>', { silent = true })
vim.keymap.set('n', '<leader>wl', '<cmd>wincmd l<CR>', { silent = true })
vim.keymap.set('n', '<leader>ww', '<cmd>wincmd w<CR>', { silent = true })
vim.keymap.set('n', '<leader>wH', '<cmd>wincmd H<CR>', { silent = true })
vim.keymap.set('n', '<leader>wJ', '<cmd>wincmd J<CR>', { silent = true })
vim.keymap.set('n', '<leader>wK', '<cmd>wincmd K<CR>', { silent = true })
vim.keymap.set('n', '<leader>wL', '<cmd>wincmd L<CR>', { silent = true })
vim.keymap.set('n', '<leader>wT', '<cmd>wincmd T<CR>', { silent = true })
vim.keymap.set('n', '<leader>wx', '<cmd>wincmd x<CR>', { silent = true })
vim.keymap.set('n', '<leader>w=', '<cmd>wincmd =<CR>', { silent = true })
vim.keymap.set('n', '<leader>w_', '<cmd>wincmd _<CR>', { silent = true })
vim.keymap.set('n', '<leader>w|', '<cmd>wincmd |<CR>', { silent = true })
vim.keymap.set('n', '<leader>wc', '<cmd>wincmd c<CR>', { silent = true })
vim.keymap.set('n', '<leader>wo', '<cmd>wincmd o<CR>', { silent = true })
vim.keymap.set('n', '<leader>w+', '<cmd>wincmd +<CR>', { silent = true })
vim.keymap.set('n', '<leader>w-', '<cmd>wincmd -<CR>', { silent = true })
vim.keymap.set('n', '<leader>w>', '<cmd>wincmd ><CR>', { silent = true })
vim.keymap.set('n', '<leader>w<', '<cmd>wincmd <<CR>', { silent = true })
vim.keymap.set('n', '<leader>wr', '<cmd>wincmd r<CR>', { silent = true })
vim.keymap.set('n', '<leader>wR', '<cmd>wincmd R<CR>', { silent = true })
vim.keymap.set('n', '<leader>wq', '<cmd>wincmd q<CR>', { silent = true })
vim.keymap.set('n', '<leader>wv', '<cmd>wincmd v<CR>', { silent = true })
vim.keymap.set('n', '<leader>ws', '<cmd>wincmd s<CR>', { silent = true })
vim.keymap.set('n', '<leader>wp', '<cmd>wincmd p<CR>', { silent = true })
vim.keymap.set('n', '<leader>wt', '<cmd>wincmd t<CR>', { silent = true })

-- Case-sensitive movement

local camelchar = "A-Z0-9.,;:{([`'\""

_G.search_backward = function()
  vim.fn.search(
  '\\C\\<\\<Bar>\\%(^\\<Bar>[^' ..
  camelchar .. ']\\@<=\\)[' .. camelchar .. ']\\<Bar>[' ..
  camelchar .. ']\\ze\\%([^' .. camelchar .. ']\\&\\>\\@!\\)\\<Bar>\\%^', 'bW')
end

_G.search_forward = function()
  vim.fn.search(
  '\\C\\<\\<Bar>\\%(^\\<Bar>[^' ..
  camelchar .. ']\\@<=\\)[' .. camelchar .. ']\\<Bar>[' ..
  camelchar .. ']\\ze\\%([^' .. camelchar .. ']\\&\\>\\@!\\)\\<Bar>\\%$', 'W')
end

vim.keymap.set('n', '<C-Left>', ':lua search_backward()<CR>', { silent = true, noremap = true })
vim.keymap.set('n', '<C-Right>', ':lua search_forward()<CR>', { silent = true, noremap = true })
vim.keymap.set('i', '<C-Left>', '<C-o>:lua search_backward()<CR>', { silent = true, noremap = true })
vim.keymap.set('i', '<C-Right>', '<C-o>:lua search_forward()<CR>', { silent = true, noremap = true })
vim.keymap.set('v', '<C-Left>', ':lua search_backward()<CR>gv', { silent = true, noremap = true })
vim.keymap.set('v', '<C-Right>', ':lua search_forward()<CR>gv', { silent = true, noremap = true })

-- Gp: General

local function keymapOptions(desc)
  return {
    noremap = true,
    silent = true,
    nowait = true,
    desc = "GPT prompt " .. desc,
  }
end

vim.keymap.set({ "v" }, "<C-g>b", "<cmd>GpBufferChatNew<cr>", keymapOptions("New Chat /w buffer context"))
vim.keymap.set({ "n", "i" }, "<C-g>c", "<cmd>GpChatNew<cr>", keymapOptions("New Chat"))
vim.keymap.set({ "n", "i" }, "<C-g>t", "<cmd>GpChatToggle<cr>", keymapOptions("Toggle Chat"))
vim.keymap.set({ "n", "i" }, "<C-g>f", "<cmd>GpChatFinder<cr>", keymapOptions("Chat Finder"))

vim.keymap.set("v", "<C-g>c", ":<C-u>'<,'>GpChatNew<cr>", keymapOptions("Visual Chat New"))
vim.keymap.set("v", "<C-g>p", ":<C-u>'<,'>GpChatPaste<cr>", keymapOptions("Visual Chat Paste"))
vim.keymap.set("v", "<C-g>t", ":<C-u>'<,'>GpChatToggle<cr>", keymapOptions("Visual Toggle Chat"))

vim.keymap.set({ "n", "i" }, "<C-g><C-x>", "<cmd>GpChatNew split<cr>", keymapOptions("New Chat split"))
vim.keymap.set({ "n", "i" }, "<C-g><C-v>", "<cmd>GpChatNew vsplit<cr>", keymapOptions("New Chat vsplit"))
vim.keymap.set({ "n", "i" }, "<C-g><C-t>", "<cmd>GpChatNew tabnew<cr>", keymapOptions("New Chat tabnew"))

vim.keymap.set("v", "<C-g><C-x>", ":<C-u>'<,'>GpChatNew split<cr>", keymapOptions("Visual Chat New split"))
vim.keymap.set("v", "<C-g><C-v>", ":<C-u>'<,'>GpChatNew vsplit<cr>", keymapOptions("Visual Chat New vsplit"))
vim.keymap.set("v", "<C-g><C-t>", ":<C-u>'<,'>GpChatNew tabnew<cr>", keymapOptions("Visual Chat New tabnew"))

-- Gp: Prompt commands
vim.keymap.set({ "n", "i" }, "<C-g>r", "<cmd>GpRewrite<cr>", keymapOptions("Inline Rewrite"))
vim.keymap.set({ "n", "i" }, "<C-g>a", "<cmd>GpAppend<cr>", keymapOptions("Append (after)"))
vim.keymap.set({ "n", "i" }, "<C-g>b", "<cmd>GpPrepend<cr>", keymapOptions("Prepend (before)"))

vim.keymap.set("v", "<C-g>r", ":<C-u>'<,'>GpRewrite<cr>", keymapOptions("Visual Rewrite"))
vim.keymap.set("v", "<C-g>a", ":<C-u>'<,'>GpAppend<cr>", keymapOptions("Visual Append (after)"))
vim.keymap.set("v", "<C-g>v", ":<C-u>'<,'>GpBufferReplaceNew<cr>", keymapOptions("Visual Prepend (before)"))
vim.keymap.set("v", "<C-g>i", ":<C-u>'<,'>GpImplement<cr>", keymapOptions("Implement selection"))

vim.keymap.set({ "n", "i" }, "<C-g>gp", "<cmd>GpPopup<cr>", keymapOptions("Popup"))
vim.keymap.set({ "n", "i" }, "<C-g>ge", "<cmd>GpEnew<cr>", keymapOptions("GpEnew"))
vim.keymap.set({ "n", "i" }, "<C-g>gn", "<cmd>GpNew<cr>", keymapOptions("GpNew"))
vim.keymap.set({ "n", "i" }, "<C-g>gv", "<cmd>GpVnew<cr>", keymapOptions("GpVnew"))
vim.keymap.set({ "n", "i" }, "<C-g>gt", "<cmd>GpTabnew<cr>", keymapOptions("GpTabnew"))

vim.keymap.set("v", "<C-g>gp", ":<C-u>'<,'>GpPopup<cr>", keymapOptions("Visual Popup"))
vim.keymap.set("v", "<C-g>ge", ":<C-u>'<,'>GpEnew<cr>", keymapOptions("Visual GpEnew"))
vim.keymap.set("v", "<C-g>gn", ":<C-u>'<,'>GpNew<cr>", keymapOptions("Visual GpNew"))
vim.keymap.set("v", "<C-g>gv", ":<C-u>'<,'>GpVnew<cr>", keymapOptions("Visual GpVnew"))
vim.keymap.set("v", "<C-g>gt", ":<C-u>'<,'>GpTabnew<cr>", keymapOptions("Visual GpTabnew"))

vim.keymap.set({ "n", "i" }, "<C-g>x", "<cmd>GpContext<cr>", keymapOptions("Toggle Context"))
vim.keymap.set("v", "<C-g>x", ":<C-u>'<,'>GpContext<cr>", keymapOptions("Visual Toggle Context"))

vim.keymap.set({ "n", "i", "v", "x" }, "<C-g>s", "<cmd>GpStop<cr>", keymapOptions("Stop"))
vim.keymap.set({ "n", "i", "v", "x" }, "<C-g>n", "<cmd>GpNextAgent<cr>", keymapOptions("Next Agent"))

-- Gp: optional Whisper commands with prefix <C-g>w
vim.keymap.set({ "n", "i" }, "<C-g>ww", "<cmd>GpWhisper<cr>", keymapOptions("Whisper"))
vim.keymap.set("v", "<C-g>ww", ":<C-u>'<,'>GpWhisper<cr>", keymapOptions("Visual Whisper"))

vim.keymap.set({ "n", "i" }, "<C-g>wr", "<cmd>GpWhisperRewrite<cr>", keymapOptions("Whisper Inline Rewrite"))
vim.keymap.set({ "n", "i" }, "<C-g>wa", "<cmd>GpWhisperAppend<cr>", keymapOptions("Whisper Append (after)"))
vim.keymap.set({ "n", "i" }, "<C-g>wb", "<cmd>GpWhisperPrepend<cr>", keymapOptions("Whisper Prepend (before) "))

vim.keymap.set("v", "<C-g>wr", ":<C-u>'<,'>GpWhisperRewrite<cr>", keymapOptions("Visual Whisper Rewrite"))
vim.keymap.set("v", "<C-g>wa", ":<C-u>'<,'>GpWhisperAppend<cr>", keymapOptions("Visual Whisper Append (after)"))
vim.keymap.set("v", "<C-g>wb", ":<C-u>'<,'>GpWhisperPrepend<cr>", keymapOptions("Visual Whisper Prepend (before)"))

vim.keymap.set({ "n", "i" }, "<C-g>wp", "<cmd>GpWhisperPopup<cr>", keymapOptions("Whisper Popup"))
vim.keymap.set({ "n", "i" }, "<C-g>we", "<cmd>GpWhisperEnew<cr>", keymapOptions("Whisper Enew"))
vim.keymap.set({ "n", "i" }, "<C-g>wn", "<cmd>GpWhisperNew<cr>", keymapOptions("Whisper New"))
vim.keymap.set({ "n", "i" }, "<C-g>wv", "<cmd>GpWhisperVnew<cr>", keymapOptions("Whisper Vnew"))
vim.keymap.set({ "n", "i" }, "<C-g>wt", "<cmd>GpWhisperTabnew<cr>", keymapOptions("Whisper Tabnew"))

vim.keymap.set("v", "<C-g>wp", ":<C-u>'<,'>GpWhisperPopup<cr>", keymapOptions("Visual Whisper Popup"))
vim.keymap.set("v", "<C-g>we", ":<C-u>'<,'>GpWhisperEnew<cr>", keymapOptions("Visual Whisper Enew"))
vim.keymap.set("v", "<C-g>wn", ":<C-u>'<,'>GpWhisperNew<cr>", keymapOptions("Visual Whisper New"))
vim.keymap.set("v", "<C-g>wv", ":<C-u>'<,'>GpWhisperVnew<cr>", keymapOptions("Visual Whisper Vnew"))
vim.keymap.set("v", "<C-g>wt", ":<C-u>'<,'>GpWhisperTabnew<cr>", keymapOptions("Visual Whisper Tabnew"))
