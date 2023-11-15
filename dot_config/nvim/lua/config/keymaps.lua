-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Remove Alt-hj, they conflict with tmux
vim.keymap.del("n", "<A-k>")
vim.keymap.del("n", "<A-j>")
