# `string::matches`

Check if string matches a regex

## Usage

```bash
string::matches ...
```

## Source

```bash
string::matches() {
  [[ "$1" =~ $2 ]]
}
```

## Module

[`string`](../string.md)
