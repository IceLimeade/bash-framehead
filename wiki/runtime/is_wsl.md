# `runtime::is_wsl`

_No description available._

## Usage

```bash
runtime::is_wsl ...
```

## Source

```bash
runtime::is_wsl() {
  [[ -f /proc/version ]] && grep -qi "microsoft" /proc/version
}
```

## Module

[`runtime`](../runtime.md)
