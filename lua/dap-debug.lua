local dap = require('dap')

dap.adapters.netcoredbg = {
  type = 'executable',
  command = '/usr/local/bin/netcoredbg',
  args = {
    '--interpreter=vscode'
  }
}

dap.configurations.cs = {
  {
    type = "netcoredbg",
    name = "launch - netcoredbg",
    request = "launch",
    program = function()
        return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/', 'file')
    end,
    stopAtEntry = true,
  },
}

-- require('dap').set_log_level('INFO')
--dap.defaults.fallback.terminal_win_cmd = '80vsplit new'
vim.fn.sign_define('DapBreakpoint', {text='', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpointRejected', {text='', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='ﭦ', texthl='', linehl='', numhl=''})

-- nvim-dap-virtual-text
require('nvim-dap-virtual-text').setup()
