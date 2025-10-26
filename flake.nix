{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/release-24.11";
  };

  outputs = { self, nixpkgs }: {
    packages.x86_64-linux.stl = nixpkgs.legacyPackages.x86_64-linux.stdenv.mkDerivation {
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

  };
}