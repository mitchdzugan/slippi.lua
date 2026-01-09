package = "slippi"
version = "0.0.1-0"
source = {
  url = "https://github.com/mitchdzugan/slippi.lua/archive/refs/heads/main.zip",
  dir = "slippi.lua-main"
}
description = {
   summary = "slippi file parser for lua envs",
   detailed = "",
   homepage = "https://github.com/mitchdzugan/slippi.lua",
   license = "MIT"
}
dependencies = {
   "lua >= 5.1"
}
build = {
   type = "builtin",
   modules = {
      ctx = "dist/slippi.lua"
   }
}
