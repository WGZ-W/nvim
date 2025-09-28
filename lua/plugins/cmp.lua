-- plugins.lua 中添加
return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    -- 'onsails/lspkind.nvim',  -- 用于美化补全项的图标
  },
  config = function()
    local cmp = require('cmp')
    -- local lspkind = require('lspkind')
    local luasnip = require("luasnip")

    cmp.setup({
    
      -- ... Your other configuration ...
    
      mapping = {
    
        -- ... Your other mappings ...
       ['<CR>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                if luasnip.expandable() then
                    luasnip.expand()
                else
                    cmp.confirm({
                        select = true,
                    })
                end
            else
                fallback()
            end
        end),
    
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.locally_jumpable(1) then
            luasnip.jump(1)
          else
            fallback()
          end
        end, { "i", "s" }),
    
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
    
        -- ... Your other mappings ...
      },
    
      -- ... Your other configuration ...
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
      },
--      mapping = cmp.mapping.preset.insert({
--        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
--        ['<C-f>'] = cmp.mapping.scroll_docs(4),
--        ['<C-Space>'] = cmp.mapping.complete(),
--        ['<C-e>'] = cmp.mapping.abort(),
--        ['<CR>'] = cmp.mapping.confirm({ select = true }),
--      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
      }),
      formatting = {
        -- format = lspkind.cmp_format()
      }
    })

    -- LSP 能力设置
    require('lspconfig').util.default_config.capabilities = 
      require('cmp_nvim_lsp').default_capabilities()
  end
}
