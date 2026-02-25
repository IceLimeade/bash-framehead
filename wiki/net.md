# `net`

| Function | Description |
|----------|-------------|
| [`net::can_reach`](./net/can_reach.md) | Check if a specific host is reachable |
| [`net::dns::mx`](./net/dns/mx.md) | Get MX records for a domain |
| [`net::dns::ns`](./net/dns/ns.md) | Get nameservers for a domain |
| [`net::dns::propagation`](./net/dns/propagation.md) | Check DNS propagation — query multiple public resolvers |
| [`net::dns::records`](./net/dns/records.md) | Get all DNS records of a type |
| [`net::dns::txt`](./net/dns/txt.md) | Get TXT records (useful for SPF, DKIM etc.) |
| [`net::fetch`](./net/fetch.md) | Fetch URL contents — curl/wget with fallback |
| [`net::fetch::progress`](./net/fetch/progress.md) | Fetch with progress bar |
| [`net::fetch::retry`](./net/fetch/retry.md) | Fetch with retry on failure |
| [`net::gateway`](./net/gateway.md) | Get default gateway |
| [`net::hostname`](./net/hostname.md) | Get the system hostname |
| [`net::hostname::fqdn`](./net/hostname/fqdn.md) | Get the fully qualified domain name |
| [`net::http::headers`](./net/http/headers.md) | Get response headers |
| [`net::http::is_ok`](./net/http/is_ok.md) | Check if a URL returns 200 OK |
| [`net::http::status`](./net/http/status.md) | Check HTTP status code of a URL |
| [`net::interface::is_up`](./net/interface/is_up.md) | Check if an interface is up |
| [`net::interface::list`](./net/interface/list.md) | List all network interfaces |
| [`net::interface::speed`](./net/interface/speed.md) | Get interface speed in Mbps |
| [`net::interface::stat`](./net/interface/stat.md) | Get network interface statistics (rx/tx bytes) |
| [`net::interface::stat::rx`](./net/interface/stat/rx.md) | — |
| [`net::interface::stat::tx`](./net/interface/stat/tx.md) | — |
| [`net::ip::all`](./net/ip/all.md) | Get all local IP addresses (one per line) |
| [`net::ip::geo`](./net/ip/geo.md) | Get geolocation info for an IP (uses ip-api.com free tier) |
| [`net::ip::is_loopback`](./net/ip/is_loopback.md) | Check if IP is loopback |
| [`net::ip::is_private`](./net/ip/is_private.md) | Check if IP is in private range |
| [`net::ip::is_valid_v4`](./net/ip/is_valid_v4.md) | Check if a string is a valid IPv4 address |
| [`net::ip::is_valid_v6`](./net/ip/is_valid_v6.md) | Check if a string is a valid IPv6 address (basic check) |
| [`net::ip::local`](./net/ip/local.md) | Get local IP address (first non-loopback) |
| [`net::ip::public`](./net/ip/public.md) | Get public IP address |
| [`net::is_online`](./net/is_online.md) | Check if the system has a working internet connection |
| [`net::mac`](./net/mac.md) | Get MAC address of an interface |
| [`net::ping`](./net/ping.md) | Ping a host and return average round-trip time in ms |
| [`net::port::is_open`](./net/port/is_open.md) | Check if a TCP port is open on a host |
| [`net::port::scan`](./net/port/scan.md) | Scan common ports on a host, print open ones |
| [`net::port::wait`](./net/port/wait.md) | Wait until a port is open (useful for service readiness checks) |
| [`net::resolve`](./net/resolve.md) | Resolve hostname to IP |
| [`net::resolve::reverse`](./net/resolve/reverse.md) | Reverse DNS lookup — IP to hostname |
| [`net::whois`](./net/whois.md) | Basic whois lookup |
