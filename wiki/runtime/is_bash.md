# `runtime::is_bash`

_No description available._

## Usage

```bash
runtime::is_bash ...
```

## Source

```bash
runtime::is_bash() {
  [[ -n "$BASH_VERSION" ]]
}
```

## Module

[`runtime`](../runtime.md)
