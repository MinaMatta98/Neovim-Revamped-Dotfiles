local M = function(lspconfig, on_attach, capabilities, omnisharp_extended, flags)
	lspconfig.omnisharp.setup({
		flags = flags,
		capabilities = capabilities,
		on_attach = on_attach,
		handlers = {
			["textDocument/definition"] = omnisharp_extended.definition_handler,
			["textDocument/typeDefinition"] = omnisharp_extended.type_definition_handler,
			["textDocument/references"] = omnisharp_extended.references_handler,
			["textDocument/implementation"] = omnisharp_extended.implementation_handler,
		},
		enable_editorconfig_support = true,
		roslyn_extensions_options = {
			document_analysis_timeout_ms = 30000,
			enable_decompilation_support = true,
			enable_import_completion = true,
			enable_analyzers_support = true,
			diagnostic_workers_thread_count = 32,
			location_paths = {
				"//path_to/code_actions.dll",
			},
		},
		enable_ms_build_load_projects_on_demand = true,
		organize_imports_on_format = true,
		enable_import_completion = true,
		sdk_include_prereleases = true,
		analyze_open_documents_only = false,
	})
end
return M
