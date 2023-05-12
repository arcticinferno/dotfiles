if pcall(require, 'packer') then
  require('packages')
  vim.cmd('PackerInstall')
  require('config')
else
  os.execute('git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim')
end
require('settings')
require('mappings')
