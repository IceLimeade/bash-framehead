# `string::plain_to_path`

plain → path/case

## Usage

```bash
string::plain_to_path ...
```

## Source

```bash
string::plain_to_path() {
  local s="${1// //}"
  echo "${s,,}"
}
```

## Module

[`string`](../string.md)
