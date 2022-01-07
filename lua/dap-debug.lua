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

dap.adapters.node2 = {
    type = 'executable',
    command = 'node',
    args = {
        vim.fn.stdpath("data") .. "/dapinstall/jsnode_dbg/" ..
            '/vscode-node-debug2/out/src/nodeDebug.js'
    }
}

dap.configurations.javascript = {
    {
        type = 'node2',
        request = 'launch',
        program = '${workspaceFolder}/${file}',
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
        protocol = 'inspector',
        console = 'integratedTerminal'
    }
}

-- require('dap').set_log_level('INFO')
--dap.defaults.fallback.terminal_win_cmd = '80vsplit new'
vim.fn.sign_define('DapBreakpoint', {text='', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpointRejected', {text='', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='ﭦ', texthl='', linehl='', numhl=''})

-- nvim-dap-virtual-text
require('nvim-dap-virtual-text').setup()
