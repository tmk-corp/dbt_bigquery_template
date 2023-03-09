#!/usr/bin/env bash
# shellcheck disable=SC2016

project_dir="$(cd "$(git rev-parse --show-toplevel)" && pwd -P)"

sudo chown vscode:vscode /home/vscode/.config

# Enable direnv
echo 'eval "$(direnv hook bash)"' >> /home/vscode/.bashrc
direnv allow "${project_dir}"