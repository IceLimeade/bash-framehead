# `math::lerp`

==============================================================================

## Usage

```bash
math::lerp ...
```

## Source

```bash
math::lerp() {
    local a="$1" b="$2" t="$3" scale="${4:-$MATH_SCALE}"
    math::bc "$a + ($b - $a) * $(math::clampf "$t" 0 1)" "$scale"
}
```

## Module

[`math`](../math.md)
