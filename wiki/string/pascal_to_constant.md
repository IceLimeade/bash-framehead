# `string::pascal_to_constant`

PascalCase → CONSTANT_CASE

## Usage

```bash
string::pascal_to_constant ...
```

## Source

```bash
string::pascal_to_constant() {
  string::camel_to_constant "$1"
}
```

## Module

[`string`](../string.md)
