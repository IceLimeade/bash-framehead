# `runtime::is_verbose`

_No description available._

## Usage

```bash
runtime::is_verbose ...
```

## Source

```bash
runtime::is_verbose() {
    [[ "$-" == *v* ]]
}
```

## Module

[`runtime`](../runtime.md)
