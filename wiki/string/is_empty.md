# `string::is_empty`

Check if string is empty

## Usage

```bash
string::is_empty ...
```

## Source

```bash
string::is_empty() {
  [[ -z "$1" ]]
}
```

## Module

[`string`](../string.md)
