return {
  settings = {
    typescript = {
      inlayHints = {
        parameterNames = { enabled = "all" },
        parameterTypes = { enabled = true },
        variableTypes = { enabled = true },
        propertyDeclarationTypes = { enabled = true },
        functionLikeReturnTypes = { enabled = true },
        enumMemberValues = { enabled = true },
      },
    },
    javascript = {
      suggest = {
        names = true,
      },
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
