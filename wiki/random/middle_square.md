# `random::middle_square`

==============================================================================

## Usage

```bash
random::middle_square ...
```

## Source

```bash
random::middle_square() {
    local x="$1"
    local squared=$(( x * x ))
    echo $(( (squared / 100) % 10000 ))
}
```

## Module

[`random`](../random.md)
