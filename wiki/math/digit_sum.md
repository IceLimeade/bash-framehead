# `math::digit_sum`

Sum of digits of an integer

## Usage

```bash
math::digit_sum ...
```

## Source

```bash
math::digit_sum() {
    local n="${1#-}" sum=0  # strip sign
    while (( n > 0 )); do
        (( sum += n % 10 ))
        (( n /= 10 ))
    done
    echo "$sum"
}
```

## Module

[`math`](../math.md)
