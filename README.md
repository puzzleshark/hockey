# Mini Hockey Puck

A 3D printable mini hockey puck designed for tabletop hockey games with spinning players.

## Description

This project uses OpenSCAD to generate a chamfered cylinder model of a hockey puck, suitable for mini games. The puck has a diameter of 25mm and height of 12mm with a 1mm chamfer for a realistic look.

## Requirements

- Nix with flakes enabled (`nix --version` should show flakes support)

## Building

### STL

```bash
nix build .#stl
```

### G-code

```bash
nix build
```

Attempts CLI slicing with PrusaSlicer (may fail due to GUI requirements).

## GUI Slicing

```bash
nix develop
prusa-slicer result/mini_puck.stl
```

## Customization

To modify the puck's dimensions, edit `mini_puck.scad`:

- `diameter`: Width of the puck (default: 25mm)
- `height`: Thickness of the puck (default: 12mm)
- `chamfer`: Bevel size on edges (default: 1mm)

After changes, rebuild with `nix build`.

## Printing

- Print the STL with standard settings.
- No supports required.
- Use a brim if needed for bed adhesion.

## License

This project is released under the MIT License.