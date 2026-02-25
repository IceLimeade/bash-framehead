# `math::choose`

==============================================================================

## Usage

```bash
math::choose ...
```

## Source

```bash
math::choose() {
    local n="$1" k="$2"
    (( k > n )) && echo 0 && return
    (( k == 0 || k == n )) && echo 1 && return
    # Use the smaller of k and n-k for efficiency
    (( k > n - k )) && k=$(( n - k ))
    local result=1 i
    for (( i=0; i<k; i++ )); do
        result=$(( result * (n - i) / (i + 1) ))
    done
    echo "$result"
}
```

## Module

[`math`](../math.md)
