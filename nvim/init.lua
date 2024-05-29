require("config")

require("lazy").setup("plugins")
require("config.keymaps")
require("config.options")
require("config.settings")

vim.cmd [[colorscheme catppuccin]]
