local m = vim.keymap.set

local vscode = require("vscode")

-- Navigating on windows
m("n", "<C-h>", function() vscode.action("workbench.action.focusLeftGroup") end)
m("n", "<C-l>", function() vscode.action("workbench.action.focusRightGroup") end)
m("n", "<C-j>", function() vscode.action("workbench.action.focusBelowGroup") end)
m("n", "<C-k>", function() vscode.action("workbench.action.focusAboveGroup") end) --


m("n", "L", function() vscode.action("workbench.action.nextEditor") end)
m("n", "H", function() vscode.action("workbench.action.previousEditor") end)

m("n", "<A-d>", function() vscode.action("workbench.action.closeActiveEditor") end)

m("n", "gd", function() vscode.action("editor.action.revealDefinition") end)
m("n", "gD", function() vscode.action("editor.action.revealDeclaration") end)
m("n", "gr", function() vscode.action("editor.action.goToReferences") end)
m("n", "gi", function() vscode.action("editor.action.goToImplementation") end)
m("n", "go", function() vscode.action("editor.action.goToTypeDefinition") end)
m("n", "gR", function() vscode.action("editor.action.rename") end)
