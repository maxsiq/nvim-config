return {
    'hrsh7th/nvim-cmp',
    dependencies = {
        'L3MON4D3/LuaSnip',               -- LuaSnip for snippets
        'saadparwaiz1/cmp_luasnip',       -- cmp source for LuaSnip
        'rafamadriz/friendly-snippets',   -- Snippets collection
        'hrsh7th/cmp-nvim-lsp',           -- nvim-lsp source for completion
    },
    config = function()
        local cmp = require('cmp')
        local luasnip = require('luasnip')

        -- Lazy load VSCode snippets
        require('luasnip.loaders.from_vscode').lazy_load()

        -- LuaSnip setup
        luasnip.config.setup {}

        -- nvim-cmp setup
        cmp.setup {
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert {
                ['<C-n>'] = cmp.mapping.select_next_item(),
                ['<C-p>'] = cmp.mapping.select_prev_item(),
                ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete {},
                ['<CR>'] = cmp.mapping.confirm {
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = true,
                },
                ['<S-Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.locally_jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { 'i', 's' }),
            },
            sources = {
				{ name = 'nvim_lsp' },
                { name = 'luasnip' },
            },
        }
    end,
}
