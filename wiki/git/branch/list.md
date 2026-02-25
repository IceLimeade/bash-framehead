# `git::branch::list`

_No description available._

## Usage

```bash
git::branch::list ...
```

## Source

```bash
git::branch::list() {
    git::is_repo || return 1
    git branch 2>/dev/null | sed 's/^[* ] //'
}
```

## Module

[`git`](../git.md)
