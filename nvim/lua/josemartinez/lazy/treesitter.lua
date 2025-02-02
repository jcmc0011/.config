return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
        "nvim-lua/plenary.nvim"
    },

    dependencies = { "RRethy/nvim-treesitter-endwise" },
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "bash",
                "embedded_template",
                "html",
                "javascript",
                "json",
                "lua",
                "markdown",
                "markdown_inline",
                "query",
                "regex",
                "ruby",
                "tsx",
                "vim",
                "yaml",
                "vimdoc",
            },
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = { "markdown" },
            },
            indent = { enable = true, disable = { "javascript", "yaml", "ruby" } },
            endwise = { enable = true },
            sync_install = false,
            auto_install = true,
        })

        local treesitter_parser_config = require(
            "nvim-treesitter.parsers"
        ).get_parser_configs()

        treesitter_parser_config.templ = {
            install_info = {
                url = "https://github.com/vrischmann/tree-sitter-templ.git",
                files = {"src/parser.c", "src/scanner.c"},
                branch = "master",
            },
        }

        vim.treesitter.language.register("templ", "templ")
    end
}
