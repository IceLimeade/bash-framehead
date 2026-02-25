# `string::remove`

Remove all occurrences of a substring

## Usage

```bash
string::remove ...
```

## Source

```bash
string::remove() {
  echo "${1//"$2"/}"
}
```

## Module

[`string`](../string.md)
