# `string::pascal_to_plain`

PascalCase → plain

## Usage

```bash
string::pascal_to_plain ...
```

## Source

```bash
string::pascal_to_plain() {
  _string::to_words "$1"
}
```

## Module

[`string`](../string.md)
