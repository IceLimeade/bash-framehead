# `runtime::is_terminal`

_No description available._

## Usage

```bash
runtime::is_terminal ...
```

## Source

```bash
runtime::is_terminal() {
  # Thorough check for all standard file descriptors (stdin, stdout, stderr)
  [[ -t 0 && -t 1 && -t 2 ]]
}
```

## Module

[`runtime`](../runtime.md)
