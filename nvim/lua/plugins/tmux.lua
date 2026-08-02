return {
  {
    "christoomey/vim-tmux-navigator",
    -- Under herdr this plugin cannot do its job: it detects a session by $TMUX,
    -- which herdr does not set, so its commands collapse to a plain wincmd and
    -- ctrl+hjkl would stop at the edge of the window layout. config/herdr.lua
    -- owns those keys there instead.
    cond = vim.env.HERDR_ENV == nil,
    event = "VimEnter",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },
}
