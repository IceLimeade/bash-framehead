# `runtime::ssh_client`

_No description available._

## Usage

```bash
runtime::ssh_client ...
```

## Source

```bash
runtime::ssh_client() {
  echo "${SSH_CLIENT%% *}"  # First part is client IP
}
```

## Module

[`runtime`](../runtime.md)
