 
vim.g.mapleader = " "
vim.g.maplocalleader = " "


-- for neotree
vim.keymap.set('n' , "<leader>jj" , "<cmd>Neotree toggle<CR>", {
  desc = "Toggle Neo-tree"
})
--

--for telescope
vim.keymap.set("n", "<leader><leader>", "<cmd>Telescope find_files<CR>", {
  desc = "Quick file search"
})

vim.keymap.set("n", "<leader>c", "<cmd>Telescope commands<CR>", {
  desc = "command pallet"
})


vim.keymap.set("n", "<leader>c", "<cmd>telescope colorscheme<cr>", {
  desc = "color schemes"
})

--

