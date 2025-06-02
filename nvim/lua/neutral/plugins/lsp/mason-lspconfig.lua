local opts = {
	ensure_installed = {
		"lua_ls",
		"efm",
	},
	automatic_installation = true,
}

return {
	"mason-org/mason-lspconfig.nvim",
	opts = opts,
	event = "BufReadPre",
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		"neovim/nvim-lspconfig",
	},
}
