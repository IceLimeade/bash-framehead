# `colour::supports_truecolor`

Check if terminal supports true colour (24-bit)

## Usage

```bash
colour::supports_truecolor ...
```

## Source

```bash
colour::supports_truecolor() {
    [[ "$COLORTERM" == "truecolor" || "$COLORTERM" == "24bit" ]]
}
```

## Module

[`colour`](../colour.md)
