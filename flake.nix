{
  description = "slippi parser";
  inputs = {
    mitch-utils.url = "github:mitchdzugan/mitch-utils.nix";
    ctx-lua.url = "github:mitchdzugan/ctx.lua";
  };
  outputs = ({ mitch-utils, ctx-lua, ... }:
    let
      mkLuaDeps = luaPkgs: with luaPkgs; [
        busted
        fennel
        (ctx-lua.mkPkg luaPkgs)
      ];
    in (mitch-utils.mkZnFnl "slippi" "0.0.1-0" mkLuaDeps ./.)
  );
}
