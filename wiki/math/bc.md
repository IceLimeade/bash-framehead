# `math::bc`

_No description available._

## Usage

```bash
math::bc ...
```

## Source

```bash
math::bc() {
    local expr="$1" scale="${2:-$MATH_SCALE}"
    if ! math::has_bc; then
        echo "math::bc: requires bc (GNU coreutils)" >&2
        return 1
    fi
    echo "scale=${scale}; ${expr}" | bc -l
}
```

## Module

[`math`](../math.md)
