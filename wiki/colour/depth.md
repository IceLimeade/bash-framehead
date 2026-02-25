# `colour::depth`

Return the number of colours the terminal supports

## Usage

```bash
colour::depth ...
```

## Source

```bash
colour::depth() {
    tput colors 2>/dev/null || echo "0"
}
```

## Module

[`colour`](../colour.md)
