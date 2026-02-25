# `string::upper::legacy`

Convert to uppercase (Bash 3 compatible)

## Usage

```bash
string::upper::legacy ...
```

## Source

```bash
string::upper::legacy() {
  echo "$1" | tr '[:lower:]' '[:upper:]'
}
```

## Module

[`string`](../string.md)
