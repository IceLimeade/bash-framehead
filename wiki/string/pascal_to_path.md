# `string::pascal_to_path`

PascalCase → path/case

## Usage

```bash
string::pascal_to_path ...
```

## Source

```bash
string::pascal_to_path() {
  string::camel_to_path "$1"
}
```

## Module

[`string`](../string.md)
