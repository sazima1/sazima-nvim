return {
	"Mofiqul/dracula.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		-------------------
		-- Helper Functions
		-------------------
		local M = {}

		M.bg = "#000000"
		M.fg = "#ffffff"
		M.day_brightness = 0.3

		---@param c string
		local function hexToRgb(c)
			c = string.lower(c)
			return { tonumber(c:sub(2, 3), 16), tonumber(c:sub(4, 5), 16), tonumber(c:sub(6, 7), 16) }
		end

		---@param foreground string foreground color
		---@param background string background color
		---@param alpha number|string number between 0 and 1. 0 results in bg, 1 results in fg
		local function blend(foreground, background, alpha)
			alpha = type(alpha) == "string" and (tonumber(alpha, 16) / 0xff) or alpha
			local bg = hexToRgb(background)
			local fg = hexToRgb(foreground)

			local blendChannel = function(i)
				local ret = (alpha * fg[i] + ((1 - alpha) * bg[i]))
				return math.floor(math.min(math.max(0, ret), 255) + 0.5)
			end

			return string.format("#%02x%02x%02x", blendChannel(1), blendChannel(2), blendChannel(3))
		end

		local function darken(hex, amount, bg)
			return blend(hex, bg or M.bg, amount)
		end

		-- local function lighten(hex, amount, fg)
		-- 	return blend(hex, fg or M.fg, amount)
		-- end
		-------------------

		local dracula = require("dracula")
		dracula.setup({
			theme = "dracula-soft",
			overrides = function(colors)
				return {
					CursorLine = { bg = colors.visual }, -- Same as the color for visual mode selection
					NonText = { fg = darken(colors.comment, 1) },
					DiffAdd = { bg = darken(colors.bright_green, 0.15) },
					DiffDelete = { fg = colors.bright_red },
					DiffChange = { bg = darken(colors.comment, 0.15) },
					DiffText = { bg = darken(colors.comment, 0.50) },
					illuminatedWord = { bg = darken(colors.comment, 0.65) },
					illuminatedCurWord = { bg = darken(colors.comment, 0.65) },
					IlluminatedWordText = { bg = darken(colors.comment, 0.65) },
					IlluminatedWordRead = { bg = darken(colors.comment, 0.65) },
					IlluminatedWordWrite = { bg = darken(colors.comment, 0.65) },
				}
			end,
		})
	end,
}
