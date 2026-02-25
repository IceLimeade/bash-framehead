# `hardware::partition::usedSpaceMB`

_No description available._

## Usage

```bash
hardware::partition::usedSpaceMB ...
```

## Source

```bash
hardware::partition::usedSpaceMB() {
    local device="${1:-/}"
    df -BM "$device" 2>/dev/null | awk 'NR==2 { gsub(/M/,"",$3); print $3 }'
}
```

## Module

[`hardware`](../hardware.md)
