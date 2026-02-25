# `runtime::noclobber_enabled`

_No description available._

## Usage

```bash
runtime::noclobber_enabled ...
```

## Source

```bash
runtime::noclobber_enabled() {
    [[ "$-" == *C* ]]
}
```

## Module

[`runtime`](../runtime.md)
