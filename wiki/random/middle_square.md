# `random::middle_square`

Returns: next value (4-digit middle square extract)

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
