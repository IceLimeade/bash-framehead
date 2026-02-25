# `string::title`

Convert to title case (capitalise first letter of each word)

## Usage

```bash
string::title ...
```

## Source

```bash
string::title() {
  echo "$1" | awk '{for(i=1;i<=NF;i++) $i=toupper(substr($i,1,1)) tolower(substr($i,2)); print}'
}
```

## Module

[`string`](../string.md)
