-- @file init.lua
-- @author Cody Sork <codysork@gmail.com>
-- @created 2026-10-27
-- @modified 2026-10-29

--------------------------------------------------------------------------
--                             Plugins                                  --
--------------------------------------------------------------------------

require("config.lazy")

--------------------------------------------------------------------------
--                             Appearance                               --
--------------------------------------------------------------------------

vim.o.background = "dark"
vim.cmd([[colorscheme gruvbox]])

--------------------------------------------------------------------------------
--                                Options                                     --
--------------------------------------------------------------------------------

-- vim.g.mapleader = ","
vim.opt.clipboard = "unnamedplus"
vim.opt.number = true          -- Show line numbers
vim.opt.relativenumber = true  -- Relative line numbers
vim.opt.expandtab = true       -- Use spaces instead of tabs
vim.opt.shiftwidth = 4         -- Number of spaces for indentation
vim.opt.tabstop = 4            -- Number of spaces a tab counts for
vim.opt.smartindent = true      -- Smart indentation
vim.opt.spell = true           -- Spellcheck
vim.opt.spelllang = "en_us"    -- Spellcheck language

-------------------------------------------------------------------------------
--                                Keymaps                                    --
-------------------------------------------------------------------------------

-- Neocodeium
vim.keymap.set("i", "<Tab>", function()
    require("neocodeium").accept()
end)
vim.keymap.set("i", "<C-j>", function()
    require("neocodeium").accept_word()
end)
vim.keymap.set("i", "<C-k>", function()
    require("neocodeium").accept_line()
end)
vim.keymap.set("i", "<C-Space>", function()
    require("neocodeium").cycle_or_complete()
end)
vim.keymap.set("i", "<C-S-Space>", function()
    require("neocodeium").cycle_or_complete(-1)
end)
vim.keymap.set("i", "<C-h>", function()
    require("neocodeium").clear()
end)

-- Neotree
vim.api.nvim_set_keymap('n', '<C-t>', ':Neotree<CR>', { noremap = true, silent = true })

-- Telekasten
-- Launch panel if nothing is typed after <leader>z
vim.keymap.set("n", "<leader>z", "<cmd>Telekasten panel<CR>")
vim.keymap.set("n", "<leader>zb", "<cmd>Telekasten show_backlinks<CR>")  -- b for backlinks
vim.keymap.set("n", "<leader>zc", "<cmd>Telekasten show_calendar<CR>")   -- c for calendar
vim.keymap.set("n", "<leader>zd", "<cmd>Telekasten goto_today<CR>")      -- d for day
vim.keymap.set("n", "<leader>ze", "<cmd>Telekasten follow_link<CR>")     -- e for explore
vim.keymap.set("n", "<leader>zf", "<cmd>Telekasten find_notes<CR>")      -- f for find
vim.keymap.set("n", "<leader>zi", "<cmd>Telekasten insert_img_link<CR>") -- I for insert image
vim.keymap.set("n", "<leader>zn", "<cmd>Telekasten new_note<CR>")        -- n for new note
vim.keymap.set("n", "<leader>zs", "<cmd>Telekasten search_notes<CR>")    -- s for search
vim.keymap.set("i", "[[", "<cmd>Telekasten insert_link<CR>")

