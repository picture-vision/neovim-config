local dap = require('dap')

vim.fn.sign_define('DapBreakpoint', {text='BP', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpointRejected', {text='🟦', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='⭐️', texthl='', linehl='', numhl=''})

local function pwd() return io.popen("pwd"):lines()() end

dap.adapters.netcoredbg = {
    type = "executable",
    command = "/usr/local/bin/netcoredbg",
    args = {
        "--interpreter=vscode",
        string.format("--engineLogging=%s/netcoredbg.engine.log", XDG_CACHE_HOME),
        string.format("--log=%s/netcoredbg.log", XDG_CACHE_HOME),
    },
}

--dap.configurations.cs = {
--    {
--        type = "netcoredbg",
--        name = "launch - netcoredbg",
--        request = "launch",
--        program = function()
--            local dll = io.popen("find bin/Debug/ -maxdepth 2 -name \"*.dll\"")
--            return pwd() .. "/" .. dll:lines()()
--        end,
--        stopAtEntry = true,
--    },
--}

local function attach()
  print "attaching debugger"
  dap.run({
    type = "netcoredbg",
    name = "launch - netcoredbg",
    request = "launch",
    program = function()
      local dll = io.popen("find bin/Debug/ -maxdepth 2 -name \"*.dll\"")
      return pwd() .. "/" .. dll:lines()()
    end,
    stopAtEntry = true,
  })
end

return {
  attach = attach
}
