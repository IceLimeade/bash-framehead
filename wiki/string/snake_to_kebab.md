# `string::snake_to_kebab`

snake_case → kebab-case

## Usage

```bash
string::snake_to_kebab ...
```

## Source

```bash
string::snake_to_kebab() {
  echo "${1//_/-}"
}
```

## Module

[`string`](../string.md)
