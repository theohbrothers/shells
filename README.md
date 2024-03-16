# Shells

[![github-actions](https://github.com/theohbrothers/shells/actions/workflows/ci-master-pr.yml/badge.svg?branch=master)](https://github.com/theohbrothers/shells/actions/workflows/ci-master-pr.yml)

Scripts to spin up dockerized `bash` shells to perform quick work.

## Usage

Start a shell:

```sh
./bash.sh
./bash-git.sh
./pwsh-git.sh
```

To run a command and exit:

```sh
./bash.sh "echo 1"
```

Notes:

- Customize the script before running it
- Default user is `user` with same UID as the script caller
- host filesystem is mounted on `/host`
- `~/.bash_aliases` is mounted on `/home/user/.bash_aliases`
- `~/.bashrc` is mounted on `/home/user/.bashrc`
- `~/.git-credentials` is mounted on `/home/user/.git-credentials` (for `git` variants)
