# `string::constant_to_plain`

CONSTANT_CASE → plain

## Usage

```bash
string::constant_to_plain ...
```

## Source

```bash
string::constant_to_plain() {
  local s="${1//_/ }"
  echo "${s,,}"
}
```

## Module

[`string`](../string.md)
