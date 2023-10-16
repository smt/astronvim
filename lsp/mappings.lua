return {
  i = {
    ["<C-h>"] = { function() vim.lsp.buf.signature_help() end, desc = "Signature help" },
  },
  n = {
    ["<leader>la"] = { function() vim.lsp.buf.code_action() end, desc = "Code actions" },
    ["<leader>ld"] = { function() vim.diagnostic.open_float() end, desc = "Line diagnostics" },
    ["<leader>lh"] = { function() vim.lsp.buf.signature_help() end, desc = "Signature help" },
    ["<leader>lR"] = { function() vim.lsp.buf.references() end, desc = "References" },
    ["<leader>lr"] = { function() vim.lsp.buf.rename() end, desc = "Rename" },
    ["[d"] = { function() vim.diagnostic.goto_prev() end, desc = "Previous diagnostic" },
    ["]d"] = { function() vim.diagnostic.goto_next() end, desc = "Next diagnostic" },
    ["K"] = { function() vim.lsp.buf.hover() end, desc = "Hover definition" },
    ["gd"] = { function() vim.lsp.buf.definition() end, desc = "Go to definition" },
    ["gI"] = { function() vim.lsp.buf.implementation() end, desc = "Go to implementation" },
    ["gl"] = { function() vim.diagnostic.open_float() end, desc = "Line diagnostics" },
    ["gr"] = { function() vim.lsp.buf.references() end, desc = "References" },
    ["gy"] = { function() vim.lsp.buf.type_definition() end, desc = "Go to type definition" },
  },
}
