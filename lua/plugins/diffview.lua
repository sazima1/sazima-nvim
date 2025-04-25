--[[
Name: Diffview
Language: N/A
Description: Pretty diff view in nvim
Notes:
  - I may remove this plugin as I am using LazyGit more and more. This might just never get used.
  - This plugin is just useful for merge conflicts, but again, LazyGit might just be better.
--]]
return {
	"sindrets/diffview.nvim",
	opts = {
		git_cmd = { os.getenv("HOME") .. "/bin/git" },
		view = {
			merge_tool = {
				layout = "diff3_mixed",
				-- layout = "diff4_mixed"
			},
		},
		file_panel = {
			win_config = {
				width = 50,
			},
		},
		keymaps = {
			file_panel = {
				["-"] = false,
				["S"] = false,
				["U"] = false,
				{
					"n",
					"a",
					function()
						actions = require("diffview.actions")
						-- local staged = tonumber(vim.cmd("!git diff --cached --numstat | wc -l"))
						local unstaged = vim.fn.system("git diff --name-only | wc -l")
						local untracked = vim.fn.system("git status --porcelain | grep '^??' | wc -l")
						local not_staged = unstaged + untracked
						if not_staged == 0 then
							actions.unstage_all()
						else
							actions.stage_all()
						end
					end,
					{ desc = "Stage / unstage all entries" },
				},
				{ "n", "c", "<cmd>G commit<CR>", { desc = "Commit staged changes with Fugitive" } },
			},
		},
	},
	cmd = {
		"DiffviewOpen",
		"DiffviewClose",
		"DiffviewFileHistory",
	},
	keys = {
		{
			"<leader>gd",
			function()
				if next(require("diffview.lib").views) == nil then
					vim.cmd("DiffviewOpen")
				else
					vim.cmd("DiffviewClose")
				end
			end,
			mode = "n",
			noremap = true,
			desc = "Toggle Diffview",
		},
		{
			"<leader>gD",
			function()
				if next(require("diffview.lib").views) == nil then
					vim.ui.input({ prompt = "DiffviewOpen [git rev] [options] [ -- {paths...} ]" }, function(options)
						if options ~= nil then
							vim.cmd("DiffviewOpen " .. options)
						else
							vim.cmd("DiffviewOpen")
						end
					end)
				else
					vim.cmd("DiffviewClose")
				end
			end,
			mode = "n",
			noremap = true,
			desc = "Toggle Diffview with options",
		},
		{
			"<leader>gh",
			function()
				if next(require("diffview.lib").views) == nil then
					vim.cmd("DiffviewFileHistory")
				else
					vim.cmd("DiffviewClose")
				end
			end,
			mode = "n",
			noremap = true,
			desc = "Toggle Diffview File History",
		},
		{
			"<leader>gH",
			function()
				if next(require("diffview.lib").views) == nil then
					vim.ui.input({ prompt = "DiffviewFileHistory [paths] [options]" }, function(options)
						if options ~= nil then
							vim.cmd("DiffviewFileHistory " .. options)
						else
							vim.cmd("DiffviewFileHistory")
						end
					end)
				else
					vim.cmd("DiffviewClose")
				end
			end,
			mode = "n",
			noremap = true,
			desc = "Toggle Diffview File History with options",
		},
	},
}
