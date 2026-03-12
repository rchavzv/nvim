return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

		-- Inicializa Mason con íconos en la UI
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		-- Lista de servidores que queremos asegurar estén instalados
		local servers = {
			"clangd", -- C / C++
			"jdtls", -- Java
			"ts_ls", -- TypeScript / JavaScript
			"html",
			"cssls",
			"tailwindcss",
			"svelte",
			"lua_ls", -- Lua (configuración de Neovim)
			"graphql",
			"emmet_ls",
			"prismals",
			"pyright", -- Python
		}

		-- Configura mason-lspconfig para instalar automáticamente estos servidores si faltan
		mason_lspconfig.setup({
			ensure_installed = servers,
			automatic_installation = true,
		})
		mason_tool_installer.setup({
			ensure_installed = {
				"prettier", -- prettier formatter
				"stylua", -- lua formatter
				"isort", -- python formatter
				"black", -- python formatter
			},
			auto_update = true, -- actualiza herramientas automaticamente si hay nuevas versiones
			run_on_start = true, --instala o actualiza al inicio
			ignore = { "black", "isort" }, --si y estan en el path no instala
		})
	end,
}
