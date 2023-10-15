return {
  {
    "tummetott/unimpaired.nvim",
    lazy = false,
    config = function()
      require("unimpaired").setup {
        -- add any options here or leave empty
        keymaps = {
          bnext = false,
          bprevious = false,
          next_file = false,
          previous_file = false,
        },
      }
    end,
  },
}
