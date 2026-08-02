require("config")
require("config.keymaps")
require("config.options")
require("config.settings")
-- After config.keymaps, whose plain <C-W> window maps cover the same keys.
require("config.herdr").setup()
