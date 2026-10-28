# heiconvert

A small macOS command that converts HEIC/HEIF images to JPEG, PNG or PDF
while keeping the original pixel dimensions.

It uses the built-in `sips` command, so nothing else needs to be installed.

## Install

```sh
git clone https://github.com/hisuic/heiconvert.git
cd heiconvert
./install.sh            # symlinks to ~/.local/bin/heiconvert
./install.sh /usr/local/bin   # or choose another directory on PATH
```

To uninstall:

```sh
./install.sh --uninstall
```

## Usage

```sh
heiconvert photo.heic            # -> photo.jpg (same directory)
heiconvert --png photo.heic      # -> photo.png
heiconvert --pdf photo.heic      # -> photo.pdf
heiconvert ~/Pictures/trip       # convert every HEIC in the directory
heiconvert a.heic b.heic dir/    # multiple targets
```

- Output files are saved next to the source file with the same base name.
- When a directory is given, every `.heic` / `.heif` file directly inside it
  is converted, and the results are added to that directory
  (subdirectories are not searched).
- Existing output files are not overwritten unless `-f` / `--force` is given.
- Image orientation is preserved.

### Options

| Option            | Description                       |
| ----------------- | --------------------------------- |
| `--jpg`, `--jpeg` | Convert to JPEG (default)         |
| `--png`           | Convert to PNG                    |
| `--pdf`           | Convert to PDF                    |
| `-f`, `--force`   | Overwrite existing output files   |
| `-h`, `--help`    | Show help                         |
| `-v`, `--version` | Show version                      |

## Requirements

macOS (uses `/usr/bin/sips`).
