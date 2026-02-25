# `string::camel_to_kebab`

camelCase → kebab-case

## Usage

```bash
string::camel_to_kebab ...
```

## Source

```bash
string::camel_to_kebab() {
  local words
  words=$(_string::to_words "$1")
  echo "${words// /-}"
}
```

## Module

[`string`](../string.md)
