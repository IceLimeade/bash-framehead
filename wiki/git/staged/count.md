# `git::staged::count`

_No description available._

## Usage

```bash
git::staged::count ...
```

## Source

```bash
git::staged::count() {
    git::is_repo || { echo 0; return; }
    git diff --cached --numstat 2>/dev/null | wc -l | xargs
}
```

## Module

[`git`](../git.md)
