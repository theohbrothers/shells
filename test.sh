#!/bin/sh
set -eu

echo "Testing bash.sh"
FLAGS='-i' ./bash.sh       "set -eux; bash --version"

echo
echo "Testing bash-git.sh"
FLAGS='-i' ./bash-git.sh   "set -eux; bash --version; git --version"

echo
echo "Testing pwsh-git.sh"
FLAGS='-i' ./pwsh-git.sh   "set -eux; bash --version; git --version; pwsh --version"

echo
echo "Success"
