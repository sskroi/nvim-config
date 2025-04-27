return {
  "mfussenegger/nvim-jdtls",
  ft = { "java" },
  enabled = true,
  dependencies = { "hrsh7th/nvim-cmp" },
  config = function()
    local jdtls = require("jdtls")

    local capabilities = vim.lsp.protocol.make_client_capabilities()

    local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
    if ok then
      capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
    end

    local extendedClientCapabilities = jdtls.extendedClientCapabilities
    extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

    local home = os.getenv("HOME")
    local root_dir = require("jdtls.setup").find_root({ ".git", "pom.xml" })
    local workspace_dir = home .. "/.cache/jdtls-nvim-data-dirs/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

    local config = {
      capabilities = capabilities,

      -- The command that starts the language server
      -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
      cmd = {
        -- 💀
        "/usr/bin/java", -- or '/path/to/java17_or_newer/bin/java'
        -- depends on if `java` is in your $PATH env variable and if it points to the right version.

        "-Declipse.application=org.eclipse.jdt.ls.core.id1",
        "-Dosgi.bundles.defaultStartLevel=4",
        "-Declipse.product=org.eclipse.jdt.ls.core.product",
        "-Dlog.protocol=true",
        "-Dlog.level=ALL",
        "-Xmx1g",
        "--add-modules=ALL-SYSTEM",
        "--add-opens",
        "java.base/java.util=ALL-UNNAMED",
        "--add-opens",
        "java.base/java.lang=ALL-UNNAMED",

        -- 💀
        "-jar",
        vim.fn.glob(home .. "/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"),
        -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                                       ^^^^^^^^^^^^^^
        -- Must point to the                                                     Change this to
        -- eclipse.jdt.ls installation                                           the actual version

        -- 💀
        "-configuration",
        home .. "/.local/share/nvim/mason/packages/jdtls/config_linux",

        -- 💀
        -- See `data directory configuration` section in the README
        "-data",
        workspace_dir,
      },

      -- 💀
      -- This is the default if not provided, you can remove it. Or adjust as needed.
      -- One dedicated LSP server & client will be started per unique root_dir
      root_dir = root_dir,

      -- Here you can configure eclipse.jdt.ls specific settings
      -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
      -- for a list of options
      settings = {
        java = {},
        extendedClientCapabilities = extendedClientCapabilities,
      },

      -- Language server `initializationOptions`
      -- You need to extend the `bundles` with paths to jar files
      -- if you want to use additional eclipse.jdt.ls plugins.
      --
      -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
      --
      -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
      init_options = {
        bundles = {},
      },
    }

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "java",
      callback = function()
        jdtls.start_or_attach(config)
      end,
    })
  end,
}
