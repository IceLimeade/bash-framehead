# `string::kebab_to_constant`

kebab-case → CONSTANT_CASE

## Usage

```bash
string::kebab_to_constant ...
```

## Source

```bash
string::kebab_to_constant() {
  local s="${1//-/_}"
  echo "${s^^}"
}
```

## Module

[`string`](../string.md)
