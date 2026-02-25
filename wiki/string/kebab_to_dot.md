# `string::kebab_to_dot`

kebab-case → dot.case

## Usage

```bash
string::kebab_to_dot ...
```

## Source

```bash
string::kebab_to_dot() {
  echo "${1//-/.}"
}
```

## Module

[`string`](../string.md)
