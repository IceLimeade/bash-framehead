# `string::pascal_to_camel`

PascalCase → camelCase

## Usage

```bash
string::pascal_to_camel ...
```

## Source

```bash
string::pascal_to_camel() {
  local words
  words=$(_string::to_words "$1")
  string::plain_to_camel "$words"
}
```

## Module

[`string`](../string.md)
