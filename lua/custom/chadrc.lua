---@type ChadrcConfig
local M = {}

M.ui = {
  theme = 'monochrome',
  theme_toggle = { "monochrome", "rosepine" },
  transparency = false,
  hl_override = {
    -- Custom overrides for rosepine; uncomment below to enable
    -- Visual = { bg = "sun", fg = "#26233a"},
    -- Comment = { fg = '#b4637a'},
    -- CursorLineNr = { fg = "pink" },
    ["@comment"] = { link = "Comment" },  -- Link treesitter comment to regular comment

    -- Unused overrides for reference or future use - DO NOT UNCOMMENT UNLESS ADDING NEW STYLE
    -- File explorer (assuming you're using NvimTree)
    -- NvimTreeNormal = { bg = "surface", fg = "text" },
    -- NvimTreeFolderName = { fg = "foam" },
    -- NvimTreeFolderIcon = { fg = "pine" },
    -- NvimTreeOpenedFolderName = { fg = "iris" },
    -- NvimTreeEmptyFolderName = { fg = "subtle" },
    -- NvimTreeIndentMarker = { fg = "muted" },
    -- NvimTreeSymlink = { fg = "rose" },
    -- NvimTreeRootFolder = { fg = "love", bold = true },
    --
    -- Status line
    -- StatusLine = { bg = "surface", fg = "subtle" },
    -- StatusLineNC = { bg = "surface", fg = "muted" },

    -- Tabs
    -- TabLine = { bg = "surface", fg = "muted" },
    -- TabLineFill = { bg = "surface" },
    -- TabLineSel = { bg = "rose", fg = "base" },

    -- Popup menu
    -- Pmenu = { bg = "overlay", fg = "text" },
    -- PmenuSel = { bg = "rose", fg = "base" },
    -- PmenuSbar = { bg = "surface" },
    -- PmenuThumb = { bg = "highlight_med" },

    -- Line numbers
    -- LineNr = { fg = "muted" },

    -- Cursor line
    -- CursorLine = { bg = "highlight_low" },

    -- Search
    -- Search = { bg = "gold", fg = "base" },
    -- IncSearch = { bg = "love", fg = "base" },
  }
}
M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"


return M

-- M.base_30 = {
--   black = "#191724", --  nvim bg
--   darker_black = "#13111e",
--   white = "#e0def4",
--   black2 = "#1f1d2a",
--   one_bg = "#262431", -- real bg of onedark
--   one_bg2 = "#2d2b38",
--   one_bg3 = "#353340",
--   grey = "#3f3d4a",
--   grey_fg = "#474552",
--   grey_fg2 = "#514f5c",
--   light_grey = "#5d5b68",
--   red = "#eb6f92",
--   baby_pink = "#f5799c",
--   pink = "#ff83a6",
--   line = "#2e2c39", -- for lines like vertsplit
--   green = "#ABE9B3",
--   vibrant_green = "#b5f3bd",
--   nord_blue = "#86b9c2",
--   blue = "#8bbec7",
--   yellow = "#f6c177",
--   sun = "#fec97f",
--   purple = "#c4a7e7",
--   dark_purple = "#bb9ede",
--   teal = "#6aadc8",
--   orange = "#f6c177",
--   cyan = "#a3d6df",
--   statusline_bg = "#201e2b",
--   lightbg = "#2d2b38",
--   pmenu_bg = "#c4a7e7",
--   folder_bg = "#6aadc8",
-- }
--
-- M.base_16 = {
--   base00 = "#191724",
--   base01 = "#1f1d2e",
--   base02 = "#26233a",
--   base03 = "#6e6a86",
--   base04 = "#908caa",
--   base05 = "#e0def4",
--   base06 = "#e0def4",
--   base07 = "#524f67",
--   base08 = "#eb6f92",
--   base09 = "#f6c177",
--   base0A = "#ebbcba",
--   base0B = "#31748f",
--   base0C = "#9ccfd8",
--   base0D = "#c4a7e7",
--   base0E = "#f6c177",
--   base0F = "#524f67",
-- }
