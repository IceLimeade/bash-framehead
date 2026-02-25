# `string::lower::legacy`

Convert to lowercase (Bash 3 compatible)

## Usage

```bash
string::lower::legacy ...
```

## Source

```bash
string::lower::legacy() {
  echo "$1" | tr '[:upper:]' '[:lower:]'
}
```

## Module

[`string`](../string.md)
