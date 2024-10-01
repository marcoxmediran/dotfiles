local colors_name = "mengubones"
vim.g.colors_name = colors_name -- Required when defining a colorscheme

local lush = require "lush"
local hsluv = lush.hsluv -- Human-friendly hsl
local util = require "zenbones.util"

local bg = vim.o.background

-- Define a palette. Use `palette_extend` to fill unspecified colors
-- Based on https://github.com/gruvbox-community/gruvbox#palette
local palette
if bg == "light" then
	palette = util.palette_extend({
		bg = hsluv "#053230",
		fg = hsluv "#f8efd8",
		rose = hsluv "#f8efd8",
		leaf = hsluv "#f8efd8",
		wood = hsluv "#969c46",
		water = hsluv "#5b7a80",
		blossom = hsluv "#f8efd8",
		sky = hsluv "#f8efd8",
	}, bg)
else
	palette = util.palette_extend({
		bg = hsluv "#053230",
		fg = hsluv "#f8efd8",
		rose = hsluv "#f8efd8",
		leaf = hsluv "#f8efd8",
		wood = hsluv "#969c46",
		water = hsluv "#5b7a80",
		blossom = hsluv "#f8efd8",
		sky = hsluv "#f8efd8",
	}, bg)
end

-- Generate the lush specs using the generator util
local generator = require "zenbones.specs"
local base_specs = generator.generate(palette, bg, generator.get_global_config(colors_name, bg))

-- Optionally extend specs using Lush
local specs = lush.extends({ base_specs }).with(function()
	return {
		Statement { base_specs.Statement, fg = palette.rose },
		Special { fg = palette.fg },
		Type { fg = palette.sky },
		Identifier { fg = palette.fg },
		Delimiter { fg = palette.fg },
		Number { fg = palette.fg },
		Keyword { fg = palette.fg },
		Function { fg = palette.fg },
		Variable { fg = palette.fg },
		Constant { fg = palette.water },
		Visual { bg = palette.wood },
		DiagnosticVirtualTextError { fg = palette.fg, bg = palette.water },
		DiagnosticVirtualTextWarn { fg = palette.water, bg = palette.bg },
		DiagnosticVirtualTextHint { fg = palette.water, bg = palette.bg },
	}
end)

-- Pass the specs to lush to apply
lush(specs)

-- Optionally set term colors
require("zenbones.term").apply_colors(palette)
