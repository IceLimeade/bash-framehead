# `string::snake_to_constant`

snake_case → CONSTANT_CASE

## Usage

```bash
string::snake_to_constant ...
```

## Source

```bash
string::snake_to_constant() {
  echo "${1^^}"
}
```

## Module

[`string`](../string.md)
