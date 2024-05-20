return {

    { -- LSP Configuration & Plugins
        'neovim/nvim-lspconfig',
        init_options = {
            userLanguages = {eelixir = "html-eex", eruby = "erb", rust = "html"}
        },
        dependencies = {
            -- Automatically install LSPs to stdpath for neovim
            'williamboman/mason.nvim', 'williamboman/mason-lspconfig.nvim',

            -- Additional lua configuration, makes nvim stuff amazing!
            'folke/neodev.nvim'
        }
    }
}
