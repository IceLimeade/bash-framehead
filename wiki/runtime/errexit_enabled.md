# `runtime::errexit_enabled`

_No description available._

## Usage

```bash
runtime::errexit_enabled ...
```

## Source

```bash
runtime::errexit_enabled() {
    [[ "$-" == *e* ]]
}
```

## Module

[`runtime`](../runtime.md)
