

require('luasnip').config.set_config({ history = true, updateevents = 'TextChanged,TextChangedI' })
require('luasnip.loaders.from_vscode').load()
require("luasnip").config.set_config({ 

  -- Enable autotriggered snippets
  enable_autosnippets = true,

  -- Use Tab (or some other key if you prefer) to trigger visual selection
  store_selection_keys = "<Tab>",
})

