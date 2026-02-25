# `string::constant_to_path`

CONSTANT_CASE → path/case

## Usage

```bash
string::constant_to_path ...
```

## Source

```bash
string::constant_to_path() {
  local s="${1//_//}"
  echo "${s,,}"
}
```

## Module

[`string`](../string.md)
