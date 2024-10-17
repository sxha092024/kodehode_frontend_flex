{
  description = "html skill flex???";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = nixpkgs.legacyPackages.${system};
      in {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [];

          nativeBuildInputs = with pkgs; [
            git
            # yes, I'm explicitly putting it here instead of it being a global system package
            figma-linux
            # javascript repl
            deno
          ];
          shellHook = ''
            echo "Flake shell active..."
          '';
        };
      }
    );
}
