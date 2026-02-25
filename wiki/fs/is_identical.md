# `fs::is_identical`

Check if two files are identical (by content)

## Usage

```bash
fs::is_identical ...
```

## Source

```bash
fs::is_identical() {
    local sum1 sum2
    sum1=$(fs::checksum::sha256 "$1")
    sum2=$(fs::checksum::sha256 "$2")
    [[ "$sum1" == "$sum2" ]]
}
```

## Module

[`fs`](../fs.md)
