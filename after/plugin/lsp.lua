local lsp = require('lsp-zero')
local lspconfig = require('lspconfig')

lsp.preset('recommended')
lsp.ensure_installed({
  'ts_ls',
  'lua_ls',
  'eslint',
  'rust_analyzer',
})

local cmp = require('cmp')
cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-t>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
  })
})

cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'git' },
  }, {
    { name = 'buffer' },
  })
})

cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()
lspconfig.lua_ls.setup {
  capabilities = capabilities
}

local function rename_file()
  local source_file, target_file

  vim.ui.input({
      prompt = "Source : ",
      completion = "file",
      default = vim.api.nvim_buf_get_name(0)
    },
    function(input)
      source_file = input
    end
  )
  vim.ui.input({
      prompt = "Target : ",
      completion = "file",
      default = source_file
    },
    function(input)
      target_file = input
    end
  )

  local params = {
    command = "_typescript.applyRenameFile",
    arguments = {
      {
        sourceUri = source_file,
        targetUri = target_file,
      },
    },
    title = ""
  }

  vim.lsp.util.rename(source_file, target_file)
  vim.lsp.buf.execute_command(params)
end


local mason_packages = vim.fn.stdpath("data") .. "/mason/packages"
local volar_path = mason_packages .. "/vue-language-server/node_modules/@vue/language-server"

lspconfig.ts_ls.setup {
  commands = {
    RenameFile = {
      rename_file,
      description = "Rename File"
    }
  },
  init_options = {
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = volar_path,
        languages = { "vue" },
      },
    },
    preferences = {
      importModuleSpecifierPreference = 'non-relative',
    },
  },
  settings = {
    typescript = {
      inlayHints = {
        includeInlayParameterNameHints = "all",
        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayVariableTypeHintsWhenTypeMatchesName = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      },
    },
  },
}

lspconfig.volar.setup {
  filetypes = { "vue" },
  init_options = {
    vue = {
      hybridMode = false,
    },
  },
  settings = {
    typescript = {
      inlayHints = {
        enumMemberValues = {
          enabled = true,
        },
        functionLikeReturnTypes = {
          enabled = true,
        },
        propertyDeclarationTypes = {
          enabled = true,
        },
        parameterTypes = {
          enabled = true,
          suppressWhenArgumentMatchesName = true,
        },
        variableTypes = {
          enabled = true,
        },
      },
    },
  },
}

lspconfig.cssls.setup {
  capabilities = capabilities
}

lspconfig.sqlls.setup {
  on_attach = function(client, bufnr)
    require('sqlls').on_attach(client, bufnr)
  end
}

lspconfig.tflint.setup {
  on_attach = function(client, bufnr)
    require('tflint').on_attach(client, bufnr)
  end
}

lspconfig.pyright.setup {
  on_attach = function(client, bufnr)
    require('pyright').on_attach(client, bufnr)
  end
}

lspconfig.yamlls.setup {
  on_attach = function(client, bufnr)
    require('yamlls').on_attach(client, bufnr)
  end
}

lspconfig.dockerls.setup {
  on_attach = function(client, bufnr)
    require('dockerls').on_attach(client, bufnr)
  end
}

lspconfig.docker_compose_language_service.setup {
  on_attach = function(client, bufnr)
    require('docker_compose_language_service').on_attach(client, bufnr)
  end
}

-- lspconfig.eslint.setup({
--   on_attach = function(client, bufnr)
--     require('eslint').on_attach(client, bufnr)
--   end,
--   settings = {
--     -- ESLint debug logs
--     env = { DEBUG = "eslint:*" },
--   },
-- })

require('rust-tools').setup({
  server = {
    capabilities = require('cmp_nvim_lsp').default_capabilities()
  }
})

lsp.set_preferences({
  suggest_lsp_servers = false,
  sign_icons = {
    error = 'E',
    warn = 'W',
    hint = 'H',
    info = 'I'
  }
})

lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }
  local bufmap = function(mode, lhs, rhs)
    vim.keymap.set(mode, lhs, rhs, { buffer = true })
  end

  if client.name == 'rust_analyzer' then
    local rt = require('rust-tools')
    bufmap('n', '<C-space>', rt.hover_actions.hover_actions)
    bufmap('n', '<leader>g', rt.code_action_group.code_action_group)
  end

  bufmap("n", "gd", function() vim.lsp.buf.definition() end)
  bufmap("n", "K", function() vim.lsp.buf.hover() end)
  bufmap("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end)
  bufmap("n", "<leader>vd", function() vim.diagnostic.open_float() end)
  bufmap("n", "[d", function() vim.diagnostic.goto_next() end)
  bufmap("n", "]d", function() vim.diagnostic.goto_prev() end)
  bufmap("n", "<leader>ca", function() vim.lsp.buf.code_action() end)
  bufmap("n", "<leader>vrr", function() vim.lsp.buf.references() end)
  bufmap("n", "<leader>vrn", function() vim.lsp.buf.rename() end)
  bufmap("i", "<C-h>", function() vim.lsp.buf.signature_help() end)
end)

lsp.setup()

vim.diagnostic.config({
  virtual_text = true
})

vim.lsp.set_log_level("off")
