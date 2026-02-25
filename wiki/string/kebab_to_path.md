# `string::kebab_to_path`

kebab-case → path/case

## Usage

```bash
string::kebab_to_path ...
```

## Source

```bash
string::kebab_to_path() {
  echo "${1//-//}"
}
```

## Module

[`string`](../string.md)
