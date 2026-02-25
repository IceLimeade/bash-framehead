# `string::remove_first`

Remove first occurrence of a substring

## Usage

```bash
string::remove_first ...
```

## Source

```bash
string::remove_first() {
  echo "${1/"$2"/}"
}
```

## Module

[`string`](../string.md)
