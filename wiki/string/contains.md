# `string::contains`

Check if string contains substring

## Usage

```bash
string::contains ...
```

## Source

```bash
string::contains() {
  [[ "$1" == *"$2"* ]]
}
```

## Module

[`string`](../string.md)
