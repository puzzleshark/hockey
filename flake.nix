{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/release-24.11";
  };

  outputs = { self, nixpkgs }: let
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in {
    packages.x86_64-linux.stl = pkgs.stdenv.mkDerivation {
      name = "mini-hockey-puck";
      src = ./.;
      buildInputs = [ pkgs.openscad ];
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

    packages.x86_64-linux.visualize = pkgs.runCommand "vis" {} ''
      ${pkgs.openscad}/bin/openscad ${self.packages.x86_64-linux.stl}/mini_puck.stl
    '';

     packages.x86_64-linux.gcode = pkgs.runCommand "gcode" {} ''
       mkdir $out
       ${pkgs.super-slicer}/bin/superslicer --load ${./config.ini} -o $out/mini_puck.gcode -g ${self.packages.x86_64-linux.stl}/mini_puck.stl
     '';

     packages.x86_64-linux.screenshot = pkgs.writeShellScriptBin "generate-screenshot" ''
       ${pkgs.openscad}/bin/openscad --imgsize=801,600 --viewall --autocenter mini_puck.scad -o screenshot.png
     '';

      packages.x86_64-linux.try = pkgs.writeShellScriptBin "another" ''
        ${pkgs.super-slicer}/bin/superslicer --load ${./config.ini} -o . -g ${self.packages.x86_64-linux.stl}/mini_puck.stl
      '';

      packages.x86_64-linux.vis2 = pkgs.writeShellScriptBin "another" ''
        ${pkgs.super-slicer}/bin/superslicer --gcodeviewer ${self.packages.x86_64-linux.gcode}/mini_puck.gcode
      '';

  };
}