local keymaps = {
  { 'gd', 'lsp_definitions', '[G]oto [D]efinition' },
  { 'gr', 'lsp_references', '[G]oto [R]eferences' },
  { 'gI', 'lsp_implementations', '[G]oto [I]mplementation' },
  { '<leader>D', 'lsp_type_definitions', 'Type [D]efinition' },
  { '<leader>ds', 'lsp_document_symbols', '[D]ocument [S]ymbols' },
  { '<leader>ws', 'lsp_dynamic_workspace_symbols', '[W]orkspace [S]ymbols' },
}

local function setup_keymaps(event)
  local telescope = require('telescope.builtin')

  for _, keymap in ipairs(keymaps) do
    vim.keymap.set('n', keymap[1], telescope[keymap[2]], {
      buffer = event.buf,
      desc = 'LSP: ' .. keymap[3]
    })
  end

  local lsp_keymaps = {
    { '<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame' },
    { '<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction' },
    { 'K', vim.lsp.buf.hover, 'Hover Documentation' },
    { 'gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration' },
  }

  for _, keymap in ipairs(lsp_keymaps) do
    vim.keymap.set('n', keymap[1], keymap[2], {
      buffer = event.buf,
      desc = 'LSP: ' .. keymap[3]
    })
  end
end

local function setup_document_highlight(event)
  local client = vim.lsp.get_client_by_id(event.data.client_id)
  if not client or not client.server_capabilities.documentHighlightProvider then
    return
  end

  local group = vim.api.nvim_create_augroup('lsp-document-highlight-' .. event.buf, { clear = true })

  vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
    buffer = event.buf,
    group = group,
    callback = vim.lsp.buf.document_highlight,
  })

  vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
    buffer = event.buf,
    group = group,
    callback = vim.lsp.buf.clear_references,
  })
end

local function on_lsp_attach(event)
  setup_keymaps(event)
  setup_document_highlight(event)
end

local servers = {
  ruby_lsp = {},
  rubocop = {},
  lua_ls = {
    settings = {
      Lua = {
        completion = {
          callSnippet = 'Replace',
        },
      },
    },
  },
  ts_ls = {},
  pyright = {},
  tailwindcss = {},
}

local tools = {
  'stylua',
}

return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      { 'j-hui/fidget.nvim', opts = {} },
      { 'folke/neodev.nvim', opts = {} },
    },
    config = function()
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
        callback = on_lsp_attach,
      })

      vim.lsp.set_log_level('WARN')

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

      require('mason').setup()

      local ensure_installed = vim.tbl_keys(servers)
      vim.list_extend(ensure_installed, tools)

      require('mason-tool-installer').setup {
        ensure_installed = ensure_installed
      }

      require('mason-lspconfig').setup {
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
            require('lspconfig')[server_name].setup(server)
          end,
        },
      }
    end,
  },
}
