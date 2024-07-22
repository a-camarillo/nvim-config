require('oil').setup({
  use_default_keymaps = false,
  keymaps = {
    ['g?'] = 'actions.show_help',
    ['<CR>'] = 'actions.select',
    ['<C-c>'] = 'actions.close',
    ['-'] = 'actions.parent',
    ['_'] = 'actions.open_cwd',
  },
})
