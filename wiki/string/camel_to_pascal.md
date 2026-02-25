# `string::camel_to_pascal`

camelCase → PascalCase

## Usage

```bash
string::camel_to_pascal ...
```

## Source

```bash
string::camel_to_pascal() {
  string::plain_to_pascal "$(_string::to_words "$1")"
}
```

## Module

[`string`](../string.md)
