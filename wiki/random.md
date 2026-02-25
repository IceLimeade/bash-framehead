# `random`

| Function | Description |
|----------|-------------|
| [`random::isaac`](./random/isaac.md) | Returns: "result new_a new_b new_c s0..s7" |
| [`random::isaac::init`](./random/isaac/init.md) | Initialise simplified ISAAC state |
| [`random::lcg`](./random/lcg.md) | Returns: next state (also the output value) |
| [`random::lcg::glibc`](./random/lcg/glibc.md) | Glibc rand() parameters |
| [`random::middle_square`](./random/middle_square.md) | Returns: next value (4-digit middle square extract) |
| [`random::mulberry32`](./random/mulberry32.md) | Returns: "result new_state" |
| [`random::native`](./random/native.md) | — |
| [`random::native::range`](./random/native/range.md) | Returns a value in [min, max] inclusive |
| [`random::pcg32`](./random/pcg32.md) | Returns: "result new_state" |
| [`random::pcg32::fast`](./random/pcg32/fast.md) | PCG32 fast — hardcoded increment, same quality |
| [`random::seed32`](./random/seed32.md) | Seed from /dev/urandom — returns a 32-bit unsigned integer |
| [`random::seed64`](./random/seed64.md) | Seed from /dev/urandom — returns a 64-bit value (may be negative in bash) |
| [`random::splitmix64`](./random/splitmix64.md) | Returns: "result new_state" |
| [`random::splitmix64::seed_xoshiro`](./random/splitmix64/seed_xoshiro.md) | Expand a single 64-bit seed into four words for xoshiro256 initialisation |
| [`random::well512`](./random/well512.md) | Returns: "result new_index s0 ... s15" |
| [`random::well512::init`](./random/well512/init.md) | Initialise WELL512 state from a single seed via splitmix64 |
| [`random::wyrand`](./random/wyrand.md) | Returns: "result new_state" |
| [`random::xorshift32`](./random/xorshift32.md) | Returns: next state (also the output value) |
| [`random::xorshift64`](./random/xorshift64.md) | Returns: next state (also the output value) |
| [`random::xorshiftr128plus`](./random/xorshiftr128plus.md) | Returns: "result s0_new s1_new" |
| [`random::xoshiro256p`](./random/xoshiro256p.md) | Xoshiro256+ — faster output, slightly weaker low bits |
| [`random::xoshiro256ss`](./random/xoshiro256ss.md) | Returns: "result s0_new s1_new s2_new s3_new" |
