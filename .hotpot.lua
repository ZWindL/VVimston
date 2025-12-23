-- By default, the Fennel compiler wont complain if unknown variables are
-- referenced, we can force a compiler error so we don't try to run faulty code.
local allowed_globals = {}
for key, _ in pairs(_G) do
  table.insert(allowed_globals, key)
end

return {
  build = {
    {atomic = true, verbose = true},
    {"fnl/**/*macro*.fnl", false},
    -- put all lua files inside `.compiled/lua`, note we must still name the
    -- final directory lua/, due to how nvims RTP works.
    {"fnl/**/*.fnl", function(path)
      -- ~/.config/nvim/fnl/hello/there.fnl -> ~/.config/nvim/.compiled/lua/hello/there.lua
      return string.gsub(path, "/fnl/", "/.compiled/lua/")
    end},
    -- You may also compile a init.fnl file to init.lua
    {"init.fnl", true}
  },
  clean = {{".compiled/lua/**/*.lua", true}},
  compiler = {
    modules = {
      allowedGlobals = allowed_globals
    }
  }
}
