return {
  { 'github/copilot.vim' },
  { 'slim-template/vim-slim' },
  {
    'dense-analysis/ale',
    enabled = true,
    config = function()
      -- Configuration goes here.
      local g = vim.g

      g.ale_ruby_rubocop_auto_correct_all = 1
      g.ale_linters = { ruby = {'rubocop', 'ruby'}, lua = {'lua_language_server'} }
      g.ale_fixers = { ruby = {'rubocop'}, lua = {'lua_format'} }

      vim.api.nvim_set_keymap('n', '<leader>cf', ':ALEFix<CR>', { noremap = true, silent = true })
    end
  },
  { -- Autocompletion
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      {
        'L3MON4D3/LuaSnip',
        build = (function()
          if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
            return
          end
          return 'make install_jsregexp'
        end)(),
        dependencies = {
        },
      },
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
    },
    config = function()
      -- See `:help cmp`
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'
      luasnip.config.setup {}

      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        completion = { completeopt = 'menu,menuone,noinsert' },

        mapping = cmp.mapping.preset.insert {
          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-y>'] = cmp.mapping.confirm { select = true },
          ['<C-Space>'] = cmp.mapping.complete {},
          ['<C-l>'] = cmp.mapping(function()
            if luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            end
          end, { 'i', 's' }),
          ['<C-h>'] = cmp.mapping(function()
            if luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            end
          end, { 'i', 's' }),
        },
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'path' },
        },
      }
    end,
  },
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    opts = {
      provider = "openai", -- "claude" or "openai" or "azure"
      openai = {
        endpoint = "https://api.openai.com",
        model = "gpt-4o",
        temperature = 0,
        max_tokens = 4096,
      },
      azure = {
        endpoint = "", -- Example: "https://<your-resource-name>.openai.azure.com"
        deployment = "", -- Azure deployment name (e.g., "gpt-4o", "my-gpt-4o-deployment")
        api_version = "2024-06-01",
        temperature = 0,
        max_tokens = 4096,
      },
      claude = {
        endpoint = "https://api.anthropic.com",
        model = "claude-3-5-sonnet-20240620",
        temperature = 0,
        max_tokens = 4096,
      },
      highlights = {
        diff = {
          current = "DiffText", -- need have background color
          incoming = "DiffAdd", -- need have background color
        },
      },
      mappings = {
        show_sidebar = "<leader>aa",
        diff = {
          ours = "co",
          theirs = "ct",
          none = "c0",
          both = "cb",
          next = "]x",
          prev = "[x",
        },
      },

    },
    build = "make",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      {
        "grapp-dev/nui-components.nvim",
        dependencies = {
          "MunifTanjim/nui.nvim"
        }
      },
      "nvim-lua/plenary.nvim",
      "MeanderingProgrammer/render-markdown.nvim",
    },
  }
}
