

vim.api.nvim_create_user_command (
  'IvimInstallLsp',
  function ()
    require ('mason-lspconfig').setup {
      ensure_installed = {
        "awk_ls",
        "als",
        "clangd",
        "cssls",
        "elixirls",
        "dockerls",
        "fortls",
        "grammarly",
        "gopls",
        "hls",
        "jsonls",
        "jdtls",
        "tsserver",
        "julials",
        "sumneko_lua",
        "ltex",
        "pyright",
        "r_language_server",
        "ruby_ls",
        "vimls"
      }
    }
  end,
  {bang = true, desc = 'Install all language servers'}
)
