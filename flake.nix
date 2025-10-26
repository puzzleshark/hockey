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

    packages.x86_64-linux.gcode = nixpkgs.legacyPackages.x86_64-linux.stdenv.mkDerivation {
      name = "mini-hockey-puck-gcode";
      buildInputs = [ nixpkgs.legacyPackages.x86_64-linux.prusa-slicer nixpkgs.legacyPackages.x86_64-linux.xvfb-run ];
      src = self.packages.x86_64-linux.stl;
      buildPhase = ''
        prusa-slicer --printer-profile "Creality Ender 3" --export-gcode mini_puck.gcode mini_puck.stl
      '';
      installPhase = ''
        mkdir -p $out
        cp mini_puck.gcode $out/
      '';
    };

    packages.x86_64-linux.default = self.packages.x86_64-linux.gcode;

    devShells.x86_64-linux.default = nixpkgs.legacyPackages.x86_64-linux.mkShell {
      buildInputs = [ nixpkgs.legacyPackages.x86_64-linux.prusa-slicer ];
    };
  };
}