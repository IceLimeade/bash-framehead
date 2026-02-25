# `fs`

| Function | Description |
|----------|-------------|
| [`fs::append`](./fs/append.md) | Append content to file |
| [`fs::appendln`](./fs/appendln.md) | Append with newline |
| [`fs::char_count`](./fs/char_count.md) | Count characters in a file |
| [`fs::checksum::md5`](./fs/checksum/md5.md) | — |
| [`fs::checksum::sha1`](./fs/checksum/sha1.md) | — |
| [`fs::checksum::sha256`](./fs/checksum/sha256.md) | — |
| [`fs::contains`](./fs/contains.md) | Check if file contains a string |
| [`fs::copy`](./fs/copy.md) | Copy file or directory |
| [`fs::created`](./fs/created.md) | Creation time (unix timestamp) — not available on all filesystems |
| [`fs::delete`](./fs/delete.md) | Delete file or directory |
| [`fs::dir::count`](./fs/dir/count.md) | Count items in directory |
| [`fs::dir::is_empty`](./fs/dir/is_empty.md) | Check if directory is empty |
| [`fs::dir::size`](./fs/dir/size.md) | Get total size of directory |
| [`fs::dir::size::human`](./fs/dir/size/human.md) | Get total size of directory, human readable |
| [`fs::exists`](./fs/exists.md) | — |
| [`fs::find`](./fs/find.md) | Recursive find by name pattern |
| [`fs::find::larger_than`](./fs/find/larger_than.md) | Find files larger than n bytes |
| [`fs::find::recent`](./fs/find/recent.md) | Find files modified within n minutes |
| [`fs::find::smaller_than`](./fs/find/smaller_than.md) | Find files smaller than n bytes |
| [`fs::find::type`](./fs/find/type.md) | Recursive find by type (f=file, d=dir, l=symlink) |
| [`fs::hardlink`](./fs/hardlink.md) | Create a hard link |
| [`fs::inode`](./fs/inode.md) | Inode number |
| [`fs::is_dir`](./fs/is_dir.md) | — |
| [`fs::is_empty`](./fs/is_empty.md) | — |
| [`fs::is_executable`](./fs/is_executable.md) | — |
| [`fs::is_file`](./fs/is_file.md) | — |
| [`fs::is_identical`](./fs/is_identical.md) | Check if two files are identical (by content) |
| [`fs::is_readable`](./fs/is_readable.md) | — |
| [`fs::is_same`](./fs/is_same.md) | Check if two paths resolve to the same file (inode comparison) |
| [`fs::is_symlink`](./fs/is_symlink.md) | — |
| [`fs::is_writable`](./fs/is_writable.md) | — |
| [`fs::line`](./fs/line.md) | Read a specific line number (1-indexed) |
| [`fs::line_count`](./fs/line_count.md) | Count lines in a file |
| [`fs::lines`](./fs/lines.md) | Read a range of lines |
| [`fs::link_count`](./fs/link_count.md) | Number of hard links |
| [`fs::ls`](./fs/ls.md) | List directory contents (one per line) |
| [`fs::ls::all`](./fs/ls/all.md) | List with hidden files |
| [`fs::ls::dirs`](./fs/ls/dirs.md) | List only directories |
| [`fs::ls::files`](./fs/ls/files.md) | List only files |
| [`fs::matches`](./fs/matches.md) | Check if file matches a regex |
| [`fs::mime_type`](./fs/mime_type.md) | MIME type |
| [`fs::mkdir`](./fs/mkdir.md) | Create directory (including parents) |
| [`fs::modified`](./fs/modified.md) | Last modified time (unix timestamp) |
| [`fs::modified::human`](./fs/modified/human.md) | Last modified time (human readable) |
| [`fs::move`](./fs/move.md) | Move/rename |
| [`fs::owner`](./fs/owner.md) | Owner username |
| [`fs::owner::group`](./fs/owner/group.md) | Owner group |
| [`fs::path::absolute`](./fs/path/absolute.md) | Get absolute path (resolves . and .. without requiring the path to exist) |
| [`fs::path::basename`](./fs/path/basename.md) | Get filename from path (like basename) |
| [`fs::path::dirname`](./fs/path/dirname.md) | Get directory from path (like dirname) |
| [`fs::path::extension`](./fs/path/extension.md) | Get file extension (without dot) |
| [`fs::path::extensions`](./fs/path/extensions.md) | Get all extensions for multi-part extensions |
| [`fs::path::is_absolute`](./fs/path/is_absolute.md) | Check if a path is absolute |
| [`fs::path::is_relative`](./fs/path/is_relative.md) | Check if a path is relative |
| [`fs::path::join`](./fs/path/join.md) | Join path components |
| [`fs::path::relative`](./fs/path/relative.md) | Get path relative to a base |
| [`fs::path::stem`](./fs/path/stem.md) | Strip extension from filename |
| [`fs::permissions`](./fs/permissions.md) | Octal permissions |
| [`fs::permissions::symbolic`](./fs/permissions/symbolic.md) | Symbolic permissions (e.g. -rwxr-xr-x) |
| [`fs::prepend`](./fs/prepend.md) | Prepend content to file |
| [`fs::read`](./fs/read.md) | Read entire file contents |
| [`fs::rename`](./fs/rename.md) | Rename just the filename, keeping directory |
| [`fs::replace`](./fs/replace.md) | Replace string in file (in-place) |
| [`fs::size`](./fs/size.md) | File size in bytes |
| [`fs::size::human`](./fs/size/human.md) | Human-readable file size |
| [`fs::symlink`](./fs/symlink.md) | Create a symlink |
| [`fs::symlink::resolve`](./fs/symlink/resolve.md) | Resolved symlink target (follows chain) |
| [`fs::symlink::target`](./fs/symlink/target.md) | Symlink target |
| [`fs::temp::dir`](./fs/temp/dir.md) | Create a temporary directory, print its path |
| [`fs::temp::dir::auto`](./fs/temp/dir/auto.md) | Create a temp dir and register cleanup on EXIT |
| [`fs::temp::file`](./fs/temp/file.md) | Create a temporary file, print its path |
| [`fs::temp::file::auto`](./fs/temp/file/auto.md) | Create a temp file and register cleanup on EXIT |
| [`fs::touch`](./fs/touch.md) | Touch a file (create or update timestamp) |
| [`fs::trash`](./fs/trash.md) | Safely delete to a trash dir instead of permanent delete |
| [`fs::watch`](./fs/watch.md) | Watch a file for changes, run callback on change |
| [`fs::watch::timeout`](./fs/watch/timeout.md) | Watch with a timeout (seconds) |
| [`fs::word_count`](./fs/word_count.md) | Count words in a file |
| [`fs::write`](./fs/write.md) | Write content to file (overwrites) |
| [`fs::writeln`](./fs/writeln.md) | Write with newline |
