{
  description = "A flake covering svelte(kit) Web Dev";

  inputs = {
    nixpkgs.url = "nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    { nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        devShell = pkgs.mkShell {
          nativeBuildInputs = with pkgs; [
            bun
            nodejs

            svelte-language-server
            typescript-language-server

            nil
            nixfmt-rfc-style
          ];
        };
      }
    );
}
