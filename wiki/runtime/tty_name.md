# `runtime::tty_name`

_No description available._

## Usage

```bash
runtime::tty_name ...
```

## Source

```bash
runtime::tty_name() {
  tty 2>/dev/null || echo "not a tty"
}
```

## Module

[`runtime`](../runtime.md)
