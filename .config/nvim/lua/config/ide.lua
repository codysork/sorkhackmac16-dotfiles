-- IDE mode: toggle with :IDE

local function enable()
  vim.opt.signcolumn = "yes"
  vim.opt.cursorline = true
  vim.opt.colorcolumn = "80"
  vim.cmd("Neotree show left")
  vim.cmd("wincmd l")
  vim.g.ide_mode = true
end

local function disable()
  vim.opt.signcolumn = "auto"
  vim.opt.cursorline = false
  vim.opt.colorcolumn = ""
  vim.cmd("Neotree close")
  vim.g.ide_mode = false
end

vim.api.nvim_create_user_command("IDE", function()
  if vim.g.ide_mode then
    disable()
  else
    enable()
  end
end, { desc = "Toggle IDE view" })
