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

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4


vim.o.relativenumber = true

vim.g.mapleader = ","
local function set_vim_o()
	local settings = {
		expandtab = true,
		shiftwidth = 2,
		clipboard = 'unnamedplus',
		splitright = true
	}	
	for k, v in pairs(settings) do vim.o[k] = v end
end

local function set_vim_wo()
	local settings = {number = true, relativenumber = true, wrap = false}
	for k, v in pairs(settings) do vim.wo[k] = v end
end

local function set_vim_keymaps()
	local options_noremap = {noremap = false, silent = true}
	local options_remap = {noremap = true, silent = true}

	-- Windows and Split --
	vim.keymap.set('n', '<leader>v', '<cmd>vsplit<cr>')
	vim.keymap.set('n', '<C-l>', '<C-w>l')
	vim.keymap.set('n', '<C-h>', '<C-w>h')
	vim.keymap.set('n', '<C-j>', '<C-w>j')
	vim.keymap.set('n', '<C-k>', '<C-w>k')

	-- Telescope --
	vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>', options_remap)
	vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', options_remap)

	-- Floaterm -- 
	vim.keymap.set('n', '<leader>tt', '<cmd>FloatermNew<cr>', options_remap)

    -- Oil --
    vim.keymap.set('n', '<leader>o', '<cmd>vsplit<cr> | <cmd>Oil .<cr>', options_remap)

	-- Lsp Stuff --
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration)
	vim.keymap.set('n', 'K', vim.lsp.buf.hover)
	vim.keymap.set('n','<leader>cm', '<cmd>Mason<cr>')
end

set_vim_o()
set_vim_wo()
set_vim_keymaps()
require("lazy").setup("plugins")
