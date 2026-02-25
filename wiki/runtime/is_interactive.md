# `runtime::is_interactive`

_No description available._

## Usage

```bash
runtime::is_interactive ...
```

## Source

```bash
runtime::is_interactive() {
  [[ $- == *i* ]]
}
```

## Module

[`runtime`](../runtime.md)
