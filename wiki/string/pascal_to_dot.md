# `string::pascal_to_dot`

PascalCase → dot.case

## Usage

```bash
string::pascal_to_dot ...
```

## Source

```bash
string::pascal_to_dot() {
  string::camel_to_dot "$1"
}
```

## Module

[`string`](../string.md)
