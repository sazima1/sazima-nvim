return {
	"zk-org/zk-nvim",
	config = function()
		-- set notebook directory env var before loading zk
		vim.env.ZK_NOTEBOOK_DIR = "~/.sazima1/notes"

		local zk = require("zk")
		zk.setup({
			picker = "telescope",
		})

		local commands = require("zk.commands")

		local function make_edit_fn(defaults, picker_options)
			return function(options)
				options = vim.tbl_extend("force", defaults, options or {})
				zk.edit(options, picker_options)
			end
		end

		commands.add("ZkOrphans", make_edit_fn({ orphan = true }, { title = "Zk Orphans" }))
		commands.add("ZkRecents", make_edit_fn({ createdAfter = "2 weeks ago" }, { title = "Zk Recents" }))

		-- Keymaps
		local map = vim.keymap.set

		map("n", "<leader>zn", function()
			vim.ui.input({ prompt = "Directory" }, function(dir)
				vim.ui.input({ prompt = "Title" }, function(title)
					vim.cmd.cd(os.getenv("HOME") .. "/.sazima1/notes")
					require("zk.commands").get("ZkNew")({ dir = dir, title = title })
				end)
			end)
		end, {
			noremap = true,
			silent = false,
			desc = "Create a new note after asking for its group and title",
		})
		map("n", "<leader>zd", "<Cmd>cd ~/.sazima1/notes<CR><Cmd>ZkNew { dir = 'daily' }<CR>", {
			noremap = true,
			silent = false,
			desc = "Create a new daily note (or edit the current day's note if it exists)",
		})
		map("n", "<leader>zr", "<Cmd>e ~/notes/to-dos.md<CR>", { desc = "Open to-do list" })
		map("n", "<leader>zp", function()
			vim.ui.input({ prompt = "Title" }, function(title)
				vim.cmd.cd(os.getenv("HOME") .. "/.sazima1/notes")
				require("zk.commands").get("ZkNew")({ dir = "personal", title = title })
			end)
		end, {
			noremap = true,
			silent = false,
			desc = "Create a new personal note after asking for its title",
		})
		map("n", "<leader>zo", "<Cmd>cd ~/.sazima1/notes<CR><Cmd>ZkNotes { sort = { 'modified' } }<CR>", { noremap = true, silent = false, desc = "Open notes" })
		map("n", "<leader>zt", "<Cmd>cd ~/.sazima1/notes<CR><Cmd>ZkTags<CR>", {
			noremap = true,
			silent = false,
			desc = "Open notes associated with the selected tags",
		})
		-- map("n", "<leader>zf", "<Cmd>cd ~/.sazima1/notes<CR><Cmd>ZkNotes { sort = { 'modified' }, match = { vim.fn.input('Search: ') } }<CR>", { noremap = true, silent = false, desc = "Search for the notes matching a given query" })
		map("n", "<leader>zf", function()
			vim.ui.input({ prompt = "Search String" }, function(match)
				vim.cmd.cd(os.getenv("HOME") .. "/.sazima1/notes")
				require("zk.commands").get("ZkNotes")({ sort = { "modified" }, match = { match } })
			end)
		end, { noremap = true, silent = false, desc = "Search for the notes matching a given query" })
		map("v", "<leader>zf", "<Cmd>cd ~/.sazima1/notes<CR><Cmd>'<,'>ZkMatch<CR>", {
			noremap = true,
			silent = false,
			desc = "Search for the notes matching the current visual selection",
		})
	end,
}
