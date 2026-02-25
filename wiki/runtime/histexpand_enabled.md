# `runtime::histexpand_enabled`

_No description available._

## Usage

```bash
runtime::histexpand_enabled ...
```

## Source

```bash
runtime::histexpand_enabled() {
    [[ "$-" == *H* ]]
}
```

## Module

[`runtime`](../runtime.md)
