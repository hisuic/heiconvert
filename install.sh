#!/bin/bash
#
# Install heiconvert by symlinking it into a directory on PATH.
#
# Usage: ./install.sh [--uninstall] [install-dir]
# The install directory defaults to $HOME/.local/bin.

set -eu

repo_dir=$(cd "$(dirname "$0")" && pwd)
src="$repo_dir/bin/heiconvert"

uninstall=0
if [ "${1:-}" = "--uninstall" ]; then
    uninstall=1
    shift
fi

bin_dir=${1:-"$HOME/.local/bin"}
dest="$bin_dir/heiconvert"

if [ "$uninstall" -eq 1 ]; then
    if [ -L "$dest" ]; then
        rm "$dest"
        echo "Removed $dest"
    else
        echo "Nothing to remove at $dest" >&2
    fi
    exit 0
fi

mkdir -p "$bin_dir"
chmod +x "$src"
ln -sfn "$src" "$dest"
echo "Installed: $dest -> $src"

case ":$PATH:" in
    *":$bin_dir:"*) ;;
    *)
        echo
        echo "Note: $bin_dir is not on your PATH. Add this to your ~/.zshrc:"
        echo "  export PATH=\"$bin_dir:\$PATH\""
        ;;
esac
