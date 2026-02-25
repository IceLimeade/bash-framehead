# `string::plain_to_pascal`

plain → PascalCase

## Usage

```bash
string::plain_to_pascal ...
```

## Source

```bash
string::plain_to_pascal() {
  local result=""
  for word in $1; do result+="${word^}"; done
  echo "$result"
}
```

## Module

[`string`](../string.md)
