# `string::before`

Return everything before the first occurrence of delimiter

## Usage

```bash
string::before ...
```

## Source

```bash
string::before() {
  echo "${1%%"$2"*}"
}
```

## Module

[`string`](../string.md)
