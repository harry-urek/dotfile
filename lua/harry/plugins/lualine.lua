return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status") -- to configure lazy pending updates count

		local colors = {
			blue = "#65D1FF",
			green = "#3EFFDC",
			violet = "#FF61EF",
			yellow = "#FFDA7B",
			red = "#FF4A4A",
			fg = "#c3ccdc",
			bg = "#112638",
			inactive_bg = "#2c3043",
		}

		local colors1 = {
			lightred = "#D16969",
			blue = "#569CD6",
			pink = "#C586C0",
			black = "#262626",
			white = "#D4D4D4",
			green = "#608B4E",
			darkgray = "#16161d",
			gray = "#727169",
			innerbg = nil,
			outerbg = "#16161D",
			normal = "#7e9cd8",
			insert = "#98bb6c",
			visual = "#ffa066",
			replace = "#e46876",
			command = "#e6c384",
		}
		local my_lualine_theme = {
			normal = {
				a = { bg = colors1.blue, fg = colors1.bg, gui = "bold" },
				b = { bg = colors1.bg, fg = colors1.fg },
				c = { bg = colors1.bg, fg = colors1.fg },
			},
			insert = {
				a = { bg = colors1.green, fg = colors1.bg, gui = "bold" },
				b = { bg = colors1.bg, fg = colors1.fg },
				c = { bg = colors1.bg, fg = colors1.fg },
			},
			visual = {
				a = { bg = colors1.violet, fg = colors1.bg, gui = "bold" },
				b = { bg = colors1.bg, fg = colors1.fg },
				c = { bg = colors1.bg, fg = colors1.fg },
			},
			command = {
				a = { bg = colors1.yellow, fg = colors1.bg, gui = "bold" },
				b = { bg = colors1.bg, fg = colors1.fg },
				c = { bg = colors1.bg, fg = colors1.fg },
			},
			replace = {
				a = { bg = colors1.red, fg = colors1.bg, gui = "bold" },
				b = { bg = colors1.bg, fg = colors1.fg },
				c = { bg = colors1.bg, fg = colors1.fg },
			},
			inactive = {
				a = { bg = colors1.inactive_bg, fg = colors1.semilightgray, gui = "bold" },
				b = { bg = colors1.inactive_bg, fg = colors1.semilightgray },
				c = { bg = colors1.inactive_bg, fg = colors1.semilightgray },
			},
		}
		local blendtheme = {
			inactive = {
				a = { fg = colors.gray, bg = colors.outerbg, gui = "bold" },
				b = { fg = colors.gray, bg = colors.outerbg },
				c = { fg = colors.gray, bg = colors.innerbg },
			},
			visual = {
				a = { fg = colors.darkgray, bg = colors.visual, gui = "bold" },
				b = { fg = colors.gray, bg = colors.outerbg },
				c = { fg = colors.gray, bg = colors.innerbg },
			},
			replace = {
				a = { fg = colors.darkgray, bg = colors.replace, gui = "bold" },
				b = { fg = colors.gray, bg = colors.outerbg },
				c = { fg = colors.gray, bg = colors.innerbg },
			},
			normal = {
				a = { fg = colors.darkgray, bg = colors.normal, gui = "bold" },
				b = { fg = colors.gray, bg = colors.outerbg },
				c = { fg = colors.gray, bg = colors.innerbg },
			},
			insert = {
				a = { fg = colors.darkgray, bg = colors.insert, gui = "bold" },
				b = { fg = colors.gray, bg = colors.outerbg },
				c = { fg = colors.gray, bg = colors.innerbg },
			},
			command = {
				a = { fg = colors.darkgray, bg = colors.command, gui = "bold" },
				b = { fg = colors.gray, bg = colors.outerbg },
				c = { fg = colors.gray, bg = colors.innerbg },
			},
		}
		local code_dark = {
			normal = {
				b = { fg = colors.green, bg = colors.black },
				a = { fg = colors.black, bg = colors.green, gui = "bold" },
				c = { fg = colors.white, bg = colors.black },
			},
			visual = {
				b = { fg = colors.pink, bg = colors.black },
				a = { fg = colors.black, bg = colors.pink, gui = "bold" },
			},
			inactive = {
				b = { fg = colors.black, bg = colors.blue },
				a = { fg = colors.white, bg = colors.gray, gui = "bold" },
			},
			replace = {
				b = { fg = colors.lightred, bg = colors.black },
				a = { fg = colors.black, bg = colors.lightred, gui = "bold" },
				c = { fg = colors.white, bg = colors.black },
			},
			insert = {
				b = { fg = colors.blue, bg = colors.black },
				a = { fg = colors.black, bg = colors.blue, gui = "bold" },
				c = { fg = colors.white, bg = colors.black },
			},
		}

		-- configure lualine with modified theme
		lualine.setup({
			options = {
				theme = blendtheme,
			},
			sections = {
				lualine_d = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = "#ff9e64" },
					},
					-- { "encoding" },
					-- { "fileformat" },
					-- { "filetype" },
				},
				lualine_b = { { "b:gitsigns_head", icon = "" } },
			},
		})
	end,
}
