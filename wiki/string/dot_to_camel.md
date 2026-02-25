# `string::dot_to_camel`

dot.case → camelCase

## Usage

```bash
string::dot_to_camel ...
```

## Source

```bash
string::dot_to_camel() {
  string::plain_to_camel "${1//./ }"
}
```

## Module

[`string`](../string.md)
