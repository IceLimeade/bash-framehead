# `string::plain_to_kebab`

plain → kebab-case

## Usage

```bash
string::plain_to_kebab ...
```

## Source

```bash
string::plain_to_kebab() {
  local s="${1// /-}"
  echo "${s,,}"
}
```

## Module

[`string`](../string.md)
