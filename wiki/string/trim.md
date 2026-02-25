# `string::trim`

Trim both leading and trailing whitespace

## Usage

```bash
string::trim ...
```

## Source

```bash
string::trim() {
  local s="$1"
  s="${s#"${s%%[![:space:]]*}"}"
  s="${s%"${s##*[![:space:]]}"}"
  echo "$s"
}
```

## Module

[`string`](../string.md)
