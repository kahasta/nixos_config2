-- bootstrap lazy.nvim, LazyVim and your plugins
if vim.g.neovide then
  vim.o.guifont = "JetBrains Mono:h13:b"
end
-- require("config.lazy")
vim.opt.runtimepath:append("~/.config/nvim_lazy")

require("config.lazy")
