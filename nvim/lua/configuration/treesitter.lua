require('nvim-treesitter.configs').setup {
  ensure_installed = {
    'c',
    'cpp',
    'rust',
    'lua',
    'bash',
    'python',
    'typescript',
    'javascript',
    'commonlisp',
    'dart',
    'elixir',
    'erlang',
    'fish',
    'bibtex',
    'dockerfile',
    'astro',
    'go',
    'jq',
    'julia',
    'json',
    'html',
    'java',
    'latex',
    'make',
    'markdown',
    'meson',
    'kotlin',
    'nix',
    'ninja',
    'org',
    'php',
    'perl',
    'regex',
    'ruby',
    'racket',
    'scala',
    'scheme',
    'svelte',
    'scss',
    'vim',
    'vue',
    'yaml',
    'haskell',
    'zig'
  },
  sync_install = false,
  auto_install = false,
  highlight = {
    enable = true
  },
  indent = {
    enable = true, -- This is experimental, though we'll try it.
    disable = {
            'python',
            'haskell'
        }
  }
}
