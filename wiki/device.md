# `device`

| Function | Description |
|----------|-------------|
| [`device::exists`](./device/exists.md) | Check if device exists (block or character) |
| [`device::filesystem`](./device/filesystem.md) | Returns the filesystem on a block device (if mounted or detectable) |
| [`device::has_processes`](./device/has_processes.md) | Check if device has open file handles via lsof |
| [`device::is_block`](./device/is_block.md) | Check if path is a block device |
| [`device::is_device`](./device/is_device.md) | Check if path is a character device |
| [`device::is_loop`](./device/is_loop.md) | Check if device is a loop device |
| [`device::is_mounted`](./device/is_mounted.md) | Check if a block device is mounted |
| [`device::is_occupied`](./device/is_occupied.md) | Check if device is occupied via /proc (no lsof needed) |
| [`device::is_ram`](./device/is_ram.md) | Check if device is a RAM disk |
| [`device::is_readable`](./device/is_readable.md) | Check if device is readable |
| [`device::is_virtual`](./device/is_virtual.md) | Check if device is a virtual/pseudo device |
| [`device::is_writeable`](./device/is_writeable.md) | Check if device is writable |
| [`device::list::block`](./device/list/block.md) | List all block devices |
| [`device::list::char`](./device/list/char.md) | List all character devices |
| [`device::list::loop`](./device/list/loop.md) | List all loop devices |
| [`device::list::mounted`](./device/list/mounted.md) | List mounted devices with their mount points |
| [`device::list::tty`](./device/list/tty.md) | List all TTY devices |
| [`device::mount_point`](./device/mount_point.md) | Returns the mount point of a block device (empty if not mounted) |
| [`device::null_ok`](./device/null_ok.md) | Check if /dev/null is functional (sanity check) |
| [`device::number`](./device/number.md) | Returns the major:minor device number |
| [`device::random`](./device/random.md) | Read n random bytes from /dev/urandom |
| [`device::size_bytes`](./device/size_bytes.md) | Returns the size of a block device in bytes |
| [`device::size_mb`](./device/size_mb.md) | Returns the size of a block device in MB |
| [`device::type`](./device/type.md) | Returns the type of a device as a string |
| [`device::zero`](./device/zero.md) | Write n bytes of zeros to a device or file (wraps /dev/zero) |
