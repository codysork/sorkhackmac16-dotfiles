return {
  {
    "sakhnik/nvim-gdb",
    lazy = false,

    init = function()
      vim.cmd([[
        function! NvimGdbNoTKeymaps()
          tnoremap <silent> <buffer> <Esc> <C-\><C-n>
        endfunction
      ]])

      vim.g.nvimgdb_config_override = {
        key_next = "n",
        key_step = "s",
        key_finish = "f",
        key_continue = "c",
        key_until = "u",
        key_breakpoint = "b",
        set_tkeymaps = "NvimGdbNoTKeymaps",
      }
    end,
  },
}

