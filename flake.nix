{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=master";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in rec {
        devShells = {
          dev = pkgs.mkShell {
            buildInputs = [
              pkgs.typst
              pkgs.inkscape
              pkgs.pdftk
              pkgs.python3
              pkgs.python3Packages.opencv4
              pkgs.python3Packages.pytest
            ];
          };
        };
      }
    );
}
