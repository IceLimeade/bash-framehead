# `runtime::nounset_enabled`

_No description available._

## Usage

```bash
runtime::nounset_enabled ...
```

## Source

```bash
runtime::nounset_enabled() {
    [[ "$-" == *u* ]]
}
```

## Module

[`runtime`](../runtime.md)
