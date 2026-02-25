# `runtime::is_tmux`

_No description available._

## Usage

```bash
runtime::is_tmux ...
```

## Source

```bash
runtime::is_tmux() {
  [[ -n "$TMUX" ]]
}
```

## Module

[`runtime`](../runtime.md)
