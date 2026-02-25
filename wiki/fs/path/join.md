# `fs::path::join`

fs.sh — bash-frameheader filesystem lib

## Usage

```bash
fs::path::join ...
```

## Source

```bash
fs::path::join() {
    local result="$1"; shift
    for part in "$@"; do
        part="${part#/}"   # strip leading slash from each part
        result="${result%/}/$part"
    done
    echo "$result"
}
```

## Module

[`fs`](../fs.md)
