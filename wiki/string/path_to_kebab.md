# `string::path_to_kebab`

path/case → kebab-case

## Usage

```bash
string::path_to_kebab ...
```

## Source

```bash
string::path_to_kebab() {
  local path="$1"
  path="${path//\\/-}"  # Replace backslashes
  path="${path//\//-}"  # Replace forward slashes
  echo "$path"
}
```

## Module

[`string`](../string.md)
