# `string::path_to_plain`

path/case → plain

## Usage

```bash
string::path_to_plain ...
```

## Source

```bash
string::path_to_plain() {
  echo "${1//\// }"
}
```

## Module

[`string`](../string.md)
