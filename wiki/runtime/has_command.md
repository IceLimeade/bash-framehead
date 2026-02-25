# `runtime::has_command`

_No description available._

## Usage

```bash
runtime::has_command ...
```

## Source

```bash
runtime::has_command() {
  command -v "$1" >/dev/null 2>&1
}
```

## Module

[`runtime`](../runtime.md)
