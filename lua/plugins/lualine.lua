--[[
Name: LuaLine
Language: N/A
Description: Better statusline and winbar
--]]
return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	event = "VeryLazy",
	opts = function()
		-- Helper functions
		--
		-- Python venv
		local function get_venv(variable)
			local venv = os.getenv(variable)
			if venv ~= nil and string.find(venv, "/") then
				local orig_venv = venv
				for w in orig_venv:gmatch("([^/]+)") do
					venv = w
				end
				venv = string.format("%s", venv)
			end
			return venv
		end

		-- LSP clients attached to buffer
		local clients_lsp = function()
			local bufnr = vim.api.nvim_get_current_buf()

			local clients = vim.lsp.get_clients({ buffer = bufnr })
			if next(clients) == nil then
				return ""
			end

			local c = {}
			for _, client in pairs(clients) do
				table.insert(c, client.name)
			end
			return " " .. table.concat(c, ",")
		end
		local opts = {
			options = {
				globalstatus = true,
				component_separators = { left = "", right = "" },
				-- component_separators = { left = "│", right = "│" },
				section_separators = { left = "▌", right = "▐" },
				-- section_separators = { left = "│", right = "│" },
			},
			-- Statusline
			sections = {
				lualine_b = {
					-- { "filename", path = 3 },
					{
						function()
							return vim.fn.getcwd() .. "/"
						end,
						icon = " ",
					},
					{
						"filename",
						path = 1,
					},
				},
				lualine_c = {
					{
						function()
							local venv = get_venv("CONDA_DEFAULT_ENV") or get_venv("VIRTUAL_ENV") or "NO ENV"
							return venv
						end,
						cond = function()
							return vim.bo.filetype == "python"
						end,
						icon = "󰌠",
					},
					"branch",
					{
						function()
							return "  " .. require("dap").status()
						end,
						cond = function()
							return package.loaded["dap"] and require("dap").status() ~= ""
						end,
						color = function()
							return "Error"
						end,
					},
				},
				lualine_x = {
					"selectioncount",
					clients_lsp,
				},
				lualine_y = {
					"progress",
				},
			},
			-- Winbar
			winbar = {
				lualine_a = {
					{
						"filename",
						symbols = {
							modified = "●",
							readonly = "",
						},
					},
				},
				lualine_b = {
					"filetype",
					{
						"%L",
						icon = "",
					},
				},
				lualine_c = {
					{
						"diff",
						icon = " ",
					},
					{
						"diagnostics",
						icon = " ",
					},
				},
				lualine_y = {},
			},
			inactive_winbar = {
				lualine_a = {},
				lualine_b = { "filename" },
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
		}
		return opts
	end,
}
