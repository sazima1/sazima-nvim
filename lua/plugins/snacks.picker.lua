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
	keys = {
        -- stylua: ignore start
        -- Files
        { "<leader>ff", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
        { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
        { "<leader>fe", function() Snacks.explorer() end, desc = "File Explorer" },
        -- Search
        { "<leader>sa", function() Snacks.picker.autocmds() end, desc = "Autocmds" },
        { "<leader>sb", function() Snacks.picker.grep_buffers() end, desc = "Grep Open Buffers" },
        { "<leader>sc", function() Snacks.picker.command_history() end, desc = "Command History" },
        { "<leader>sg", function() Snacks.picker.grep() end, desc = "Grep Files" },
        { "<leader>si", function() Snacks.picker.icons() end, desc = "Icons" },
        { "<leader>sj", function() Snacks.picker.jumps() end, desc = "Jumps" },
        { "<leader>sk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
        { "<leader>sl", function() Snacks.picker.lines() end, desc = "Search Current File Lines" },
        { "<leader>sL", function() Snacks.picker.loclist() end, desc = "Location List" },
        { "<leader>sm", function() Snacks.picker.marks() end, desc = "Marks" },
        { "<leader>sM", function() Snacks.picker.man() end, desc = "Man Pages" },
        { "<leader>sn", function() Snacks.picker.notifications() end, desc = "Notification History" },
        { "<leader>sp", function() Snacks.picker.lazy() end, desc = "Search for Plugin Spec" },
        { "<leader>sq", function() Snacks.picker.qflist() end, desc = "Quickfix List" },
        { "<leader>sR", function() Snacks.picker.resume() end, desc = "Resume" },
        { "<leader>sw", function() Snacks.picker.grep_word() end, desc = "Visual selection or word", mode = { "n", "x" } },
        { '<leader>s"', function() Snacks.picker.registers() end, desc = "Registers" },
        { '<leader>s/', function() Snacks.picker.search_history() end, desc = "Search History" },
        -- Other
        { "<leader>h", function() Snacks.picker.help() end, desc = "Help" },
        { "<leader>u", function() Snacks.picker.undo() end, desc = "Undo History" },
        { "<leader>:", function() Snacks.picker.commands() end, desc = "Commands" },
        -- Editor Actions
        { "<leader><leader>c", function() Snacks.picker.colorschemes() end, desc = "Colorschemes" },
		-- stylua: ignore end
	},
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
		},
	},
}
