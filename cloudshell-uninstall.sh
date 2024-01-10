#!/usr/bin/env bash

set -eu

version="1.0.11"
download_dir="$HOME/e1s_downloads/${version}"
bin_dir="$HOME/.local/bin"

rm -rf "$download_dir" "$bin_dir/e1s"
