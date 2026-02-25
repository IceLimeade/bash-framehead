# `terminal`

| Function | Description |
|----------|-------------|
| [`terminal::bell`](./terminal/bell.md) | Ring the terminal bell |
| [`terminal::clear`](./terminal/clear.md) | Clear entire screen |
| [`terminal::clear::line`](./terminal/clear/line.md) | Clear current line |
| [`terminal::clear::line_end`](./terminal/clear/line_end.md) | Clear from cursor to end of line |
| [`terminal::clear::line_start`](./terminal/clear/line_start.md) | Clear from cursor to start of line |
| [`terminal::clear::to_end`](./terminal/clear/to_end.md) | Clear from cursor to end of screen |
| [`terminal::clear::to_start`](./terminal/clear/to_start.md) | Clear from cursor to beginning of screen |
| [`terminal::confirm`](./terminal/confirm.md) | Prompt user for y/n, returns 0 for yes, 1 for no |
| [`terminal::confirm::default`](./terminal/confirm/default.md) | Prompt with a default choice shown |
| [`terminal::cursor::col`](./terminal/cursor/col.md) | Move cursor to column n on current line |
| [`terminal::cursor::down`](./terminal/cursor/down.md) | Move cursor down n rows |
| [`terminal::cursor::hide`](./terminal/cursor/hide.md) | — |
| [`terminal::cursor::home`](./terminal/cursor/home.md) | Move cursor to top-left (home) |
| [`terminal::cursor::left`](./terminal/cursor/left.md) | Move cursor left n cols |
| [`terminal::cursor::move`](./terminal/cursor/move.md) | Move cursor to row, col (1-indexed) |
| [`terminal::cursor::next_line`](./terminal/cursor/next_line.md) | Move cursor to start of line n lines down |
| [`terminal::cursor::prev_line`](./terminal/cursor/prev_line.md) | Move cursor to start of line n lines up |
| [`terminal::cursor::restore`](./terminal/cursor/restore.md) | Restore cursor to saved position |
| [`terminal::cursor::right`](./terminal/cursor/right.md) | Move cursor right n cols |
| [`terminal::cursor::save`](./terminal/cursor/save.md) | Save cursor position |
| [`terminal::cursor::show`](./terminal/cursor/show.md) | — |
| [`terminal::cursor::toggle`](./terminal/cursor/toggle.md) | — |
| [`terminal::cursor::up`](./terminal/cursor/up.md) | Move cursor up n rows |
| [`terminal::echo::off`](./terminal/echo/off.md) | Disable terminal echo (e.g. for password input) |
| [`terminal::echo::on`](./terminal/echo/on.md) | Re-enable terminal echo |
| [`terminal::has_256colour`](./terminal/has_256colour.md) | Check if terminal supports 256 colours |
| [`terminal::has_colour`](./terminal/has_colour.md) | Check if terminal supports colours |
| [`terminal::has_truecolour`](./terminal/has_truecolour.md) | Check if terminal supports true colour |
| [`terminal::height`](./terminal/height.md) | Get terminal height in rows |
| [`terminal::is_tty`](./terminal/is_tty.md) | Check if stdout is a terminal |
| [`terminal::is_tty::stderr`](./terminal/is_tty/stderr.md) | Check if stderr is a terminal |
| [`terminal::is_tty::stdin`](./terminal/is_tty/stdin.md) | Check if stdin is a terminal |
| [`terminal::name`](./terminal/name.md) | Return the terminal emulator name if detectable |
| [`terminal::read_key`](./terminal/read_key.md) | Read a single keypress without requiring Enter |
| [`terminal::read_key::timeout`](./terminal/read_key/timeout.md) | Read a single keypress with a timeout |
| [`terminal::read_password`](./terminal/read_password.md) | Read a password (no echo) |
| [`terminal::screen::alternate`](./terminal/screen/alternate.md) | Enter alternate screen buffer (like vim/less do) |
| [`terminal::screen::alternate_enter`](./terminal/screen/alternate_enter.md) | — |
| [`terminal::screen::alternate_exit`](./terminal/screen/alternate_exit.md) | — |
| [`terminal::screen::normal`](./terminal/screen/normal.md) | Return to normal screen buffer |
| [`terminal::screen::wrap`](./terminal/screen/wrap.md) | Enter alternate screen, run a command, return to normal screen |
| [`terminal::scroll::down`](./terminal/scroll/down.md) | Scroll down n lines |
| [`terminal::scroll::up`](./terminal/scroll/up.md) | Scroll up n lines |
| [`terminal::shopt::autocd::disable`](./terminal/shopt/autocd/disable.md) | — |
| [`terminal::shopt::autocd::enable`](./terminal/shopt/autocd/enable.md) | — |
| [`terminal::shopt::cdspell::disable`](./terminal/shopt/cdspell/disable.md) | — |
| [`terminal::shopt::cdspell::enable`](./terminal/shopt/cdspell/enable.md) | — |
| [`terminal::shopt::checkwinsize::disable`](./terminal/shopt/checkwinsize/disable.md) | — |
| [`terminal::shopt::checkwinsize::enable`](./terminal/shopt/checkwinsize/enable.md) | — |
| [`terminal::shopt::disable`](./terminal/shopt/disable.md) | Disable a shopt option |
| [`terminal::shopt::dotglob::disable`](./terminal/shopt/dotglob/disable.md) | — |
| [`terminal::shopt::dotglob::enable`](./terminal/shopt/dotglob/enable.md) | — |
| [`terminal::shopt::enable`](./terminal/shopt/enable.md) | Enable a shopt option, return 1 if unsupported |
| [`terminal::shopt::extglob::disable`](./terminal/shopt/extglob/disable.md) | — |
| [`terminal::shopt::extglob::enable`](./terminal/shopt/extglob/enable.md) | — |
| [`terminal::shopt::get`](./terminal/shopt/get.md) | Get current value of a shopt option ("on" or "off") |
| [`terminal::shopt::globstar::disable`](./terminal/shopt/globstar/disable.md) | — |
| [`terminal::shopt::globstar::enable`](./terminal/shopt/globstar/enable.md) | Common shopt convenience toggles |
| [`terminal::shopt::histappend::disable`](./terminal/shopt/histappend/disable.md) | — |
| [`terminal::shopt::histappend::enable`](./terminal/shopt/histappend/enable.md) | — |
| [`terminal::shopt::is_enabled`](./terminal/shopt/is_enabled.md) | Check if a shopt option is enabled |
| [`terminal::shopt::list::disabled`](./terminal/shopt/list/disabled.md) | List all disabled shopt options |
| [`terminal::shopt::list::enabled`](./terminal/shopt/list/enabled.md) | List all enabled shopt options |
| [`terminal::shopt::load`](./terminal/shopt/load.md) | Restore state from a variable |
| [`terminal::shopt::nocaseglob::disable`](./terminal/shopt/nocaseglob/disable.md) | — |
| [`terminal::shopt::nocaseglob::enable`](./terminal/shopt/nocaseglob/enable.md) | — |
| [`terminal::shopt::nocasematch::disable`](./terminal/shopt/nocasematch/disable.md) | — |
| [`terminal::shopt::nocasematch::enable`](./terminal/shopt/nocasematch/enable.md) | — |
| [`terminal::shopt::nullglob::disable`](./terminal/shopt/nullglob/disable.md) | — |
| [`terminal::shopt::nullglob::enable`](./terminal/shopt/nullglob/enable.md) | — |
| [`terminal::shopt::save`](./terminal/shopt/save.md) | Save current shopt state (prints a restore command) |
| [`terminal::size`](./terminal/size.md) | Get both as "cols rows" |
| [`terminal::title`](./terminal/title.md) | Set terminal title (works in most modern terminal emulators) |
| [`terminal::width`](./terminal/width.md) | Get terminal width in columns |
