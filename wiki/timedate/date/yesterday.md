# `timedate::date::yesterday`

Get yesterday's date

## Usage

```bash
timedate::date::yesterday ...
```

## Source

```bash
timedate::date::yesterday() {
    timedate::date::add_days "$(timedate::date::today)" -1
}
```

## Module

[`timedate`](../timedate.md)
