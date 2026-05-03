local quarto = require 'quarto'

quarto.setup({
  debug = false,
  closePreviewOnExit = true,
  lspFeatures = {
    enable = true,
    chunks = "curly",
    languages = { "python" },
    diagnostics = {
      enabled = true,
      triggers = { "BufWritePost" },
    },
    completion = {
      enabled = true,
    },
  },
  codeRunner = {
    enabled = false,
  },
})

vim.keymap.set('n', '<leader>qp', quarto.quartoPreview, { silent = true, noremap = true})

