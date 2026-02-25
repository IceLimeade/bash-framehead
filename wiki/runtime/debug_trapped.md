# `runtime::debug_trapped`

_No description available._

## Usage

```bash
runtime::debug_trapped ...
```

## Source

```bash
runtime::debug_trapped() {
    [[ -n "$(trap -p DEBUG)" ]]
}
```

## Module

[`runtime`](../runtime.md)
