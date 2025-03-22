--[[
Name: Nvim ZK
Language: markdown
Description: ZettelKasten with ZK in Neovim
--]]
return {
	"zk-org/zk-nvim",
	cmd = {
		"ZkNew",
		"ZkIndex",
		"ZkNewFromTitleSelection",
		"ZkNewFromContentSelection",
		"ZkCd",
		"ZkNotes",
		"ZkBuffers",
		"ZkBacklinks",
		"ZkLinks",
		"ZkInsertLink",
		"ZkMatch",
		"ZkTags",
		"ZkOrphans",
		"ZkRecents",
		"ZkDaily",
	},
	opts = {
		picker = "snacks_picker",
	},
	keys = {
		{
			"<leader>zn",
			function()
				vim.ui.input({ prompt = "Directory" }, function(dir)
					vim.ui.input({ prompt = "Title" }, function(title)
						vim.cmd.cd(os.getenv("HOME") .. "/notes")
						require("zk.commands").get("ZkNew")({ dir = dir, title = title })
					end)
				end)
			end,
			mode = "n",
			noremap = true,
			silent = false,
			desc = "Create a new note after asking for its group and title",
		},
		{
			"<leader>zd",
			"<Cmd>cd ~/notes<CR><Cmd>ZkNew { dir = 'daily' }<CR>",
			mode = "n",
			noremap = true,
			silent = false,
			desc = "Create a new daily note (or edit the current day's note if it exists)",
		},
		{
			"<leader>zr",
			"<Cmd>e ~/notes/to-dos.md<CR>",
			mode = "n",
			desc = "Open to-do list",
		},
		{
			"<leader>zp",
			function()
				vim.ui.input({ prompt = "Title" }, function(title)
					vim.cmd.cd(os.getenv("HOME") .. "/notes")
					require("zk.commands").get("ZkNew")({ dir = "personal", title = title })
				end)
			end,
			mode = "n",
			noremap = true,
			silent = false,
			desc = "Create a new personal note after asking for its title",
		},
		{
			"<leader>zo",
			"<Cmd>cd ~/notes<CR><Cmd>ZkNotes { sort = { 'modified' } }<CR>",
			mode = "n",
			noremap = true,
			silent = false,
			desc = "Open notes",
		},
		{
			"<leader>zt",
			"<Cmd>cd ~/notes<CR><Cmd>ZkTags<CR>",
			mode = "n",
			noremap = true,
			silent = false,
			desc = "Open notes associated with the selected tags",
		},
		{
			"<leader>zf",
			function()
				vim.ui.input({ prompt = "Search String" }, function(match)
					vim.cmd.cd(os.getenv("HOME") .. "/notes")
					require("zk.commands").get("ZkNotes")({ sort = { "modified" }, match = { match } })
				end)
			end,
			mode = "n",
			noremap = true,
			silent = false,
			desc = "Search for the notes matching a given query",
		},
		{
			"<leader>zf",
			"<Cmd>cd ~/notes<CR><Cmd>'<,'>ZkMatch<CR>",
			mode = "v",
			noremap = true,
			silent = false,
			desc = "Search for the notes matching the current visual selection",
		},
	},
	init = function()
		vim.env.ZK_NOTEBOOK_DIR = os.getenv("HOME") .. "/notes"
	end,
	config = function(_, opts)
		local zk = require("zk")
		zk.setup(opts)

		local commands = require("zk.commands")

		local function make_edit_fn(defaults, picker_options)
			return function(options)
				options = vim.tbl_extend("force", defaults, options or {})
				zk.edit(options, picker_options)
			end
		end

		commands.add("ZkOrphans", make_edit_fn({ orphan = true }, { title = "Zk Orphans" }))
		commands.add("ZkRecents", make_edit_fn({ createdAfter = "2 weeks ago" }, { title = "Zk Recents" }))

		local usercmd = vim.api.nvim_create_user_command
		usercmd("ZkDaily", function()
			vim.cmd([[cd ~/notes]])
			vim.cmd([[ZkNew { dir = 'daily' }]])
		end, {})
	end,
}
