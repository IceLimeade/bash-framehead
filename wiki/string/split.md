# `string::split`

==============================================================================

## Usage

```bash
string::split ...
```

## Source

```bash
string::split() {
  local s="$1" delim="$2"
  local IFS="$delim"
  # Remove IFS from positional parameters to enable word splitting
  set -- $s
  printf '%s\n' "$@"
}
```

## Module

[`string`](../string.md)
