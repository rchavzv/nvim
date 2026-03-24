return {
	"brianhuster/live-preview.nvim",
	cmd = { "LivePreview" }, -- carga solo cuando usas el comando
	config = function()
		require("live-preview").setup({
			port = 5500,
			browser = "default",
			dynamic_root = true,
			sync_scroll = true,
		})
	end,
}
