return {
	"jay-babu/mason-nvim-dap.nvim",
	config = function()
		require("mason-nvim-dap").setup({
			ensure_installed = { "java-debug-adapter", "java-test" },
		})
	end,
}
