
# spritesheetify

Generate packed spritesheets from directories of sprites

- supports extrude, transparency box
- extract layers from OpenRaster files
- interprets text files to generate sprites on the fly
  - operations: transform, resize, layer, power sets, masks
- check if file has been modified since last generation

### Usage

```bash
spritesheetify assets/atlas dev/sprites
> assets/atlas.0.png
> assets/atlas.json
```

### Commands

Every file with the extension `.png.txt` will be interpreted.

Each line contains a single command:

- `source name`: layer referenced image (alias: `+`, `layer`, `above`, `top`)
- `below name`: layer referenced image below (alias: `bottom`)
- `resize (w) (h)`: resize current image, aspect ratio if dimension is 0
- `rotate (angle)`: rotate current image
- `rotate+ (angle)`: rotate current image and expand to fit
- `translate (dx) (dy)`: move current image (multiplier or pixels)
- `translate+ (dx) (dy)`: move current image and expand to fit
- `translate (d)`: scale current image (multiplier or pixels)
- `nothing`: zero image
- `export (name)`: export current image as a separate sprite
- `new`: clear current image
- `save`: save current image to a stack
- `restore`: restores the current image to stack pop
- `flags (count)`: generate **power set** of images from id `0` to id `(1 << count - 1)`
- `mask (bitmask) command...`: execute command only if the current image id matches the bitmask
- `mask^ (shift) command...`: bitmask of `1 << (shift)`

### OpenRaster

For each top layer/group of the OpenRaster file generate a sprite with the name `(file name).(layer name)`.

The sprite will be the merge of all sub-layers or layers with the same name. Invisible layers will be ignored.
