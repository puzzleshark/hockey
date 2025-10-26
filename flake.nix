{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }: {
    packages.x86_64-linux.default = nixpkgs.legacyPackages.x86_64-linux.stdenv.mkDerivation {
      name = "mini-hockey-puck";
      src = ./.;
      buildInputs = [ nixpkgs.legacyPackages.x86_64-linux.openscad ];
      buildPhase = ''
        openscad --export-format stl mini_puck.scad
      '';
      installPhase = ''
        mkdir -p $out
        cp mini_puck.stl $out/
      '';
    };
  };
}