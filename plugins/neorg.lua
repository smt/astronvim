return {
  {
    "nvim-neorg/neorg",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-neorg/neorg-telescope" },
      { "pysan3/neorg-templates", dependencies = { "L3MON4D3/LuaSnip" } },
    },
    opts = {
      load = {
        ["core.concealer"] = {
          config = {
            icon_preset = "diamond",
          },
        },
        ["core.dirman"] = {
          config = {
            workspaces = {
              work = "~/OneDrive - Infinite Blue/Notes",
              home = "~/nc/Documents/neorg/home",
            },
            default_workspace = "work",
          },
        },
        ["core.integrations.telescope"] = {},
        ["core.journal"] = {
          config = {
            strategy = "flat",
          },
        },
        ["core.summary"] = {},
        ["external.templates"] = {
          config = {
            templates_dir = vim.fn.stdpath "config" .. "/lua/user/templates/norg",
          },
        },
      },
    },
  },
}
