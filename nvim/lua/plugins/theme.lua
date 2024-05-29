return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
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
    }
  },
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
            max_length = vim.o.columns - 40,
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
    end
  }
}
