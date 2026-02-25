# `hash`

| Function | Description |
|----------|-------------|
| [`hash::adler32`](./hash/adler32.md) | Adler-32 — fast checksum used in zlib/PNG |
| [`hash::blake2b`](./hash/blake2b.md) | BLAKE2b hash of a string |
| [`hash::combine`](./hash/combine.md) | Hash multiple values into one — useful for cache keys from multiple inputs |
| [`hash::crc32`](./hash/crc32.md) | CRC32 — delegates to system tools, pure bash fallback is too slow for real use |
| [`hash::djb2`](./hash/djb2.md) | DJB2 — Daniel J. Bernstein's hash, classic and fast |
| [`hash::djb2a`](./hash/djb2a.md) | DJB2a (xor variant) — slightly better distribution than djb2 |
| [`hash::equal`](./hash/equal.md) | Check if two strings have the same hash (constant-time safe via hash comparison) |
| [`hash::fnv1a32`](./hash/fnv1a32.md) | FNV-1a 32-bit — Fowler-Noll-Vo, excellent avalanche, widely used |
| [`hash::fnv1a64`](./hash/fnv1a64.md) | FNV-1a 64-bit — larger state, better for longer strings |
| [`hash::hmac::md5`](./hash/hmac/md5.md) | HMAC-MD5 |
| [`hash::hmac::sha256`](./hash/hmac/sha256.md) | HMAC-SHA256 |
| [`hash::hmac::sha512`](./hash/hmac/sha512.md) | HMAC-SHA512 |
| [`hash::md5`](./hash/md5.md) | MD5 hash of a string |
| [`hash::murmur2`](./hash/murmur2.md) | MurmurHash2 — pure bash, good distribution, faster than cryptographic hashes |
| [`hash::sdbm`](./hash/sdbm.md) | SDBM hash — used in the SDBM database library |
| [`hash::sha1`](./hash/sha1.md) | SHA1 hash of a string |
| [`hash::sha256`](./hash/sha256.md) | SHA256 hash of a string |
| [`hash::sha3_256`](./hash/sha3_256.md) | SHA3-256 hash of a string |
| [`hash::sha512`](./hash/sha512.md) | SHA512 hash of a string |
| [`hash::short`](./hash/short.md) | Generate a short hash — first n chars of sha256 |
| [`hash::slot`](./hash/slot.md) | Consistent hashing — map a value to a bucket (0 to n-1) |
| [`hash::uuid5`](./hash/uuid5.md) | Generate a hash-based UUID v5 (name-based, SHA1) |
| [`hash::verify`](./hash/verify.md) | Verify a string against a known hash |
