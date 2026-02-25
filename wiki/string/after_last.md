# `string::after_last`

Return everything after the last occurrence of delimiter

## Usage

```bash
string::after_last ...
```

## Source

```bash
string::after_last() {
  echo "${1##*"$2"}"
}
```

## Module

[`string`](../string.md)
