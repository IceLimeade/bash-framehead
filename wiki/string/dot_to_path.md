# `string::dot_to_path`

dot.case → path/case

## Usage

```bash
string::dot_to_path ...
```

## Source

```bash
string::dot_to_path() {
  echo "${1//.//}"
}
```

## Module

[`string`](../string.md)
