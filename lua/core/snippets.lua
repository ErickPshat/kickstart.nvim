-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Help splits on the right
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'help',
  callback = function()
    vim.cmd 'wincmd L'
  end,
})

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Godot: start a per-project Neovim server from WSL-safe socket path
local function start_godot_server()
  local project_file = vim.fs.find('project.godot', {
    upward = true,
    path = vim.fn.getcwd(),
  })[1]

  if not project_file then
    return
  end

  local project_root = vim.fs.dirname(project_file)

  -- Create deterministic socket name based on project path
  local safe_name = project_root:gsub('[^%w]', '_')
  local server_pipe = '/tmp/godot-nvim-' .. safe_name .. '.sock'

  -- Avoid starting duplicate server
  if vim.uv.fs_stat(server_pipe) then
    return
  end

  vim.fn.serverstart(server_pipe)

  -- Optional: expose the socket path for debugging
  vim.g.godot_server_pipe = server_pipe

  print('Godot Neovim server started: ' .. server_pipe)
end

start_godot_server()
