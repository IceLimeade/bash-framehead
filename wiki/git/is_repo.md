# `git::is_repo`

_No description available._

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
