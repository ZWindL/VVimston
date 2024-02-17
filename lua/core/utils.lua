-- handy tools
-- ref: https://github.com/ibhagwan/nvim-lua/blob/main/lua/utils.lua
-- ref1: https://bitbucket.org/sergio/mylazy-nvim/src/master/lua/core/utils.lua

local DEV_DIR = "$HOME/Projects/nvim"

local M = {}

M.IS_WINDOWS = vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1

local fast_event_aware_notify = function(msg, level, opts)
  if vim.in_fast_event() then
    vim.schedule(function()
      vim.notify(msg, level, opts)
    end)
  else
    vim.notify(msg, level, opts)
  end
end

function M.info(msg)
  fast_event_aware_notify(msg, vim.log.levels.INFO, {})
end

function M.warn(msg)
  fast_event_aware_notify(msg, vim.log.levels.WARN, {})
end

function M.err(msg)
  fast_event_aware_notify(msg, vim.log.levels.ERROR, {})
end

function M.has_neovim_v08()
  return vim.fn.has("nvim-0.8") == 1
end

function M.is_root()
  return not M.IS_WINDOWS and vim.loop.getuid() == 0
end

return M
