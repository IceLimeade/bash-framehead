# `runtime::physical_cd_enabled`

_No description available._

## Usage

```bash
runtime::physical_cd_enabled ...
```

## Source

```bash
runtime::physical_cd_enabled() {
    [[ "$-" == *P* ]]
}
```

## Module

[`runtime`](../runtime.md)
