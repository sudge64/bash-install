return {
	{
		"mason-org/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		config = function()
			-- LSP settings.
			--  This function gets run when an LSP connects to a particular buffer.
			local on_attach = function(_, bufnr)
				-- NOTE: Remember that lua is a real programming language, and as such it is possible
				-- to define small helper and utility functions so you don't have to repeat yourself
				-- many times.
				--
				-- In this case, we create a function that lets us more easily define mappings specific
				-- for LSP related items. It sets the mode, buffer and description for us each time.
				local nmap = function(keys, func, desc)
					if desc then
						desc = "LSP: " .. desc
					end

					vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
				end

				nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
				nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

				nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
				nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
				nmap("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
				nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
				nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
				nmap("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

				-- See `:help K` for why this keymap
				nmap("<S-k>", vim.lsp.buf.hover, "Hover Documentation")
				-- nmap('<C-K>', vim.lsp.buf.signature_help, 'Signature Documentation')
				-- Create a command `:Signature` local to the LSP buffer
				vim.api.nvim_buf_create_user_command(bufnr, "Signature", function(_)
					vim.lsp.buf.signature_help()
				end, { desc = "Signature Documentation" })

				-- Lesser used LSP functionality
				nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
				nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
				nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
				nmap("<leader>wl", function()
					print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
				end, "[W]orkspace [L]ist Folders")

				-- Create a command `:Format` local to the LSP buffer
				vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
					vim.lsp.buf.format()
				end, { desc = "Format current buffer with LSP" })

				nmap("<leader>gf", ":lua vim.lsp.buf.format()<CR>", "[G]o [F]ormat")
			end
			-- Enable the following language servers
			--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
			--
			--  Add any additional override configuration in the following tables. They will be passed to
			--  the `settings` field of the server config. You must look up that documentation yourself.
			local servers = {
				clangd = {},
				-- gopls = {},
				pyright = {},
				rust_analyzer = {
					imports = {
						granularity = { group = "module" },
						prefix = "self",
					},
					cargo = { buildScripts = { enable = true } },
					procMacro = { enable = true },
				},
				-- tsserver = {},

				lua_ls = {
					Lua = {
						workspace = { checkThirdParty = false },
						telemetry = { enable = false },
					},
				},
			}

			-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
			-- Ensure the servers above are installed
			local mason_lspconfig = require("mason-lspconfig")
			mason_lspconfig.setup({ ensure_installed = vim.tbl_keys(servers) })
		end,
	},
	{
		"neovim/nvim-lspconfig",
		init_options = {
			userLanguages = { eelixir = "html-eex", eruby = "erb", rust = "html" },
		},
		dependencies = {
			-- Automatically install LSPs to stdpath for neovim
			"mason-org/mason.nvim",
			"mason-org/mason-lspconfig.nvim",
			-- Additional lua configuration, makes nvim stuff amazing!
			"folke/neodev.nvim",
		},
		config = function()
			-- Setup neovim lua configuration
			require("neodev").setup()
		end,
	},
}
