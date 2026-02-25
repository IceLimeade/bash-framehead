# `string::trim_left`

Trim leading whitespace

## Usage

```bash
string::trim_left ...
```

## Source

```bash
string::trim_left() {
  local s="$1"
  s="${s#"${s%%[![:space:]]*}"}"
  echo "$s"
}
```

## Module

[`string`](../string.md)
