# `timedate::date::tomorrow`

Get tomorrow's date

## Usage

```bash
timedate::date::tomorrow ...
```

## Source

```bash
timedate::date::tomorrow() {
    timedate::date::add_days "$(timedate::date::today)" 1
}
```

## Module

[`timedate`](../timedate.md)
