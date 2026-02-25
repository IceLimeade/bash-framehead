# `git::is_ahead`

_No description available._

## Usage

```bash
git::is_ahead ...
```

## Source

```bash
git::is_ahead() {
    git::is_repo || return 1
    [[ "$(git::ahead_count)" -gt 0 ]]
}
```

## Module

[`git`](../git.md)
