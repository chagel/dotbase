-- Colorscheme: follow whatever the rest of the desktop is set to, from
-- whichever theme system is host. Omarchy first, then Dotnux's scripts/theme,
-- then catppuccin so this config still stands alone on a bare machine.

-- Omarchy names a colorscheme plugin per theme and writes the choice to its
-- theme state directory on every switch. The file is a LazyVim-shaped spec:
-- the plugin, plus a LazyVim entry whose opts carry the colorscheme name.
-- This config is plain lazy.nvim, so take the plugin and set the colorscheme
-- here rather than pulling LazyVim in to read one option.
local function omarchy_colorscheme()
  local file = vim.fn.expand("~/.local/state/omarchy/current/theme/neovim.lua")
  if not vim.uv.fs_stat(file) then
    return nil
  end

  local ok, spec = pcall(dofile, file)
  if not ok or type(spec) ~= "table" then
    return nil
  end

  local name, repos = nil, {}
  for _, entry in ipairs(spec) do
    local repo = entry[1]
    if repo == "LazyVim/LazyVim" then
      name = entry.opts and entry.opts.colorscheme
    elseif repo then
      table.insert(repos, repo)
    end
  end

  -- A theme that names no plugin, or no colorscheme, is not usable here; fall
  -- through rather than starting with a half-applied theme.
  if not name or #repos == 0 then
    return nil
  end

  local out = {}
  for i, repo in ipairs(repos) do
    table.insert(out, {
      repo,
      lazy = false,
      priority = 1000,
      -- Applied once, after the last of them is on the runtimepath.
      config = (i == #repos) and function()
        pcall(vim.cmd.colorscheme, name)
      end or nil,
    })
  end

  return out
end

local generated = vim.fn.expand("~/Dotfiles/themes/nvim.lua")
local colorscheme = omarchy_colorscheme()

if colorscheme then
  -- nothing further: omarchy is driving the theme
elseif vim.uv.fs_stat(generated) then
  colorscheme = dofile(generated)
else
  colorscheme = {
    {
      'catppuccin/nvim',
      name = 'catppuccin',
      priority = 1000,
      opts = {
        flavour = "mocha",
        background = 'dark',
        transparent = true,
        term_colors = false,
        dim_inactive = {
          enabled = false, -- dims the background color of inactive window
          shade = "dark",
          percentage = 0.15, -- percentage of the shade to apply to the inactive window
        },
      },
      config = function(_, opts)
        require("catppuccin").setup(opts)
        vim.cmd.colorscheme("catppuccin")
      end,
    },
  }
end

local specs = {
  {
    'stevearc/dressing.nvim',
    opts = {},
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    -- See `:help ibl`
    main = 'ibl',
    opts = {
      indent = {
        char = "│",
        tab_char = "│",
      },
      scope = { enabled = false },
    },
  },
  {
    "echasnovski/mini.indentscope",
    version = false,
    enabled = true,
    opts = {
      symbol = "│",
      options = { try_as_border = true },
    },
  },
  {
    'nvim-lualine/lualine.nvim',
    event = "VeryLazy",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = function()
      return {
        options = {
          icons_enabled = true,
          theme = 'auto',
          component_separators = { left = '>', right = '<'},
          section_separators = { left = '', right = ''},
          disabled_filetypes = {
            statusline = {},
            winbar = {},
          },
          ignore_focus = {},
          always_divide_middle = true,
          globalstatus = true,
          refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
          }
        },
        sections = {
          lualine_a = {'mode'},
          lualine_b = {'branch', 'diff', 'diagnostics'},
          lualine_c = {
            {
              'filename',
              file_status = true,
              path = 3,
              shorting_target = 40
            }
          },
          lualine_x = {'filetype'},
          lualine_y = {'progress'},
          lualine_z = {'location'}
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {'filename'},
          lualine_x = {'location'},
          lualine_y = {},
          lualine_z = {}
        },
        tabline = {
          lualine_a = {{
            'tabs',
            mode = 2,
            max_length = vim.o.columns,
            tab_max_length = 40,
            use_mode_colors = true,
            component_separators = { left = ' ', right = ' '},
            symbols = { modified = ' ●' }

          }},
        },
        winbar = {},
        inactive_winbar = {},
        extensions = {}
      }
      -- require('transparent').clear_prefix('lualine')
    end
  },
  {
    'xiyaowong/nvim-transparent',
    opts = {
      enabled = false,
      groups = {
        'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
        'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
        'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
        'SignColumn', 'CursorLine', 'CursorLineNr', 'StatusLine', 'StatusLineNC',
        'EndOfBuffer',
      },
      extra_groups = {
        "NormalFloat",
        "NvimTreeNormal"
      },
    }
  }
}

vim.list_extend(specs, colorscheme)
return specs
