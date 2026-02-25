# `runtime::is_tty`

_No description available._

## Usage

```bash
runtime::is_tty ...
```

## Source

```bash
runtime::is_tty() {
  # Check if we have a controlling terminal
  [[ -t 0 ]] && tty -s 2>/dev/null
}
```

## Module

[`runtime`](../runtime.md)
