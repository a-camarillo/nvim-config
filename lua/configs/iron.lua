local iron = require "iron.core"
local view = require "iron.view"
local common = require "iron.fts.common"

iron.setup({
    config = {
      scratch_repl = true,
      repl_definition = {
        python = {
          command = { "python3" },
          block_dividers = {"# %%", "#%%"},
          format = common.bracketed_paste_python,
          env = {PYTHON_BASIC_REPL = "1"},
        },
      },
      repl_open_cmd = view.split.vertical.botright(50),
      keymaps = {
        toggle_repl = "<leader><space>rr",
        restart_repl = "<leader>rR",
        send_file = "<leader><space>sf",
        send_line = "<leader><space>sl",
        send_code_block = "<leader><space>sb",
      },
      ignore_blank_lines = true,
    },
})

-- TODO: Write function to map iron keys, keymaps in setup is not working
-- for some reason
--local function map_keys()
--  for key, keybind in pairs(iron.keymaps) do
--    vim.keymap.set('n', keybind)
--  end
--end
