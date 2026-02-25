# `string::dot_to_snake`

dot.case → snake_case

## Usage

```bash
string::dot_to_snake ...
```

## Source

```bash
string::dot_to_snake() {
  echo "${1//./_}"
}
```

## Module

[`string`](../string.md)
