# `string::before_last`

Return everything before the last occurrence of delimiter

## Usage

```bash
string::before_last ...
```

## Source

```bash
string::before_last() {
  echo "${1%"$2"*}"
}
```

## Module

[`string`](../string.md)
