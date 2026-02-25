# `process`

| Function | Description |
|----------|-------------|
| [`process::cmdline`](./process/cmdline.md) | Get command line of a process |
| [`process::cpu`](./process/cpu.md) | Get CPU usage percentage for a PID |
| [`process::cwd`](./process/cwd.md) | Get process working directory |
| [`process::env`](./process/env.md) | Get process environment variable |
| [`process::fd_count`](./process/fd_count.md) | Get number of open file descriptors for a PID |
| [`process::find`](./process/find.md) | Find processes matching a pattern (name or cmdline) |
| [`process::is_running`](./process/is_running.md) | Check if a process is running by PID |
| [`process::is_running::name`](./process/is_running/name.md) | Check if a process is running by name |
| [`process::is_zombie`](./process/is_zombie.md) | Check if a process is a zombie |
| [`process::job::list`](./process/job/list.md) | List current shell's background jobs |
| [`process::job::status`](./process/job/status.md) | Get exit status of last background job |
| [`process::job::wait`](./process/job/wait.md) | Wait for a specific background job by PID |
| [`process::job::wait_all`](./process/job/wait_all.md) | Wait for all background jobs to finish |
| [`process::kill`](./process/kill.md) | Terminate a process (SIGTERM) |
| [`process::kill::force`](./process/kill/force.md) | Force kill a process (SIGKILL) |
| [`process::kill::graceful`](./process/kill/graceful.md) | Graceful kill — SIGTERM, wait, then SIGKILL if still running |
| [`process::kill::name`](./process/kill/name.md) | Kill all processes matching a name |
| [`process::list`](./process/list.md) | List all running processes (PID and name) |
| [`process::lock::acquire`](./process/lock/acquire.md) | Acquire a lock — returns 1 if already locked |
| [`process::lock::is_locked`](./process/lock/is_locked.md) | Check if a lock is held |
| [`process::lock::release`](./process/lock/release.md) | Release a lock |
| [`process::lock::wait`](./process/lock/wait.md) | Wait for a lock to become available |
| [`process::memory`](./process/memory.md) | Get memory usage in KB for a PID |
| [`process::memory::percent`](./process/memory/percent.md) | Get memory usage as percentage |
| [`process::name`](./process/name.md) | Get process name from PID |
| [`process::pid`](./process/pid.md) | Get PID(s) of a named process (one per line) |
| [`process::ppid`](./process/ppid.md) | Get parent PID of a process |
| [`process::reload`](./process/reload.md) | Reload a process config (SIGHUP) |
| [`process::renice`](./process/renice.md) | Change process priority (nice value, -20 to 19) |
| [`process::resume`](./process/resume.md) | Resume a suspended process (SIGCONT) |
| [`process::retry`](./process/retry.md) | Retry a command n times with a delay between attempts |
| [`process::run_bg`](./process/run_bg.md) | Run a command in the background, print its PID |
| [`process::run_bg::log`](./process/run_bg/log.md) | Run a command in the background, redirect output to a log file |
| [`process::run_bg::timeout`](./process/run_bg/timeout.md) | Run a command in the background with a timeout |
| [`process::self`](./process/self.md) | Get PID of current shell |
| [`process::service::is_enabled`](./process/service/is_enabled.md) | Check if a service is enabled at boot |
| [`process::service::is_running`](./process/service/is_running.md) | Check if a systemd service is running |
| [`process::service::restart`](./process/service/restart.md) | Restart a systemd service |
| [`process::service::start`](./process/service/start.md) | Start a systemd service |
| [`process::service::stop`](./process/service/stop.md) | Stop a systemd service |
| [`process::signal`](./process/signal.md) | Send a signal to a process |
| [`process::singleton`](./process/singleton.md) | Run command only if not already running (singleton) |
| [`process::start_time`](./process/start_time.md) | Get process start time (unix timestamp) |
| [`process::state`](./process/state.md) | Get process state (R=running, S=sleeping, Z=zombie, etc.) |
| [`process::suspend`](./process/suspend.md) | Suspend a process (SIGSTOP) |
| [`process::thread_count`](./process/thread_count.md) | Get number of threads for a PID |
| [`process::time`](./process/time.md) | Run a command and return its execution time in seconds |
| [`process::timeout`](./process/timeout.md) | Run a command with a timeout, kill it if it exceeds |
| [`process::tree`](./process/tree.md) | Get process tree from a PID |
| [`process::uptime`](./process/uptime.md) | Get process uptime in seconds |
| [`process::wait`](./process/wait.md) | Wait for a process to finish |
