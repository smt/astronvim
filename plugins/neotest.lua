return {
  {
    "nvim-neotest/neotest",
    enabled = false,
    dependencies = { "haydenmeade/neotest-jest" },
    opts = function(_, opts)
      table.insert(
        opts.adapters,
        require "neotest-jest" {
          jestCommand = "npm test --",
          jestConfigFile = "jest.config.js",
          env = { CI = true },
          cwd = function() return vim.fn.getcwd() end,
        }
      )
    end,
  },
}
