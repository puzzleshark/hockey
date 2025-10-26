default:
    @just --list

build:
    nix build

build-stl:
    nix build .#stl

build-gcode:
    nix build .#gcode

clean:
    rm -rf result

view:
    nix run nixpkgs#openscad mini_puck.scad

slice:
    nix develop --command prusa-slicer result/mini_puck.stl