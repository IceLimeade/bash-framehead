# `fs::watch`

==============================================================================

## Usage

```bash
fs::watch ...
```

## Source

```bash
fs::watch() {
    local path="$1" callback="$2" interval="${3:-1}"
    local last_modified
    last_modified=$(fs::modified "$path")

    while true; do
        sleep "$interval"
        local current
        current=$(fs::modified "$path")
        if [[ "$current" != "$last_modified" ]]; then
            last_modified="$current"
            "$callback" "$path"
        fi
    done
}
```

## Module

[`fs`](../fs.md)
