# `colour::println`

Print text in colour followed by newline

## Usage

```bash
colour::println ...
```

## Source

```bash
colour::println() {
    colour::print "$@"
    printf '\n'
}
```

## Module

[`colour`](../colour.md)
