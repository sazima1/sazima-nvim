--[[
Name: Snacks Dashboard
Language: N/A
Description: Pretty dashboard when you start Neovim
Notes:
  - This is only the dashboard component of the Snacks plugin
--]]
local DASHBOARD_WIDTH = 80
local FILLER_STRING = "·"
local VIM_VERSION = string.format("%d.%d.%d", vim.version().major, vim.version().minor, vim.version().patch)
return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	keys = {
		{
			"<leader><leader>d",
			function() Snacks.dashboard.open() end,
			mode = { "n" },
			desc = "Open dashboard",
		},
	},
	opts = {
		dashboard = {
			enabled = true,
			width = DASHBOARD_WIDTH,
			preset = {
				keys = {
					{
						icon = " ",
						key = "f",
						desc = "Find File " .. (FILLER_STRING):rep(DASHBOARD_WIDTH - 19),
						action = function() Snacks.dashboard.pick("smart") end,
					},
					{
						icon = " ",
						key = "g",
						desc = "Find Text " .. (FILLER_STRING):rep(DASHBOARD_WIDTH - 19),
						action = function() Snacks.dashboard.pick("live_grep") end,
					},
					{
						icon = " ",
						key = "n",
						desc = "New File " .. (FILLER_STRING):rep(DASHBOARD_WIDTH - 18),
						action = function() vim.cmd.enew() end,
					},
					{
						icon = " ",
						key = "c",
						desc = "Config " .. (FILLER_STRING):rep(DASHBOARD_WIDTH - 16),
						action = function()
							vim.cmd([[execute 'cd ' stdpath('config')]])
							Snacks.dashboard.pick("smart", { cwd = vim.fn.stdpath("config") })
						end,
					},
					{
						icon = "󰒲 ",
						key = "L",
						desc = "Lazy " .. (FILLER_STRING):rep(DASHBOARD_WIDTH - 14),
						action = ":Lazy",
						enabled = package.loaded.lazy ~= nil,
					},
					{
						icon = " ",
						key = "q",
						desc = "Quit " .. (FILLER_STRING):rep(DASHBOARD_WIDTH - 14),
						action = ":qa",
					},
				},
			},
			formats = {
				-- copy-pasted and altered from snacks dashboard code
				key = function(item) return { { "[ ", hl = "special" }, { item.key, hl = "key" }, { " ]", hl = "special" } } end,

				-- copy-pasted and altered from snacks dashboard code
				icon = function(item)
					if item.file and item.icon == "file" then
						local try = {
							function() return require("nvim-web-devicons").get_icon(item.file) end,
						}
						for _, fn in ipairs(try) do
							local ok, icon, hl = pcall(fn)
							if ok and icon then
								return { icon, hl = hl, width = 2 }
							else
								return { " ", hl = "icon", width = 2 }
							end
						end
					elseif item.icon == "directory" then
						return { " ", hl = "icon", width = 2 }
					end
					return { item.icon, width = 2, hl = "icon" }
				end,
				-- copy-pasted and altered from snacks dashboard code
				file = function(item, ctx)
					local fname = vim.fn.fnamemodify(item.file, ":.")
					fname = ctx.width and #fname > ctx.width and vim.fn.pathshorten(fname) or fname
					if vim.fn.fnamemodify(fname, ":h") == "." then
						fname = "./" .. fname
					end
					if #fname > ctx.width - 3 then
						local dir = vim.fn.fnamemodify(fname, ":h")
						local file = vim.fn.fnamemodify(fname, ":t")
						if dir and file then
							file = file:sub(-(ctx.width - #dir - 2))
							fname = dir .. "/ " .. file
						end
					end
					local dir, file = fname:match("^(.*)/(.+)$")
					local num_spaces = DASHBOARD_WIDTH - 5 - 4 - 2 - vim.api.nvim_strwidth(fname) -- 5 is the extra space added by icons and selection numbers, 4 is the extra space added by "[ " and " ]", 2 is the extra space before and after dot leaders
					local filler_string_full
					if num_spaces == 0 or num_spaces == -2 then
						filler_string_full = ""
					elseif num_spaces == -1 then
						filler_string_full = " "
					else
						filler_string_full = FILLER_STRING:rep(num_spaces)
						filler_string_full = " " .. filler_string_full .. " "
					end
					return dir and { { dir .. "/", hl = "dir" }, { filler_string_full, hl = "dir" }, { file, hl = "file" } } or { { fname, hl = "file" } }
				end,
			},
			sections = {
				{
					section = "header",
					padding = 3,
					align = "center",
				},
				{
					text = {
						{ "Perfect", hl = "Title" },
						{ " is the " },
						{ "mortal enemy", hl = "Title" },
						{ " of " },
						{ "Good Enough", hl = "Title" },
					},
					align = "center",
					padding = 3,
				},
				{
					text = {
						{ "Recent Files in: ", hl = "Title" },
						{ vim.fn.fnamemodify(vim.fn.getcwd(), ":h"), hl = "dir" },
						{ "/", hl = "dir" },
						{ vim.fn.fnamemodify(vim.fn.getcwd(), ":t"), hl = "file" },
					},
					padding = 1,
					align = "center",
				},
				{
					section = "recent_files",
					cwd = true,
					padding = 1,
				},
				{
					title = "All Recent Files",
					padding = 1,
					align = "center",
				},
				{
					section = "recent_files",
					padding = 1,
				},
				{
					title = "Recent Projects",
					padding = 1,
					align = "center",
				},
				{
					section = "projects",
					padding = 1,
				},
				{
					title = "Actions",
					padding = 1,
					align = "center",
				},
				{
					section = "keys",
					padding = 3,
					align = "center",
				},
				{
					section = "startup",
					padding = 1,
					align = "center",
				},
				{
					text = { "Version: " .. VIM_VERSION, hl = "dir" },
					align = "center",
				},
			},
		},
	},
}
