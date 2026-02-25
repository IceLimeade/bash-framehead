# `fs::find::recent`

Find files modified within n minutes

## Usage

```bash
fs::find::recent ...
```

## Source

```bash
fs::find::recent() {
    find "${1:-.}" -type f -mmin "-${2:-60}" 2>/dev/null
}
```

## Module

[`fs`](../fs.md)
