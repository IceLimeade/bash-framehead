# `string::kebab_to_pascal`

kebab-case → PascalCase

## Usage

```bash
string::kebab_to_pascal ...
```

## Source

```bash
string::kebab_to_pascal() {
  string::plain_to_pascal "${1//-/ }"
}
```

## Module

[`string`](../string.md)
