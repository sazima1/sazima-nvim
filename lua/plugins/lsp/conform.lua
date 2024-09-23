return {
	"stevearc/conform.nvim",
	dependencies = { "mason.nvim" },
	event = { "BufWritePre", "BufReadPre", "BufNewFile" },
	cmd = "ConformInfo",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "ruff_format", "ruff_fix", "ruff_organize_imports" },
				sh = { "shfmt" },
				latex = { "latexindent" },
				bibtex = { "bibtex-tidy" },
				markdown = { "prettier", "markdownlint", "markdown-toc" },
				yaml = { "prettier" },
			},
			-- format_on_save = {
			-- 	-- These options will be passed to conform.format()
			-- 	timeout_ms = 500,
			-- 	lsp_format = "fallback",
			-- },
			formatters = {
				-- ruff_format = {
				-- 	append_args = { "--line-length", "100" },
				-- },
				-- -- black = {
				-- -- 	prepend_args = { "--line-length", "100" },
				-- -- },
			},
		})

		-- Commands

		local usercmd = vim.api.nvim_create_user_command

		usercmd("Format", function(args)
			local range = nil
			if args.count ~= -1 then
				local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
				range = {
					start = { args.line1, 0 },
					["end"] = { args.line2, end_line:len() },
				}
			end
			require("conform").format({ async = true, lsp_format = "fallback", range = range })
		end, { range = true, desc = "Format current buffer" })

		-- Keymaps

		local map = vim.keymap.set

		map("n", "<leader>cf", '<cmd>lua require("conform").format()<CR>', { noremap = true, desc = "Run formatter" })
	end,
}
