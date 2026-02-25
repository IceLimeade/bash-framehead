# `terminal::echo::on`

Re-enable terminal echo

## Usage

```bash
terminal::echo::on ...
```

## Source

```bash
terminal::echo::on() {
    stty echo 2>/dev/null
}
```

## Module

[`terminal`](../terminal.md)
