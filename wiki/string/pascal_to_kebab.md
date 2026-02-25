# `string::pascal_to_kebab`

PascalCase → kebab-case

## Usage

```bash
string::pascal_to_kebab ...
```

## Source

```bash
string::pascal_to_kebab() {
  string::camel_to_kebab "$1"
}
```

## Module

[`string`](../string.md)
