VscodeMode = vim.g.vscode

if VscodeMode then
  require("vscode-only.plugin-independent-mappings")
  return
end

require("user_settings")
require("options")

require("lazy-plugin-manager")

require("plugin-independent-mappings")
require("autocmd")

vim.cmd("colorscheme gruvbox-material")
