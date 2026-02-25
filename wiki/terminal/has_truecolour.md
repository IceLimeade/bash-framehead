# `terminal::has_truecolour`

Check if terminal supports true colour

## Usage

```bash
terminal::has_truecolour ...
```

## Source

```bash
terminal::has_truecolour() {
    [[ "$COLORTERM" == "truecolor" || "$COLORTERM" == "24bit" ]]
}
```

## Module

[`terminal`](../terminal.md)
