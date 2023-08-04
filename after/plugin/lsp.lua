local lsp = require('lsp-zero')
local lspconfig =  require('lspconfig')

lsp.preset('recommended')
lsp.ensure_installed({
    'tsserver',
    'eslint',
    'lua_ls',
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
lspconfig.tsserver.setup {
  init_options = {
    preferences = {
      importModuleSpecifierPreference = 'non-relative',
    }
  }
}

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
    local opts = {buffer = bufnr, remap = false}
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
