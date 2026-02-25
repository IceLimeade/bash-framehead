# `runtime::has_flag`

_No description available._

## Usage

```bash
runtime::has_flag ...
```

## Source

```bash
runtime::has_flag() {
    local flag="$1"
    [[ "$-" == *"$flag"* ]]
}
```

## Module

[`runtime`](../runtime.md)
