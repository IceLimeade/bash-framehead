# `fs::temp::file`

==============================================================================

## Usage

```bash
fs::temp::file ...
```

## Source

```bash
fs::temp::file() {
    local prefix="${1:-fsbshf}"
    mktemp "/tmp/${prefix}.XXXXXX"
}
```

## Module

[`fs`](../fs.md)
