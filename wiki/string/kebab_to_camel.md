# `string::kebab_to_camel`

kebab-case → camelCase

## Usage

```bash
string::kebab_to_camel ...
```

## Source

```bash
string::kebab_to_camel() {
  string::plain_to_camel "${1//-/ }"
}
```

## Module

[`string`](../string.md)
