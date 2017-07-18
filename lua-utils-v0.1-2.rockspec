package = "lua-utils"
version = "v0.1-2"

source  = {
   url = "git://github.com/thartman83/lua-utils",
   tag = "v0.1-2",
}

description = {
   summary  = "A set of helper functions that I find useful",
   detailed = [[
      A set of simple helper functions that I find useful that
      part of lua natively.
    ]],
   homepage = "https://github.com/thartman83/lua-utils",
   license  = "GPL v2",
}

dependencies = {
   "lua >= 5.1",
}

build = {
   type = "builtin",
   modules = {
      ['lua-utils.table' ] = 'lu-table.lua',
      ['lua-utils.string'] = 'lu-string.lua',
   },
     
}
