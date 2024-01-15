#!/usr/bin/env bash

set -eu

version="1.0.12"
download_dir="$HOME/e1s_downloads/${version}"
bin_dir="$HOME/.local/bin"

[ ! -d "$download_dir" ] && mkdir -p "$download_dir"

curl -o "$download_dir/e1s.tar.gz" -sSLf "https://github.com/keidarcy/e1s/releases/download/v${version}/e1s_${version}_linux_amd64.tar.gz"
tar -xzf "$download_dir/e1s.tar.gz" -C "$download_dir"

[ ! -d "$bin_dir" ] && mkdir -p "$bin_dir"
cp "$download_dir/e1s" "$bin_dir"

echo "e1s ${version} installed successfully"
