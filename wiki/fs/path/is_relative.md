# `fs::path::is_relative`

Check if a path is relative

## Usage

```bash
fs::path::is_relative ...
```

## Source

```bash
fs::path::is_relative() {
    [[ "$1" != /* ]]
}
```

## Module

[`fs`](../fs.md)
