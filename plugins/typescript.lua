-- Re-implements astrocommunity.pack.typescript, but with some changes:
-- 1. Remove the configs for the following plugins, which have been archived:
--    * jose-elias-alvarez/null-ls.nvim
--    * jose-elias-alvarez/typescript.nvim
-- 2. Add pmizio/typescript-tools.nvim, a pure Lua replacement for typescript-language-server
-- 3. Remove eslint from the ensure_installed list in the mason-null-ls.nvim config, as it doesn't seem to work with typescript-tools
-- 4. Add LSP keybinds to lsp/mappings.lua

local utils = require "astronvim.utils"

local function on_file_remove(args)
  local ts_clients = vim.lsp.get_active_clients { name = "typescript-tools" }
  for _, ts_client in ipairs(ts_clients) do
    ts_client.request("workspace/executeCommand", {
      command = "_typescript.applyRenameFile",
      arguments = {
        {
          sourceUri = vim.uri_from_fname(args.source),
          targetUri = vim.uri_from_fname(args.destination),
        },
      },
    })
  end
end

local function check_json_key_exists(filename, key)
  -- Open the file in read mode
  local file = io.open(filename, "r")
  if not file then
    return false -- File doesn't exist or cannot be opened
  end

  -- Read the contents of the file
  local content = file:read "*all"
  file:close()

  -- Parse the JSON content
  local json_parsed, json = pcall(vim.fn.json_decode, content)
  if not json_parsed or type(json) ~= "table" then
    return false -- Invalid JSON format
  end

  -- Check if the key exists in the JSON object
  return json[key] ~= nil
end

return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if opts.ensure_installed ~= "all" then
        opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, { "javascript", "typescript", "tsx" })
      end
    end,
  },
  {
    "jay-babu/mason-null-ls.nvim",

    opts = function(_, opts)
      opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, { "prettierd" })
      if not opts.handlers then opts.handlers = {} end

      local has_prettier = function(util)
        return check_json_key_exists(vim.fn.getcwd() .. "/package.json", "prettier")
          or util.root_has_file ".prettierrc"
          or util.root_has_file ".prettierrc.json"
          or util.root_has_file ".prettierrc.yml"
          or util.root_has_file ".prettierrc.yaml"
          or util.root_has_file ".prettierrc.json5"
          or util.root_has_file ".prettierrc.js"
          or util.root_has_file ".prettierrc.cjs"
          or util.root_has_file "prettier.config.js"
          or util.root_has_file "prettier.config.cjs"
          or util.root_has_file ".prettierrc.toml"
      end

      opts.handlers.prettierd = function()
        local null_ls = require "null-ls"
        null_ls.register(null_ls.builtins.formatting.prettierd.with { condition = has_prettier })
      end
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = function(_, opts) opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, "js") end,
  },
  {
    "vuki656/package-info.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = {},
    event = "BufRead package.json",
  },
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    ft = {
      "typescript",
      "typescriptreact",
      "javascript",
      "javascriptreact",
    },
    opts = {
      settings = {
        expose_as_code_action = {
          "fix_all",
          "add_missing_imports",
          "remove_unused",
          "remove_unused_imports",
          "organize_imports",
        },
        tsserver_file_preferences = {
          quotePreference = "auto",
          importModuleSpecifierPreference = "relative",
          importModuleSpecifierEnding = "auto",
        },
        tsserver_format_preferences = {},
      },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = function(_, opts)
      local events = require "neo-tree.events"
      opts.event_handlers = {
        {
          event = events.FILE_MOVED,
          handler = on_file_remove,
        },
        {
          event = events.FILE_RENAMED,
          handler = on_file_remove,
        },
      }
    end,
  },
  {
    "dmmulroy/tsc.nvim",
    cmd = { "TSC" },
    opts = {},
  },
}
