
# spritesheetify

Generate packed spritesheets from directories of sprites

- supports extrude
- interprets text files to generate sprites on the fly
  - operations: source, rotate, bellow, above
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

- `source name`: layer referenced image (alias: `layer`, `above`, `top`)
- `below name`: layer referenced image bellow (alias: `bottom`)
- `rotate angle`: rotate image
- `rotate+ angle`: rotate image and expand to fit
