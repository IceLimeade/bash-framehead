# `string::path_to_pascal`

path/case → PascalCase

## Usage

```bash
string::path_to_pascal ...
```

## Source

```bash
string::path_to_pascal() {
  string::plain_to_pascal "${1//\// }"
}
```

## Module

[`string`](../string.md)
