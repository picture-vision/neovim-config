local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("lsp.lsp-installer")
require("lsp.handlers").setup()
require "lsp.nullls"
require'lspconfig'.dartls.setup{
  cmd = { "dart", "./snapshots/analysis_server.dart.snapshot", "--lsp" }
}
