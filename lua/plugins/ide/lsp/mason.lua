return {
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			name = "mason",
			opts = {
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			},
		},
		opts = {
			ensure_installed = {
				"bashls",
				"cssmodules_ls",
				"emmet_ls",
				"clangd",
				"lua_ls",
				"bashls",
				"yamlls",
				"html",
				"tsserver",
				"tailwindcss",
				"vimls",
				"rust_analyzer",
				"typst_lsp",
				"taplo",
				"jsonls",
				"lemminx",
				"cssls",
				"omnisharp",
				"gopls",
				"marksman",
				"sqlls",
				"unocss"
			},
		},
		---@type '"prepend"' | '"append"' | '"skip"'
		PATH = "prepend",
		log_level = vim.log.levels.INFO,
		-- Mina: Up from 4
		max_concurrent_installers = 12,
		registries = {
			"github:mason-org/mason-registry",
		},
		providers = {
			"mason.providers.registry-api",
			"mason.providers.client",
		},
		github = {
			download_url_template = "https://github.com/%s/releases/download/%s/%s",
		},
		pip = {
			upgrade_pip = false,
			install_args = {},
		},
		ui = {
			check_outdated_packages_on_open = true,
			border = "none",
			width = 0.8,
			height = 0.9,
			icons = {
				package_installed = "◍",
				package_pending = "◍",
				package_uninstalled = "◍",
			},
			keymaps = {
				toggle_package_expand = "<CR>",
				install_package = "i",
				update_package = "u",
				check_package_version = "c",
				update_all_packages = "U",
				check_outdated_packages = "C",
				uninstall_package = "X",
				cancel_installation = "<C-c>",
				apply_language_filter = "<C-f>",
				toggle_package_install_log = "<CR>",
				toggle_help = "g?",
			},
		},
	},
	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"nvimtools/none-ls.nvim",
		},
		opts = {
			automatic_setup = true,
			automatic_installation = true,
			ensure_installed = {
				"stylua",
				"shellharden",
				"astyle",
				"black",
				"beautysh",
				"cpptools",
				"yamlfmt",
				"flake8",
				"jedi-language-server",
				"mypy",
				"ruff",
			},
		},
	},
}
