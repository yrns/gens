{
  description = "A very basic flake";
  inputs.flake-utils.url = "github:numtide/flake-utils";
  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = nixpkgs.legacyPackages.${system};
      in {
        # We just need gcc.
        devShells.default = pkgs.mkShell {};
      }
    );
}
