-- Go development: treesitter (go parser), gopls LSP, and completion.
-- The Debian-bundled parsers (/usr/lib/nvim/parser) do NOT include go, so we
-- let nvim-treesitter install only the go-family parsers here. lua/c/markdown
-- etc. keep coming from the Debian bundle.

-- Treesitter --------------------------------------------------------------
local ts_ok, ts = pcall(require, "nvim-treesitter.configs")
if ts_ok then
  ts.setup({
    ensure_installed = { "go", "gomod", "gosum", "gowork" },
    highlight = { enable = true },
    indent = { enable = true },
  })
end

-- Completion (nvim-cmp) ----------------------------------------------------
local cmp_ok, cmp = pcall(require, "cmp")
if cmp_ok then
  cmp.setup({
    -- Use Neovim 0.10's native snippet engine (no LuaSnip dependency).
    snippet = {
      expand = function(args)
        vim.snippet.expand(args.body)
      end,
    },
    mapping = cmp.mapping.preset.insert({
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<CR>"] = cmp.mapping.confirm({ select = true }),
    }),
    sources = {
      { name = "nvim_lsp" },
    },
  })
end

-- LSP (gopls) -------------------------------------------------------------
-- Started with Neovim's native vim.lsp.start (no nvim-lspconfig needed, so no
-- "0.10 deprecated" nag). vim.lsp.start dedups by name + root_dir, so every
-- Go buffer in the same module reuses one gopls client.
local capabilities = vim.lsp.protocol.make_client_capabilities()
local cnl_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if cnl_ok then
  capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
end

vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  callback = function(ev)
    vim.lsp.start({
      name = "gopls",
      cmd = { "gopls" },
      root_dir = vim.fs.root(ev.buf, { "go.work", "go.mod", ".git" }),
      capabilities = capabilities,
      settings = {
        gopls = {
          gofumpt = true,
          staticcheck = true,
          analyses = {
            unusedparams = true,
            nilness = true,
            unusedwrite = true,
            useany = true,
          },
        },
      },
    })
  end,
})

-- Buffer-local keymaps once an LSP attaches. The `desc` fields make these show
-- up in which-key automatically; being buffer-local, they only appear in the
-- popup on buffers that actually have an LSP attached (e.g. Go files).
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local function map(lhs, rhs, desc)
      vim.keymap.set("n", lhs, rhs, { buffer = ev.buf, silent = true, desc = desc })
    end
    map("gd", vim.lsp.buf.definition, "Go to definition")
    map("gr", vim.lsp.buf.references, "References")
    map("K", vim.lsp.buf.hover, "Hover docs")
    map("<leader>rn", vim.lsp.buf.rename, "Rename symbol")
    map("<leader>ca", vim.lsp.buf.code_action, "Code action")
    map("<leader>cd", vim.diagnostic.open_float, "Line diagnostics")
    map("[d", vim.diagnostic.goto_prev, "Prev diagnostic")
    map("]d", vim.diagnostic.goto_next, "Next diagnostic")
  end,
})

-- Format + organize imports on save for Go files (handled by gopls).
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    local params = vim.lsp.util.make_range_params()
    params.context = { only = { "source.organizeImports" } }
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
    for cid, res in pairs(result or {}) do
      for _, action in pairs(res.result or {}) do
        if action.edit then
          local client = vim.lsp.get_client_by_id(cid)
          local enc = client and client.offset_encoding or "utf-16"
          vim.lsp.util.apply_workspace_edit(action.edit, enc)
        end
      end
    end
    vim.lsp.buf.format({ async = false })
  end,
})

-- Debugging (nvim-dap + delve via nvim-dap-go, visual UI via nvim-dap-ui) ---
local dap_ok, dap = pcall(require, "dap")
local dapgo_ok, dapgo = pcall(require, "dap-go")
if dap_ok and dapgo_ok then
  dapgo.setup() -- registers the delve adapter + default Go launch configs

  local dapui_ok, dapui = pcall(require, "dapui")
  if dapui_ok then
    dapui.setup()
    -- Auto open/close the debugger UI around a session.
    dap.listeners.before.attach.dapui_config = function() dapui.open() end
    dap.listeners.before.launch.dapui_config = function() dapui.open() end
    dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
    dap.listeners.before.event_exited.dapui_config = function() dapui.close() end
  end

  -- Gutter signs for breakpoints / current line.
  vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DiagnosticError" })
  vim.fn.sign_define("DapStopped", { text = "▶", texthl = "DiagnosticWarn", linehl = "Visual" })

  -- Keymaps (<leader>d = debug; desc fields surface them in which-key).
  local function dmap(lhs, rhs, desc)
    vim.keymap.set("n", lhs, rhs, { silent = true, desc = desc })
  end
  dmap("<leader>db", dap.toggle_breakpoint, "Toggle breakpoint")
  dmap("<leader>dc", dap.continue, "Continue / start")
  dmap("<leader>di", dap.step_into, "Step into")
  dmap("<leader>do", dap.step_over, "Step over")
  dmap("<leader>dO", dap.step_out, "Step out")
  dmap("<leader>dr", dap.repl.toggle, "Toggle REPL")
  dmap("<leader>dl", dap.run_last, "Run last")
  dmap("<leader>dt", dap.terminate, "Terminate")
  dmap("<leader>dT", function() dapgo.debug_test() end, "Debug nearest test")
  dmap("<M-j>", dap.step_over, "Step over")
  dmap("<M-k>", dap.step_into, "Step into")
  dmap("<M-l>", dap.step_out,  "Step out")
  dmap("<M-h>", dap.continue,  "Continue")
  if dapui_ok then
    dmap("<leader>du", dapui.toggle, "Toggle debug UI")
  end
end
