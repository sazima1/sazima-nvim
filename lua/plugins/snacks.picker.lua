--[[
Name: Snacks Picker
Language: N/A
Description: Pickers for everything under the sun
Notes:
  - A telescope replacement. Faster and easier to configure.
--]]
return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		picker = {
			enabled = true,
			sources = {
				explorer = {
					hidden = true,
					ignored = true,
					win = {
						list = {
							keys = {
								["o"] = "explorer_add",
							},
						},
					},
				},
				smart = {
					hidden = true,
					ignored = true,
				},
				grep = {
					hidden = true,
					ignored = true,
				},
				grep_word = {
					hidden = true,
					ignored = true,
				},
				grep_buffers = {
					hidden = true,
					ignored = true,
				},
				jumps = {
					hidden = true,
					ignored = true,
				},
			},
			exclude = {
				".mypy_cache",
				"__pycache__",
				"node_modules",
			},
		},
	},
	keys = {
		-- Files
		{ "<leader>ff", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
		{ "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
		{ "<leader>fe", function() Snacks.explorer() end, desc = "File Explorer" },
		-- Search
		{ "<leader>sa", function() Snacks.picker.autocmds() end, desc = "Autocmds" },
		{ "<leader>sb", function() Snacks.picker.grep_buffers() end, desc = "Grep Open Buffers" },
		{ "<leader>sc", function() Snacks.picker.command_history() end, desc = "Command History" },
		{ "<leader>sg", function() Snacks.picker.grep() end, desc = "Grep Files" },
		{
			"<leader>sG",
			function()
				Snacks.picker.highlights({
					layout = { preset = "vertical" },
					confirm = function(picker, item)
						picker:close()
						vim.api.nvim_put({ item.hl_group }, "c", true, true)
					end,
				})
			end,
			desc = "Highlight Groups",
		},
		{ "<leader>sh", function() Snacks.picker.help() end, desc = "Help" },
		{ "<leader>si", function() Snacks.picker.icons() end, desc = "Icons" },
		{ "<leader>sj", function() Snacks.picker.jumps() end, desc = "Jumps" },
		{ "<leader>sk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
		{ "<leader>sl", function() Snacks.picker.loclist() end, desc = "Location List" },
		{ "<leader>sL", function() Snacks.picker.lines() end, desc = "Search Current File Lines" },
		{ "<leader>sm", function() Snacks.picker.marks() end, desc = "Marks" },
		{ "<leader>sM", function() Snacks.picker.man() end, desc = "Man Pages" },
		{ "<leader>sn", function() Snacks.picker.notifications() end, desc = "Notification History" },
		{ "<leader>so", function() Snacks.picker.lsp_symbols() end, desc = "LSP Outline" },
		{ "<leader>sp", function() Snacks.picker.lazy() end, desc = "Search for Plugin Spec" },
		{ "<leader>sq", function() Snacks.picker.qflist() end, desc = "Quickfix List" },
		{ "<leader>sR", function() Snacks.picker.resume() end, desc = "Resume" },
		{ "<leader>ss", function() Snacks.picker.lsp_symbols({ filter = { default = true } }) end, desc = "LSP Symbols" },
		{ "<leader>su", function() Snacks.picker.undo() end, desc = "Undo History" },
		{ "<leader>sw", function() Snacks.picker.grep_word() end, desc = "Search the current word or visual selection", mode = { "n", "x" } },
		{ '<leader>s"', function() Snacks.picker.registers() end, desc = "Registers" },
		{ "<leader>s/", function() Snacks.picker.search_history() end, desc = "Search History" },
		{ "<leader>s:", function() Snacks.picker.commands() end, desc = "Commands" },
		-- Other
		{ "<leader>h", function() Snacks.picker.help() end, desc = "Help" },
		{ "<leader>u", function() Snacks.picker.undo() end, desc = "Undo History" },
		{ "<leader>:", function() Snacks.picker.commands() end, desc = "Commands" },
		-- Editor Actions
		{ "<leader><leader>c", function() Snacks.picker.colorschemes() end, desc = "Colorschemes" },
		-- Custom Pickers
		{
			"<leader>sH",
			function()
				local rtp = vim.o.runtimepath
				if package.loaded.lazy then
					rtp = rtp .. "," .. table.concat(require("lazy.core.util").get_unloaded_rtp(""), ",")
				end
				local files = vim.fn.globpath(rtp, "doc/*", true, true) ---@type string[]
				Snacks.picker.grep({
					dirs = files,
					confirm = function(picker, item)
						picker:close()
						vim.cmd("vsp " .. item.file)
						vim.cmd("wincmd L")
						vim.cmd("let w = min([90, &columns / 2]) | execute 'vertical resize ' . w")
						vim.api.nvim_win_set_cursor(0, { item.pos[1], item.pos[2] })
						vim.cmd("normal! zt")
						vim.api.nvim_buf_set_keymap(0, "n", "q", "", {
							callback = function() vim.api.nvim_command("close") end,
						})
					end,
				})
			end,
			desc = "Grep Help",
		},
	},
}
