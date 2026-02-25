# `string::snake_to_path`

snake_case → path/case

## Usage

```bash
string::snake_to_path ...
```

## Source

```bash
string::snake_to_path() {
  echo "${1//_//}"
}
```

## Module

[`string`](../string.md)
