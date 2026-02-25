# `string::replace_all`

Replace all occurrences of search with replace

## Usage

```bash
string::replace_all ...
```

## Source

```bash
string::replace_all() {
  echo "${1//"$2"/"$3"}"
}
```

## Module

[`string`](../string.md)
