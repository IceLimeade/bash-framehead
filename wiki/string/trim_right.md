# `string::trim_right`

Trim trailing whitespace

## Usage

```bash
string::trim_right ...
```

## Source

```bash
string::trim_right() {
  local s="$1"
  s="${s%"${s##*[![:space:]]}"}"
  echo "$s"
}
```

## Module

[`string`](../string.md)
