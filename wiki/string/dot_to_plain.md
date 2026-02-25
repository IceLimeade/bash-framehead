# `string::dot_to_plain`

dot.case → plain

## Usage

```bash
string::dot_to_plain ...
```

## Source

```bash
string::dot_to_plain() {
  echo "${1//./ }"
}
```

## Module

[`string`](../string.md)
