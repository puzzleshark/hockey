{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/release-24.11";
  };

  outputs = { self, nixpkgs }: let
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in {
    # packages.x86_64-linux.cura = nixpkgs.legacyPackages.x86_64-linux
    packages.x86_64-linux.stl = pkgs.stdenv.mkDerivation {
      name = "mini-hockey-puck";
      src = ./.;
      buildInputs = [ nixpkgs.legacyPackages.x86_64-linux.openscad ];
      buildPhase = ''
        openscad -o mini_puck.stl mini_puck.scad
      '';
      installPhase = ''
        mkdir -p $out
        cp mini_puck.stl $out/
      '';
    };

    packages.x86_64-linux.something = pkgs.runCommand "something" {} ''
      ${pkgs.super-slicer}/bin/superslicer --help
    '';

    packages.x86_64-linux.try = pkgs.writeScriptBin "another" {} ''
      ${pkgs.super-slicer}/bin/superslicer --help
    '';

  };
}