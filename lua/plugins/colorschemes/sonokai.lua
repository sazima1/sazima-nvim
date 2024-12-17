return {
	"sainnhe/sonokai",
	lazy = false,
	priority = 1000,
	config = function()
		local g = vim.g

		g.sonokai_diagnostic_text_highlight = 1
		g.sonokai_diagnostic_line_highlight = 1
		g.sonokai_diagnostic_virtual_text = 1
	end,
}
