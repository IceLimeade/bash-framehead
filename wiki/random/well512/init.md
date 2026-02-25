# `random::well512::init`

==============================================================================

## Usage

```bash
random::well512::init ...
```

## Source

```bash
random::well512::init() {
    local seed="$1" val state
    state="$seed"
    local -a words=()
    for (( i=0; i<16; i++ )); do
        read -r val state <<< "$(random::splitmix64 $state)"
        words+=( "$(_random::mask32 $val)" )
    done
    echo "0 ${words[*]}"
}
```

## Module

[`random`](../random.md)
