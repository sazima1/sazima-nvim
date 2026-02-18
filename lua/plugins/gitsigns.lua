--[[
Name: Git Signs
Language: N/A
Description: In-buffer, hunk-based git functionality and visuals
--]]
return {
	"lewis6991/gitsigns.nvim",
	opts = {
		signs = {
			delete = { show_count = true },
			topdelete = { show_count = true },
			changedelete = { show_count = true },
		},
		signs_staged = {
			delete = { show_count = true },
			topdelete = { show_count = true },
			changedelete = { show_count = true },
		},
		current_line_blame_opts = {
			delay = 0,
		},
		current_line_blame_formatter = "<author>, <author_time:%R>, <author_time:%x>, <abbrev_sha> - <summary>",
		on_attach = function(bufnr)
			local gitsigns = require("gitsigns")
			local function map(mode, l, r, opts)
				opts = opts or {}
				opts.buffer = bufnr
				vim.keymap.set(mode, l, r, opts)
			end

			-- Hunk navigation
			map("n", "]c", function()
				if vim.wo.diff then
					vim.cmd.normal({ "]c", bang = true })
				else
					gitsigns.nav_hunk("next")
				end
			end)

			map("n", "[c", function()
				if vim.wo.diff then
					vim.cmd.normal({ "[c", bang = true })
				else
					gitsigns.nav_hunk("prev")
				end
			end)

			-- Git keymaps
			map("n", "<leader>gb", function() gitsigns.toggle_current_line_blame() end, { noremap = true, desc = "Toggle inline git blame (Gitsigns)" })
			map("n", "<leader>gB", function() gitsigns.blame() end, { noremap = true, desc = "Open Git blame (Gitsigns)" })
			map("n", "<leader>ge", function() gitsigns.toggle_deleted() end, { noremap = true, desc = "Toggle showing deleted lines (Gitsigns)" })
			map("n", "<leader>gw", function() gitsigns.toggle_word_diff() end, { noremap = true, desc = "Toggle word diff (Gitsigns)" })
			map("n", "<leader>gv", function()
				gitsigns.toggle_linehl()
				gitsigns.toggle_numhl()
				gitsigns.toggle_word_diff()
				gitsigns.toggle_deleted()
			end, { noremap = true, desc = "Hunk diff view (Gitsigns)" })

			-- Hunk keymaps
			map("n", "<leader>ghd", function() gitsigns.diffthis() end, { desc = "Diff hunks" })
			map("n", "<leader>ghD", function() gitsigns.diffthis("~") end, { desc = "Diff hunks ~" })
			map("n", "<leader>ghp", function() gitsigns.preview_hunk_inline() end, { noremap = true, desc = "Preview hunk (Gitsigns)" })
			map("n", "<leader>ghP", function() gitsigns.preview_hunk() end, { noremap = true, desc = "Preview hunk in float (Gitsigns)" })
			map("n", "<leader>ghq", function() gitsigns.setqflist() end, { noremap = true, desc = "Add hunk to quickfix list" })
			map("n", "<leader>ghQ", function() gitsigns.setqflist("all") end, { noremap = true, desc = "Add all hunks to quickfix list" })
			map("n", "<leader>ghr", function() gitsigns.reset_hunk() end, { noremap = true, desc = "Reset hunk" })
			map("v", "<leader>ghr", function() gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, { noremap = true, desc = "Reset hunk" })
			map("n", "<leader>ghR", function() gitsigns.reset_buffer() end, { noremap = true, desc = "Reset all hunks in buffer" })
			map("n", "<leader>ghs", function() gitsigns.stage_hunk() end, { noremap = true, desc = "Stage Hunk" })
			map("v", "<leader>ghs", function() gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, { noremap = true, desc = "Stage hunk" })
			map("n", "<leader>ghS", function() gitsigns.stage_buffer() end, { noremap = true, desc = "Stage all hunks in buffer" })

			-- Text object
			map({ "o", "x" }, "ih", function() gitsigns.select_hunk() end, { noremap = true, desc = "Select hunk" })
		end,
	},
}
