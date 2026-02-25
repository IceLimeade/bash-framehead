# `string::pascal_to_snake`

PascalCase → snake_case

## Usage

```bash
string::pascal_to_snake ...
```

## Source

```bash
string::pascal_to_snake() {
  string::camel_to_snake "$1"
}
```

## Module

[`string`](../string.md)
