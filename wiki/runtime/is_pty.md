# `runtime::is_pty`

_No description available._

## Usage

```bash
runtime::is_pty ...
```

## Source

```bash
runtime::is_pty() {
  # Check if we're in a pseudo-terminal
  [[ "$(tty)" =~ ^/dev/pts/[0-9]+ ]]
}
```

## Module

[`runtime`](../runtime.md)
