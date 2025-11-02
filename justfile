default:
    @just --list

build:
    nix build

build-stl:
    nix build .#stl

build-gcode:
    nix build .#gcode

build-screenshot:
    nix run .#screenshot

clean:
    rm -rf result

view:
    nix run nixpkgs#openscad mini_puck.scad

view-stl:
    nix run nixpkgs#openscad result/mini_puck.stl

view-gcode:
    nix run nixpkgs#prusa-slicer result-gcode/out.gcode

slice:
    nix develop --command prusa-slicer result/mini_puck.stl