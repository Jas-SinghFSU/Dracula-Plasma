-- Git blame binds
vim.keymap.set('n', '<leader>gbo', '<cmd>:GitBlameOpenFileURL<CR>', { silent = true })

vim.keymap.set('n', '<leader>n', ':NvimTreeToggle<CR>', { silent = true, noremap = true })
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true })

-- Bufferline tab switching
vim.keymap.set('n', '<leader>t1', ':lua require"bufferline".go_to_buffer(1)<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>t2', ':lua require"bufferline".go_to_buffer(2)<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>t3', ':lua require"bufferline".go_to_buffer(3)<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>t4', ':lua require"bufferline".go_to_buffer(4)<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>t5', ':lua require"bufferline".go_to_buffer(5)<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>t6', ':lua require"bufferline".go_to_buffer(6)<CR>', { noremap = true, silent = true })

-- Delete current buffer
vim.keymap.set('n', '<leader>td', '<cmd>:bd<CR>', { silent = true })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

--vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- remap normal mode to Alt + Space
vim.keymap.set("i", "<A-Space>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", function()
	CONFORM.format({async=true,lsp_fallback=true})
end)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.config/nvim/lua/plugin_loader.lua<CR>");
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

vim.keymap.set({ "n", "i" }, "<C-v>", '"+p')

--  LuaSnip snippet keybinds
vim.keymap.set({ "i" }, "<C-K>", function() LS.expand() end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-l>", function() LS.jump(1) end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-j>", function() LS.jump(-1) end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-E>", function()
    if LS.choice_active() then
        LS.change_choice(1)
    end
end, { silent = true })
