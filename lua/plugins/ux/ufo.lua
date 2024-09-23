return {
	"kevinhwang91/nvim-ufo",
	dependendies = { "kevinhwang91/promise-async" },
	event = { "UIEnter" },
	config = function()
		vim.o.foldcolumn = "1" -- '0' is not bad
		vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
		vim.o.foldlevelstart = 99
		vim.o.foldenable = true

		require("ufo").setup({
			provider_selector = function(_, ft, _)
				-- INFO some filetypes only allow indent, some only LSP, some only
				-- treesitter. However, ufo only accepts two kinds as priority,
				-- therefore making this function necessary :/
				local lspWithOutFolding = { "markdown", "zsh", "css", "html", "python", "json" }
				if vim.tbl_contains(lspWithOutFolding, ft) then
					return { "treesitter", "indent" }
				end
				return { "lsp", "indent" }
			end,
			-- close_fold_kinds_for_ft = {
			-- 	default = { "imports", "comment" },
			-- },
			open_fold_hl_timeout = 800,
			-- show folds with number of folded lines instead of just the icon
			fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
				local hlgroup = "Comment"
				local newVirtText = {}
				local suffix = "    " .. tostring(endLnum - lnum) .. " lines folded"
				local sufWidth = vim.fn.strdisplaywidth(suffix)
				local targetWidth = width - sufWidth
				local curWidth = 0
				for _, chunk in ipairs(virtText) do
					local chunkText = chunk[1]
					local chunkWidth = vim.fn.strdisplaywidth(chunkText)
					if targetWidth > curWidth + chunkWidth then
						table.insert(newVirtText, chunk)
					else
						chunkText = truncate(chunkText, targetWidth - curWidth)
						local hlGroup = chunk[2]
						table.insert(newVirtText, { chunkText, hlGroup })
						chunkWidth = vim.fn.strdisplaywidth(chunkText)
						if curWidth + chunkWidth < targetWidth then
							suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
						end
						break
					end
					curWidth = curWidth + chunkWidth
				end
				table.insert(newVirtText, { suffix, hlgroup })
				return newVirtText
			end,
		})
		local map = vim.keymap.set
		map("n", "zm", function()
			require("ufo").closeAllFolds()
		end, { desc = "󱃄 Close All Folds" })
		map("n", "zr", function()
			require("ufo").openFoldsExceptKinds({ "comment", "imports" })
		end, { desc = "󱃄 Open All Regular Folds" })
		map("n", "zR", function()
			require("ufo").openFoldsExceptKinds({})
		end, { desc = "󱃄 Open All Folds" })
		map("n", "z1", function()
			require("ufo").closeFoldsWith(1)
		end, { desc = "󱃄 Close L1 Folds" })
		map("n", "z2", function()
			require("ufo").closeFoldsWith(2)
		end, { desc = "󱃄 Close L2 Folds" })
		map("n", "z3", function()
			require("ufo").closeFoldsWith(3)
		end, { desc = "󱃄 Close L3 Folds" })
		map("n", "z4", function()
			require("ufo").closeFoldsWith(4)
		end, { desc = "󱃄 Close L4 Folds" })

		-- Tell the server the capability of foldingRange,
		-- Neovim hasn't added foldingRange to default capabilities, users must add it manually
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities.textDocument.foldingRange = {
			dynamicRegistration = false,
			lineFoldingOnly = true,
		}

		-- Disable for certain buffer types
		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "neo-tree", "dashboard", "NeogitStatus" },
			callback = function()
				require("ufo").detach()
				vim.opt_local.foldenable = false
			end,
		})
	end,
}
