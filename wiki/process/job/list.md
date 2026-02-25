# `process::job::list`

List current shell's background jobs

## Usage

```bash
process::job::list ...
```

## Source

```bash
process::job::list() {
    jobs -l
}
```

## Module

[`process`](../process.md)
