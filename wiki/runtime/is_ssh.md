# `runtime::is_ssh`

_No description available._

## Usage

```bash
runtime::is_ssh ...
```

## Source

```bash
runtime::is_ssh() {
  [[ -n "$SSH_CLIENT" ]] ||
  [[ -n "$SSH_TTY" ]] ||
  [[ -n "$SSH_CONNECTION" ]]
}
```

## Module

[`runtime`](../runtime.md)
