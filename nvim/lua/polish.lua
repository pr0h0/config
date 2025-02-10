-- if true then return end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Set up custom filetypes
vim.filetype.add {
  extension = {
    ejs = "html",
  },
  filename = {
    ["*.ejs"] = "html",
  },
  pattern = {
    ["~/%.config/foo/.*%.ejs"] = "html",
  },
}

vim.keymap.set("n", "<leader>lT", ":AerialNavToggle<CR>", { desc = "Toggle Aerial" })
vim.keymap.set("i", "jj", "<Esc>")
vim.opt.foldmethod = "syntax"

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.cmd "Neotree show"
    vim.cmd "set foldmethod=syntax"
  end,
})

vim.api.nvim_del_keymap("i", "<C-]>")

-- Copilot binds :)
vim.keymap.set("i", "<C-]>", "<Plug>(copilot-suggest)")
vim.keymap.set("i", "<C-l><C-l>", "<Plug>(copilot-accept-word)")
vim.keymap.set("i", "<C-l>", "<Plug>(copilot-accept-line)")
vim.keymap.set("i", "<C-:>", "<Plug>(copilot-previous)")
vim.keymap.set("i", "<C-;>", "<Plug>(copilot-next)")

-- enter delete mode with <C-d> while in insert mode
vim.keymap.set("i", "<C-d>", "<C-o>d")

-- enable save even when in insert mode using :w and return to insert mode
vim.keymap.set("i", ":w<cr>", "<Esc>:w<cr>a")

-- Space + U displays the undo tree
vim.keymap.set("n", "<leader>U", vim.cmd.UndotreeToggle, { desc = "Toggle undo tree" })

-- git sign options
vim.keymap.set("n", "<leader>gTl", ":Gitsigns toggle_linehl<cr>", { desc = "Toggle diff line highlight" })
vim.keymap.set("n", "<leader>gTb", ":Gitsigns toggle_current_line_blame<cr>", { desc = "Toggle current line blame" })

-- set foldmethod to syntax
vim.opt.foldmethod = "syntax"

vim.keymap.set("n", "<C-UP>", ":m-2<CR>", { desc = "Move line up" })
vim.keymap.set("n", "<C-DOWN>", ":m+<CR>", { desc = "Move line down" })
vim.keymap.set("v", "<C-UP>", ":m-2<CR><Esc>gv", { desc = "Move line up" })
vim.keymap.set("v", "<C-DOWN>", ":m'>+1<CR><Esc>gv", { desc = "Move line down" })

vim.keymap.set("n", "<C-A-UP>", ":t.<CR>", { desc = "Duplicate line " })
vim.keymap.set("n", "<C-A-DOWN>", "yy:pu<CR>", { desc = "Duplicate line" })
vim.keymap.set("v", "<C-A-UP>", ":t.<CR>", { desc = "Duplicate line" })
vim.keymap.set("v", "<C-A-DOWN>", "y:pu<CR>", { desc = "Duplicate line" })
