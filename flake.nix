{
  description = "Empty Template";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    ctx-lua.url = "path:/VOID/proj/ctx.lua";
    # ctx-lua.url = "github:mitchdzugan/ctx.lua";
  };

  outputs = {
    nixpkgs,
    flake-utils,
    ctx-lua,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = nixpkgs.legacyPackages.${system};

        nativeBuildInputs = with pkgs; [];
        buildInputs = with pkgs; [
          (pkgs.lua5_1.withPackages (lp: [
            lp.busted
            lp.inspect
            lp.serpent
            ctx-lua.mkPkg(lp)
          ]))
        ];
      in {
        devShells.default = pkgs.mkShell {inherit nativeBuildInputs buildInputs;};
      }
    );
}
