-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Firenvim
vim.g.firenvim_config = {
  localSettings = {
    [".*"] = {
      takeover = "never", -- don't take over without a keypress
      cmdline = "firenvim", -- don't use noice, it doesn't work in firenvim
    },
  },
}
