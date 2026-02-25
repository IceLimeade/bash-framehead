# `git::is_repo`

git.sh — bash-frameheader git lib

## Usage

```bash
git::is_repo ...
```

## Source

```bash
git::is_repo() {
    git rev-parse --git-dir >/dev/null 2>&1
}
```

## Module

[`git`](../git.md)
