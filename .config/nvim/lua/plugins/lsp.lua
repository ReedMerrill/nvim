return {
	{ -- LSP Configuration & Plugins
		"neovim/nvim-lspconfig",
		dependencies = {
			-- Automatically install LSPs and related tools to stdpath for neovim
			"mason-org/mason.nvim",
			"mason-org/mason-lspconfig.nvim",
			{ "j-hui/fidget.nvim", opts = {} },
		},
    opts = {
      servers = {
				-- LSPs
				bashls = {
					on_attach = function()
						print("bashls attached")
					end,
				},
				html = {
					on_attach = function()
						print("html LSP attached")
					end,
				},
				pyright = {},
				lua_ls = {
					on_attach = function()
						print("lua_ls attached")
					end,
					settings = {
						Lua = {
							runtime = { version = "LuaJIT" },
							workspace = {
								checkThirdParty = false,
								-- Tells lua_ls where to find all the Lua files that you have loaded
								-- for your neovim configuration.
								library = {
									"${3rd}/luv/library",
									unpack(vim.api.nvim_get_runtime_file("", true)),
								},
							},
							completion = {
								callSnippet = "Replace",
							},
							-- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
							diagnostics = { disable = { "missing-fields" } },
						},
					},
				},
				r_language_server = {
					on_attach = function()
						print("r_language_server attached")
					end,
					filetypes = { "r", "rmd", "quarto" },
					root_dir = function(bufnr, on_dir)
						on_dir(vim.fs.root(bufnr, ".git") or vim.uv.os_homedir())
					end,
				},
				rust_analyzer = {
					on_attach = function()
						print("rust_analyzer attached")
					end,
				},
			}
    },
		config = function(_, opts)
			-- blink.cmp
			local lspconfig = require("lspconfig")
			for server, config in pairs(opts.servers) do
				-- passing config.capabilities to blink.cmp merges with the capabilities in your
				-- `opts[server].capabilities, if you've defined it
				config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
				lspconfig[server].setup(config)
			end
			--  This function gets run when an LSP attaches to a particular buffer.
			--    That is to say, every time a new file is opened that is associated with
			--    an LSP (for example, opening `main.rs` is associated with `rust_analyzer`) this
			--    function will be executed to configure the current buffer
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
				callback = function(event)
					-- In this case, we create a function that lets us more easily define mappings specific
					-- for LSP related items. It sets the mode, buffer and description for us each time.
					local map = function(keys, func, desc)
						vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end
					-- LSP rename
					map("grn", vim.lsp.buf.rename, "LSP rename")
					-- Jump to the definition of the word under your cursor.
					map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
					-- Find references
					map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
					-- Jump to the type of the word under your cursor.
					--  Useful when you're not sure what type a variable is and you want to see
					--  the definition of its *type*, not where it was *defined*.
					map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
					-- Fuzzy find all the symbols in your current document.
					--  Symbols are things like variables, functions, types, etc.
					map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
					-- Fuzzy find all the symbols in your current workspace
					--  Similar to document symbols, except searches over your whole project.
					map(
						"<leader>ws",
						require("telescope.builtin").lsp_dynamic_workspace_symbols,
						"[W]orkspace [S]ymbols"
					)
					map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
					-- WARN: This is not Goto Definition, this is Goto Declaration.
					map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
        end
      })

			-- LSP servers and clients are able to communicate to each other what features they support.
			--  By default, Neovim doesn't support everything that is in the LSP Specification.
			--  When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
			--  So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
			vim.lsp.config("*", {
				capabilities = vim.lsp.protocol.make_client_capabilities(),
			})

			-- Ensure the servers and tools above are installed
			require("mason").setup()

			-- You can add other tools here that you want Mason to install
			-- for you, so that they are available from within Neovim.
			

			require("mason-lspconfig").setup({
				automatic_enable = true, -- make the default explicit
				handlers = {
					function(server_name)
						local server = servers[server_name] or {}
						-- This handles overriding only values explicitly passed
						-- by the server configuration above. Useful when disabling
						-- certain features of an LSP (for example, turning off formatting for tsserver)
						server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
						require("lspconfig")[server_name].setup(server)
					end,
				},
			})
		end,
	},
	-- WARN: This might not work below neovim 0.11
	{
		-- Diagnostics messages
		vim.diagnostic.config({
			signs = { priority = 9999 },
			underline = true,
			update_in_insert = false, -- false so diagnostics are updated on InsertLeave
			virtual_lines = { current_line = true },
			severity_sort = true,
			float = {
				focusable = false,
				style = "minimal",
				border = "rounded",
				source = true,
				header = "",
			},
		}),
	},
}
