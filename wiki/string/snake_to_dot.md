# `string::snake_to_dot`

snake_case → dot.case

## Usage

```bash
string::snake_to_dot ...
```

## Source

```bash
string::snake_to_dot() {
  echo "${1//_/.}"
}
```

## Module

[`string`](../string.md)
