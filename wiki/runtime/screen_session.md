# `runtime::screen_session`

_No description available._

## Usage

```bash
runtime::screen_session ...
```

## Source

```bash
runtime::screen_session() {
  echo "${STY:-${TMUX:-none}}"
}
```

## Module

[`runtime`](../runtime.md)
