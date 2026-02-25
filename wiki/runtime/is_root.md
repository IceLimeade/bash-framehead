# `runtime::is_root`

_No description available._

## Usage

```bash
runtime::is_root ...
```

## Source

```bash
runtime::is_root() {
  [[ $EUID -eq 0 ]]
}
```

## Module

[`runtime`](../runtime.md)
