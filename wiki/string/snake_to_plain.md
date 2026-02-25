# `string::snake_to_plain`

snake_case → plain

## Usage

```bash
string::snake_to_plain ...
```

## Source

```bash
string::snake_to_plain() {
  echo "${1//_/ }"
}
```

## Module

[`string`](../string.md)
