# `colour::supports_256`

Check if terminal supports 256 colours

## Usage

```bash
colour::supports_256 ...
```

## Source

```bash
colour::supports_256() {
    (( $(colour::depth) >= 256 ))
}
```

## Module

[`colour`](../colour.md)
