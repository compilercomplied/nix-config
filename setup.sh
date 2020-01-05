
#!/usr/bin/env bash

set -o errexit      # Errors wont be silent.
set -o nounset      # Give an error when an unbound variable is used.

ROOT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

__="--------------------------------------------------------------------------"

echo -e $__ 
git submodule update --init --recursive

echo -e $__ 
ln .pkgs/nixpkgs-mozilla/rust-overlay.nix overlays/rust-overlay.nix
