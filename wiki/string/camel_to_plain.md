# `string::camel_to_plain`

camelCase → plain

## Usage

```bash
string::camel_to_plain ...
```

## Source

```bash
string::camel_to_plain() {
  _string::to_words "$1"
}
```

## Module

[`string`](../string.md)
