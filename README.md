# Mini Hockey Puck

A 3D printable mini hockey puck designed for tabletop hockey games with spinning players.

## Description

This project uses OpenSCAD to generate a chamfered cylinder model of a hockey puck, suitable for mini games. The puck has a diameter of 25mm and height of 12mm with a 1mm chamfer for a realistic look.

## Requirements

- Nix with flakes enabled (`nix --version` should show flakes support)

## Building

### STL File

To generate the STL file:

```bash
nix build .#stl
```

The STL file will be available at `result/mini_puck.stl`.

### G-code File

To generate G-code directly (using PrusaSlicer's default settings):

```bash
nix build
```

Or explicitly:

```bash
nix build .#gcode
```

The G-code file will be available at `result/mini_puck.gcode`. This uses default printer settings (Prusa Mini); for custom settings, use the GUI method below.

## Slicing to G-code (GUI)

To generate G-code with custom printer settings, enter the development shell with PrusaSlicer:

```bash
nix develop
prusa-slicer result/mini_puck.stl
```

Configure your printer settings in the GUI, then export the G-code.

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