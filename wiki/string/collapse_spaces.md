# `string::collapse_spaces`

Collapse multiple consecutive spaces into one

## Usage

```bash
string::collapse_spaces ...
```

## Source

```bash
string::collapse_spaces() {
  echo "$1" | tr -s ' '
}
```

## Module

[`string`](../string.md)
