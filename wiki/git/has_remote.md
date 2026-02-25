# `git::has_remote`

==============================================================================

## Usage

```bash
git::has_remote ...
```

## Source

```bash
git::has_remote() {
    git::is_repo || return 1
    [[ -n "$(git remote 2>/dev/null)" ]]
}
```

## Module

[`git`](../git.md)
