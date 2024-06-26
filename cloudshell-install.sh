#!/usr/bin/env bash

set -eu

# if there is an argument, then use it as the version, else use the latest version
if [ $# -eq 1 ]; then
  version=$1
else
  version=$(curl -s https://api.github.com/repos/keidarcy/e1s/releases/latest | jq -r '.tag_name')
fi

# echo "version: ${version}"

download_dir="$HOME/e1s_downloads/${version}"
bin_dir="$HOME/.local/bin"

[ ! -d "$download_dir" ] && mkdir -p "$download_dir"

url="https://github.com/keidarcy/e1s/releases/download/${version}/e1s_${version:1}_linux_amd64.tar.gz"

# echo "URL: ${url}"

curl -o "$download_dir/e1s.tar.gz" -sSLf $url
tar -xzf "$download_dir/e1s.tar.gz" -C "$download_dir"

[ ! -d "$bin_dir" ] && mkdir -p "$bin_dir"
cp "$download_dir/e1s" "$bin_dir"

rm -rf "$download_dir"

echo "e1s ${version} installed successfully"
