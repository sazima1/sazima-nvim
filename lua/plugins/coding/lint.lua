return {
	"mfussenegger/nvim-lint",
	dependencies = {
		"williamboman/mason.nvim",
	},
	keys = {
		{
			"<leader>yl",
			function()
				require("lint").try_lint()
			end,
			mode = { "n" },
			desc = "Trigger linting for current file",
		},
	},
	config = function()
		local lint = require("lint")
		lint.linters_by_ft = {
			python = { "ruff", "mypy", "pylint" },
			lua = { "selene" },
			markdown = { "markdownlint" },
			sh = { "shellcheck" },
			latex = { "vale" },
		}

		lint.linters.markdownlint.args = {
			"--config",
			"~/.config/nvim/markdownlint.toml",
			"--",
		}
	end,
}
