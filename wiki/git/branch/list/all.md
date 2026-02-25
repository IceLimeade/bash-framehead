# `git::branch::list::all`

_No description available._

## Usage

```bash
git::branch::list::all ...
```

## Source

```bash
git::branch::list::all() {
    git::is_repo || return 1
    git branch -a 2>/dev/null | sed 's/^[* ] //' | grep -v '\->'
}
```

## Module

[`git`](../git.md)
