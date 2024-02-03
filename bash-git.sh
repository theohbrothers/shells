#!/bin/sh
set -eu
FLAGS=${FLAGS=-it}
docker run --rm "$FLAGS" \
    -e "CMD=${1:-}" \
    -v "$HOME/.bash_aliases:/home/user/.bash_aliases" \
    -v "$HOME/.bashrc:/home/user/.bashrc" \
    -v "$HOME/.git-credentials:/home/user/.git-credentials" \
    -v /:/host \
    -w /host \
    alpine:latest sh -c "$( cat - <<EOF
set -eux
apk add --no-cache bash bash-completion git
adduser -u $(id -u) --disabled-password --gecos '' user
git config --global user.name foo
git config --global user.email foo@example.com
git config --global credential.helper store
install -o user -g user -m 0640 ~/.gitconfig /home/user/.gitconfig
export TERM=xterm-256color
if [ -n "\$CMD" ]; then
    exec su user -s /bin/bash -c "\$CMD"
else
    exec su user -s /bin/bash
fi
EOF
)"
