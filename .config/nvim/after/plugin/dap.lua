require("mason-nvim-dap").setup({
    ensure_installed = { "cppdbg" },
    automatic_installation = true,
    handlers = {
        function(config)
            require("mason-nvim-dap").default_setup(config)
        end,
    },
})

local dap = require('dap')
require('dapui').setup()

vim.fn.sign_define('DapBreakpoint', {
  text = '●',
  texthl = 'DiagnosticSignError',
  linehl = '',
  numhl = ''
})

dap.adapters.codelldb = {
 type = "server",
 port = "${port}",
 executable = {
  command = "codelldb",
  args = { "--port", "${port}" },
 },
}

dap.configurations.c = {
    {
        name = "Launch file",
        type = "codelldb",
        request = "launch",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopAtEntry = true,
    }
}

dap.configurations.cpp = {
    {
        name = "Launch file",
        type = "codelldb",
        request = "launch",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopAtEntry = true,
    }
}

dap.configurations.python = {
  {
    type = 'python',
    request = 'launch',
    name = 'Launch file',
    program = '${file}', -- run current file
    pythonPath = function()
      -- Use system Python or override for venvs
      return '/usr/bin/python3'
    end,
  },
}

-- dap.adapters.python = {
--   type = 'executable',
--   command = vim.fn.stdpath("data") .. '/mason/packages/debugpy/venv/bin/python',
--   args = { '-m', 'debugpy.adapter' },
-- }

-- Global DAP keymaps
local dapui = require('dapui')

vim.keymap.set('n', '<leader>dt', dap.toggle_breakpoint, { desc = 'DAP: Toggle Breakpoint' })
vim.keymap.set('n', '<leader>dc', dap.continue, { desc = 'DAP: Continue' })
vim.keymap.set('n', '<leader>dr', dap.repl.open, { desc = 'DAP: Open REPL' })
vim.keymap.set('n', '<leader>dk', dap.terminate, { desc = 'DAP: Kill Session' })

vim.keymap.set('n', '<leader>dso', dap.step_over, { desc = 'DAP: Step Over' })
vim.keymap.set('n', '<leader>dsi', dap.step_into, { desc = 'DAP: Step Into' })
vim.keymap.set('n', '<leader>dsu', dap.step_out, { desc = 'DAP: Step Out' })
vim.keymap.set('n', '<leader>dl', dap.run_last, { desc = 'DAP: Run Last' })

vim.keymap.set('n', '<leader>do', dapui.open, { desc = 'DAP UI: Open' })
vim.keymap.set('n', '<leader>duc', dapui.close, { desc = 'DAP UI: Close' })
vim.keymap.set('n', '<leader>?', function()
  dapui.eval(nil, { enter = true })
end, { desc = 'DAP UI: Eval under cursor' })

