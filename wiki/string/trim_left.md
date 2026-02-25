# `string::trim_left`

==============================================================================

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
