-- ctrl+hjkl under herdr: move between vim windows first, and hand off to herdr
-- once vim has no window left in that direction. This is the vim half of the
-- handshake; the herdr half is scripts/herdr-navigate in the Dotnux repo, which
-- decides whether herdr forwards the key to vim at all instead of moving pane
-- focus itself. plugins/tmux.lua covers the same ground under tmux, where
-- vim-tmux-navigator already implements both halves.
--
-- This is a config module rather than a plugin spec for two reasons: there is
-- no plugin to install, and load order matters. init.lua requires it after
-- config.keymaps, so these mappings are the last writer for these keys.

local M = {}

local directions = {
  { key = "<C-h>", wincmd = "h", pane = "left" },
  { key = "<C-j>", wincmd = "j", pane = "down" },
  { key = "<C-k>", wincmd = "k", pane = "up" },
  { key = "<C-l>", wincmd = "l", pane = "right" },
}

function M.setup()
  if vim.env.HERDR_ENV == nil then
    return
  end

  for _, d in ipairs(directions) do
    vim.keymap.set("n", d.key, function()
      local from = vim.api.nvim_get_current_win()
      vim.cmd.wincmd(d.wincmd)
      if from ~= vim.api.nvim_get_current_win() then
        return
      end
      -- Name the pane rather than relying on `--current`, which reads the
      -- calling process's environment and is ambiguous once the focused
      -- workspace is not the one this vim lives in.
      vim.system({
        "herdr",
        "pane",
        "focus",
        "--pane",
        vim.env.HERDR_PANE_ID,
        "--direction",
        d.pane,
      })
    end, { silent = true, desc = "Go to " .. d.pane .. " window or herdr pane" })
  end
end

return M
