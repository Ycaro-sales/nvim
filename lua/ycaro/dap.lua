local dap = require('dap')

dap.configurations.cpp = {
  {
    name = "Launch",
    type = "cpptools",
    request = "launch",
    program = '${workspaceFolder}/main',
    cwd = '${workspaceFolder}',
    stopOnEntry = true,
    args = {},
    runInTerminal = false,
  },
}

dap.adapters.node2 = {
  type = 'executable',
  command = 'node',
  args = {os.getenv('HOME') .. '/dev/microsoft/vscode-node-debug2/out/src/nodeDebug.js'},
}

dap.adapters.cppdbg = {
  id = 'cppdbg',
  type = 'executable',
  command = '/usr/bin/cpptoolhow to configure cpptools dap nvim ch:',
}

dap.configurations.javascript = {
  {
    name = 'Launch',
    type = 'node2',
    request = 'launch',
    program = '${file}',
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
    console = 'integratedTerminal',
  },
  {
    -- For this to work you need to make sure the node process is started with the `--inspect` flag.
    name = 'Attach to process',
    type = 'node2',
    request = 'attach',
    processId = require'dap.utils'.pick_process,
  },
}


-- require("dapui").setup({
--   icons = { expanded = "", collapsed = "", current_frame = "" },
--   mappings = {
--     -- Use a table to apply multiple mappings
--     expand = { "<CR>", "<2-LeftMouse>" },
--     open = "o",
--     remove = "d",
--     edit = "e",
--     repl = "r",
--     toggle = "t",
--   },
--   -- Use this to override mappings for specific elements
--   element_mappings = {
--     -- Example:
--     -- stacks = {
--     --   open = "<CR>",
--     --   expand = "o",
--     -- }
--   },
--   -- Expand lines larger than the window
--   -- Requires >= 0.7
--   expand_lines = vim.fn.has("nvim-0.7") == 1,
--   -- Layouts define sections of the screen to place windows.
--   -- The position can be "left", "right", "top" or "bottom".
--   -- The size specifies the height/width depending on position. It can be an Int
--   -- or a Float. Integer specifies height/width directly (i.e. 20 lines/columns) while
--   -- Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
--   -- Elements are the elements shown in the layout (in order).
--   -- Layouts are opened in order so that earlier layouts take priority in window sizing.
--   layouts = {
--     {
--       elements = {
--       -- Elements can be strings or table with id and size keys.
--         { id = "scopes", size = 0.25 },
--         "breakpoints",
--         "stacks",
--         "watches",
--       },
--       size = 40, -- 40 columns
--       position = "left",
--     },
--     {
--       elements = {
--         "repl",
--         "console",
--       },
--       size = 0.25, -- 25% of total lines
--       position = "bottom",
--     },
--   },
--   controls = {
--     -- Requires Neovim nightly (or 0.8 when released)
--     enabled = true,
--     -- Display controls in this element
--     element = "repl",
--     icons = {
--       pause = "",
--       play = "",
--       step_into = "",
--       step_over = "",
--       step_out = "",
--       step_back = "",
--       run_last = "",
--       terminate = "",
--     },
--   },
--   floating = {
--     max_height = nil, -- These can be integers or a float between 0 and 1.
--     max_width = nil, -- Floats will be treated as percentage of your screen.
--     border = "single", -- Border style. Can be "single", "double" or "rounded"
--     mappings = {
--       close = { "q", "<Esc>" },
--     },
--   },
--   windows = { indent = 1 },
--   render = {
--     max_type_length = nil, -- Can be integer or nil.
--     max_value_lines = 100, -- Can be integer or nil.
--   }
-- })

local M = {}
--------------------------------------------------------------------------------
function M.init()
  M.tmpFile = os.tmpname()
  os.execute('whoami > '.. M.tmpFile)
  local whoamiFile = io.open(M.tmpFile, 'r')
  M.user = whoamiFile:read()
  whoamiFile:close()
  M.psCommand = 'ps -u '..M.user..' -U '..M.user..' u > '.. M.tmpFile
  vim.inspect(M)
end
--------------------------------------------------------------------------------
function M.inputAndWait(prompt)
  local co = coroutine.running()
  if co then
    cb = function(item)
      coroutine.resume(co, item)
    end
  end
  cb = vim.schedule_wrap(cb)

  vim.ui.input({
     prompt = "Enter program: ",
     default = '',
     completion = "file",
  }, cb)
  if co then
    return coroutine.yield()
  end
end
--------------------------------------------------------------------------------
function M.selectAndWait(items, prompt, format)
  local co = coroutine.running()
  if co then
    cb = function(item)
      coroutine.resume(co, item)
    end
  end
  cb = vim.schedule_wrap(cb)
  vim.ui.select(items, {
    prompt = prompt,
    format_item = format
  }, cb)
  if co then
    return coroutine.yield()
  end
end
--------------------------------------------------------------------------------
function M.processesWithName(name) 
  os.execute('ps | grep ' .. name .. ' > M.tmpFile')
  -- read the tmp file line by line
  local processes = {}
  for line in io.lines(M.tmpFile) do
    table.insert(processes, line)
  end
  return processes
end
--------------------------------------------------------------------------------
function M.processesOfUser() 
  os.execute(M.psCommand)
  -- read the tmp file line by line
  local processes = {}
  local first = true -- for omitting table header line
  for processString in io.lines(M.tmpFile) do
    if first then
      first = false
    else 
      local process = {}
      for token in string.gmatch(processString, '[^%s]+') do
        table.insert(process, token)
      end
      table.insert(processes, process)
    end
  end
  return processes
end
--------------------------------------------------------------------------------
function M.setup()
  local dap = require('dap')
  dap.adapters.cppdbg = {
    name = 'cppdbg',
    type = 'executable',
    command = vim.fn.stdpath('data') .. '/mason/bin/OpenDebugAD7',
  }
   dap.configurations.cpp = {
    {
      name = 'Debug Program',
      type = 'cppdbg',
      request = 'launch',
      MIMode = 'gdb',
      cwd = '${workspaceFolder}',
      -- udb='live',
      -- miDebuggerPath = 'udb',
      setupCommands= {
				{
					description= "Enable pretty-printing for gdb",
					text= "-enable-pretty-printing",
					ignoreFailures= true,
				}
      },
      stopAtEntry = true,
      program = 'main',
    },
   }
  dap.configurations.h = dap.configurations.cpp
end
M.init()
return M
