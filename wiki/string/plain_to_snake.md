# `string::plain_to_snake`

plain (space-separated) → snake_case

## Usage

```bash
string::plain_to_snake ...
```

## Source

```bash
string::plain_to_snake() {
  local s="${1// /_}"
  echo "${s,,}"
}
```

## Module

[`string`](../string.md)
