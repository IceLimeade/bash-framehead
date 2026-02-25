# `colour::visible_length`

Return the visible length of a string (excluding escape codes)

## Usage

```bash
colour::visible_length ...
```

## Source

```bash
colour::visible_length() {
    local stripped
    stripped=$(colour::strip "$1")
    echo "${#stripped}"
}
```

## Module

[`colour`](../colour.md)
