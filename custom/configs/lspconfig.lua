local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

lspconfig.phpactor.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = { "phpactor", "language-server" },
    filetype = {"php"},
    root_dir = lspconfig.util.root_pattern("composer.json", ".git"),
})

lspconfig.tsserver.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = { "typescript-language-server", "--stdio" },
    filetype = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
    init_options = {
        hostInfo = "neovim" 
    },
    root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
    single_file_support = true,
})

lspconfig.pyright.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetype={"python"}
})

lspconfig.arduino_language_server.setup({
    on_attach=on_attach,
    capabilities=capabilities;
    cmd={ "arduino-language-server" },
    filetype={"arduino"}
})

lspconfig.clangd.setup({
    on_attach=on_attach,
    capabilities=capabilities;
    cmd={ "clangd" },
    filetype= { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
    root_dir= lspconfig.util.root_pattern(
          '.clangd',
          '.clang-tidy',
          '.clang-format',
          'compile_commands.json',
          'compile_flags.txt',
          'configure.ac',
          '.git'
        ),
    single_file_support=true
})
