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

vim.opt.clipboard = "unnamedplus"
vim.opt.number = true          -- Show line numbers
vim.opt.relativenumber = true  -- Relative line numbers
vim.opt.expandtab = true       -- Use spaces instead of tabs
vim.opt.shiftwidth = 4         -- Number of spaces for indentation
vim.opt.tabstop = 4            -- Number of spaces a tab counts for
vim.opt.smartindent = true      -- Smart indentation
vim.opt.spell = true           -- Spellcheck
vim.opt.spelllang = "en_us"    -- Spellcheck language

-- coc.nvim
vim.g.coc_global_extensions = { 'coc-tsserver', 'coc-json', 'coc-pyright', 'coc-rust-analyzer', 'coc-go', 'coc-clangd' }
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.updatetime = 300
vim.opt.signcolumn = 'yes'
vim.opt.laststatus = 2
vim.opt.statusline:prepend('%{coc#status()}') -- Show coc.nvim status, including extension installation progress

-- Wordcount
vim.opt.laststatus = 2
vim.opt.statusline = "%f%=%{(&filetype ==# 'markdown' || &filetype ==# 'telekasten') ? (has_key(wordcount(), 'visual_words') ? wordcount().visual_words : wordcount().words) . ' words' : ''}"

-- Color Column
vim.opt.colorcolumn = "80"
local group = vim.api.nvim_create_augroup("ColorColumnByFiletype", {
  clear = true,
})

vim.api.nvim_create_autocmd({ "FileType", "BufEnter" }, {
  group = group,
  callback = function(ev)
    local ft = vim.bo[ev.buf].filetype
    vim.wo.colorcolumn =
      (ft == "markdown" or ft == "telekasten") and "120" or "80"
  end,
})

-------------------------------------------------------------------------------
--                             Language Server                               --
-------------------------------------------------------------------------------

-- General LSP setup
vim.lsp.config['*'] = {
    capabilities = { textDocument = { semanticTokens = { multilineTokenSupport = true } } },
    root_markers = { '.git' },
}
vim.diagnostic.config({ virtual_lines = true })


-- Harper specific setup
vim.lsp.config['harper'] = {
    ggmd = { 'harper-ls', '--stdio' },
    filetypes = { 'markdown', 'telekasten', 'text', 'tex', 'typst' }
}
vim.lsp.enable('harper')

-------------------------------------------------------------------------------
--                                Keymaps                                    --
-------------------------------------------------------------------------------

--coc.nvim
local keyset = vim.keymap.set
function _G.check_back_space()
  local col = vim.fn.col('.') - 1
  return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end
 
-- Trigger completion with Tab and navigate the completion menu
local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }
keyset('i', '<TAB>', 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
keyset('i', '<S-TAB>', [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)
keyset('i', '<CR>', [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], { silent = true, expr = true })
 
-- Diagnostics and code navigation
keyset('n', '[c', '<Plug>(coc-diagnostic-prev)', { silent = true })
keyset('n', ']c', '<Plug>(coc-diagnostic-next)', { silent = true })
keyset('n', 'gd', '<Plug>(coc-definition)', { silent = true })
keyset('n', 'gy', '<Plug>(coc-type-definition)', { silent = true })
keyset('n', 'gi', '<Plug>(coc-implementation)', { silent = true })
keyset('n', 'gr', '<Plug>(coc-references)', { silent = true })
keyset('n', '<leader>rn', '<Plug>(coc-rename)', { silent = true })

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

