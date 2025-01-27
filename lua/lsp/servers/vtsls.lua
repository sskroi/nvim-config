return {
  settings = {
    vtsls = {
      autoUseWorkspaceTsdk = true,
    },
    typescript = {
      inlayHints = {
        parameterNames = { enabled = "all" },
        parameterTypes = { enabled = false },
        variableTypes = { enabled = false },
        propertyDeclarationTypes = { enabled = true },
        functionLikeReturnTypes = { enabled = false },
        enumMemberValues = { enabled = true },
      },
      preferences = {
        -- importModuleSpecifierEnding = "minimal"
      },
    },
    javascript = {
      inlayHints = {
        parameterNames = { enabled = "all" },
        parametertypes = { enabled = true },
        variabletypes = { enabled = true },
        propertydeclarationtypes = { enabled = true },
        functionlikereturntypes = { enabled = true },
        enummembervalues = { enabled = true },
      },
    },
  },
}
