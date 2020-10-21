local treesitter = require'nvim-treesitter.configs'
local lsp = require'nvim_lsp'

if vim.env.SNIPPETS then
  vim.snippet = require 'snippet'
end

-- treesitter setup
treesitter.setup {
  highlight = {
    enable = true,
    -- disable = { 'c', 'rust' },
  },
  incremental_selection = {
    enable = true,
    -- disable = { 'cpp', 'lua' },
    keymaps = {
      node_incremental = "grn",
      scope_incremental = "grc"
    }
  },
  ensure_installed = {'c', 'cpp', 'lua', 'rust', 'go'}
}

local chain_complete_list = {
	default = {
		{complete_items = {'lsp', 'snippet'}},
		{complete_items = {'path'}, triggered_only = {'./', '/'}},
		{complete_items = {'buffers'}},
	},
	string = {
		{complete_items = {'path'}, triggered_only = {'./', '/'}},
		{complete_items = {'buffers'}},
	},
	comment = {},
}
local map = function(type, key, value)
	vim.fn.nvim_buf_set_keymap(0,type,key,value,{noremap = true, silent = true});
end

local on_attach = function(client)
		print("LSP started.");
		require'completion'.on_attach(client)
		require'diagnostic'.on_attach(client)

		-- GOTO mappings
		map('n','gD','<cmd>lua vim.lsp.buf.declaration()<CR>')
		map('n','gd','<cmd>lua vim.lsp.buf.definition()<CR>')
		map('n','K','<cmd>lua vim.lsp.buf.hover()<CR>')
		-- map('n','gr','<cmd>lua vim.lsp.buf.references()<CR>')
		map('n','gs','<cmd>lua vim.lsp.buf.signature_help()<CR>')
		map('n','gi','<cmd>lua vim.lsp.buf.implementation()<CR>')
		map('n','gt','<cmd>lua vim.lsp.buf.type_definition()<CR>')
		map('n','<leader>gw','<cmd>lua vim.lsp.buf.document_symbol()<CR>')
		map('n','<leader>gW','<cmd>lua vim.lsp.buf.workspace_symbol()<CR>')

		-- ACTION mappings
		map('n','<leader>ah',  '<cmd>lua vim.lsp.buf.hover()<CR>')
		map('n','<leader>af', '<cmd>lua vim.lsp.buf.code_action()<CR>')
		map('n','<leader>ee', '<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>')
		map('n','<leader>ar',  '<cmd>lua vim.lsp.buf.rename()<CR>')

		-- Few language severs support these three
		map('n','<leader>=',  '<cmd>lua vim.lsp.buf.formatting()<CR>')
		map('n','<leader>ai',  '<cmd>lua vim.lsp.buf.incoming_calls()<CR>')
		map('n','<leader>ao',  '<cmd>lua vim.lsp.buf.outgoing_calls()<CR>')

		-- if diagnostic plugin is installed
		map('n','<leader>ep','<cmd>PrevDiagnosticCycle<CR>')
		map('n','<leader>en','<cmd>NextDiagnosticCycle<CR>')

		map('n','<leader>i','<cmd>lua vim.lsp.buf.code_action({source = {organizeImports = true}})<CR>')
end


lsp.sumneko_lua.setup{
	on_attach=on_attach,
	settings = {
		Lua = {
			runtime = { version = "LuaJIT", path = vim.split(package.path, ';'), },
			completion = { keywordSnippet = "Disable", },
			diagnostics = { enable = true, globals = {
				"vim", "describe", "it", "before_each", "after_each" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
				}
			}
		}
	}
}

lsp.vimls.setup{
  cmd = {"vim-language-server", "--stdio"};
  on_attach = on_attach;
}

lsp.pyls.setup{
  on_attach = on_attach;
  settings = {
    pyls = {
      plugins = {
        pycodestyle = { enabled = false; },
      }
    }
  }
}

-- lsp.pyls_ms.setup{
  -- on_attach = require'on_attach'.on_attach;
-- }

lsp.clangd.setup{
  on_attach = on_attach;
  capabilities = {
    textDocument = {
      completion = {
        completionItem = {
          snippetSupport = true
        }
      }
    }
  },
  init_options = {
    usePlaceholders = true,
    completeUnimported = true
  }
}

lsp.gopls.setup{
  cmd = {"gopls"};
  on_attach = on_attach;
  filetypes = {'go','gomod'};
  root_patterns = {'go.mod','.git'};
  -- https://github.com/golang/tools/blob/master/gopls/doc/settings.md#settings
  init_options = {
    usePlaceholders=true;
    completeUnimported=true;
  };
}

local dart_capabilities = vim.lsp.protocol.make_client_capabilities()
dart_capabilities.textDocument.codeAction = {
  dynamicRegistration = false;
      codeActionLiteralSupport = {
          codeActionKind = {
              valueSet = {
                 "",
                 "quickfix",
                 "refactor",
                 "refactor.extract",
                 "refactor.inline",
                 "refactor.rewrite",
                 "source",
                 "source.organizeImports",
              };
          };
      };
}

local closing_labels_namespace = vim.api.nvim_create_namespace('dart_closing_labels')

local on_closing_labels = function (...)
  local arg = {...}
  local labels = arg[3].labels

  vim.api.nvim_buf_clear_namespace(0, closing_labels_namespace, 0, -1)

  for i,l in ipairs(labels) do
    local name =  l.label
    local line = l.range['end'].line
    vim.api.nvim_buf_set_virtual_text(
      0,
      closing_labels_namespace,
      line,
      {{'// '..name, 'Comment'}},
      {}
    )
    print(i, name, line)
  end
end

local on_code_action = function (...)
	local arg = {...}
	print(vim.inspect(arg))
end

lsp.dartls.setup({
  on_attach = on_attach;
	init_options = {
		onlyAnalyzeProjectsWithOpenFiles = false,
    suggestFromUnimportedLibraries = true,
    closingLabels = true,
		outline = true;
		flutterOutline = false
	};
	capabilities = dart_capabilities;
	callbacks = {
		['dart/textDocument/publishClosingLabels'] = on_closing_labels;
	};
})

lsp.jsonls.setup {
  on_attach = on_attach;
}

local strategy = { 'exact', 'substring', 'fuzzy' }
vim.g.completion_matching_strategy_list = strategy
vim.g.diagnostic_enable_virtual_text = 1
vim.g.space_before_virtual_text = 5

vim.lsp.callbacks['textDocument/codeAction'] = require'lsputil.codeAction'.code_action_handler
vim.lsp.callbacks['textDocument/references'] = require'lsputil.locations'.references_handler
vim.lsp.callbacks['textDocument/definition'] = require'lsputil.locations'.definition_handler
vim.lsp.callbacks['textDocument/declaration'] = require'lsputil.locations'.declaration_handler
vim.lsp.callbacks['textDocument/typeDefinition'] = require'lsputil.locations'.typeDefinition_handler
vim.lsp.callbacks['textDocument/implementation'] = require'lsputil.locations'.implementation_handler
vim.lsp.callbacks['textDocument/documentSymbol'] = require'lsputil.symbols'.document_handler
vim.lsp.callbacks['workspace/symbol'] = require'lsputil.symbols'.workspace_handler
