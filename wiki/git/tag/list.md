# `git::tag::list`

==============================================================================

## Usage

```bash
git::tag::list ...
```

## Source

```bash
git::tag::list() {
    git::is_repo || return 1
    git tag 2>/dev/null
}
```

## Module

[`git`](../git.md)
