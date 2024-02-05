local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to set `mapleader` before lazy so your mappings are correct
vim.g.mapleader = " "

require("lazy").setup({
	{ "michaeljsmith/vim-indent-object" },
	-- { "PeterRincker/vim-argumentative" },
	{ "Raimondi/delimitMate" },
	{ "tpope/vim-abolish" },
	{ "tpope/vim-commentary" },
	{ "tpope/vim-repeat" },
	{ "tpope/vim-speeddating" },
	{ "tpope/vim-surround" },
	-- gS to toggle splitting args to multiple lines
	{ "echasnovski/mini.splitjoin", version = "*" },

	{
		"echasnovski/mini.ai",
		-- keys = {
		--   { "a", mode = { "x", "o" } },
		--   { "i", mode = { "x", "o" } },
		-- },
		event = "VeryLazy",
		opts = function()
			local ai = require("mini.ai")
			return {
				n_lines = 500,
				custom_textobjects = {
					o = ai.gen_spec.treesitter({
						a = { "@block.outer", "@conditional.outer", "@loop.outer" },
						i = { "@block.inner", "@conditional.inner", "@loop.inner" },
					}, {}),
					f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }, {}),
					c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }, {}),
					t = { "<([%p%w]-)%f[^<%w][^<>]->.-</%1>", "^<.->().*()</[^/]->$" },
				},
			}
		end,
	},
})

require("mini.splitjoin").setup()
require("mini.ai").setup()

-- Yank to clipboard
vim.opt.clipboard = "unnamedplus"

-- Clear search highlight
vim.keymap.set("n", "<esc>", ":noh<return><esc>")

if vim.g.vscode then
	-- Only run within VSCode extension

	local vscode = require("vscode-neovim")

	-- vim-vinegar
	vim.keymap.set("n", "-", function()
		vscode.action("workbench.files.action.showActiveFileInExplorer")
		vscode.action("workbench.action.focusSideBar")
	end)

	-- format
	vim.keymap.set("n", "<Leader>=", function()
		vscode.action("editor.action.formatDocument")
	end)

	vim.keymap.set("n", "<Leader>+", function()
		vscode.action("rainbow-csv.Align")
	end)

	-- Close whole split with Ctrl-w c, not just the file.
	vim.keymap.set("n", "<C-w>c", function()
		vscode.action("workbench.action.closeEditorsInGroup")
	end)

	-- command pallet
	vim.keymap.set("n", "<Leader>:", function()
		vscode.action("workbench.action.showCommands")
	end)

	-- global search
	vim.keymap.set("n", "<Leader>/", function()
		vscode.action("workbench.view.search")
	end)

	vim.keymap.set("n", "<Leader>*", function()
		vscode.action("workbench.view.search")
	end)

	-- git
	vim.keymap.set("n", "<Leader>gg", function()
		vscode.action("workbench.view.scm")
	end)

	-- tests
	vim.keymap.set("n", "<Leader>tt", function()
		vscode.action("testing.runCurrentFile")
	end)

	vim.keymap.set("n", "<Leader>tr", function()
		vscode.action("testing.runAtCursor")
	end)

	vim.keymap.set("n", "<Leader>tdr", function()
		vscode.action("testing.debugAtCursor")
	end)

	vim.keymap.set("n", "<Leader>tl", function()
		vscode.action("testing.reRunLastRun")
	end)

	vim.keymap.set("n", "<Leader>tdl", function()
		vscode.action("testing.debugLastRun")
	end)

	-- lsp code action
	vim.keymap.set("n", "<Leader>ca", function()
		vscode.action("editor.action.quickFix")
	end)

	-- Next/prev git change
	vim.keymap.set("n", "[c", function()
		vscode.action("workbench.action.editor.previousChange")
	end)

	vim.keymap.set("n", "]c", function()
		vscode.action("workbench.action.editor.nextChange")
	end)

	-- Next/prev error
	vim.keymap.set("n", "[s", function()
		vscode.action("editor.action.marker.prev")
	end)

	vim.keymap.set("n", "]s", function()
		vscode.action("editor.action.marker.next")
	end)
else
	vim.opt.number = true
end

-- Smartcase for search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- delimitMate --
-- Make backspace work on inserted line breaks and indendation
vim.opt.backspace = "indent,eol,start"
-- Keep intent after completion
vim.g.delimitMate_expand_scape = 1
