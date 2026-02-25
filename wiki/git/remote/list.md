# `git::remote::list`

_No description available._

## Usage

```bash
git::remote::list ...
```

## Source

```bash
git::remote::list() {
    git::is_repo || return 1
    git remote 2>/dev/null
}
```

## Module

[`git`](../git.md)
