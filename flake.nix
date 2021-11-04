{
  inputs.nixpkgs.url = "github:nixos/nixpkgs";

  outputs = { self, nixpkgs }:
    let
      shellFor = import ./nix/shell-for.nix;
    in {
      devShell.x86_64-linux = let pkgs = import nixpkgs {
        system = "x86_64-linux";
      }; in shellFor {
        inherit pkgs;
        system = "x86_64-linux";
        systemDeps = with pkgs; [ xorg.libxcb xorg.libXcomposite ];
      };
    };
}
