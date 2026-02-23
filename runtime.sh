runtime::is_terminal() {
    # Thorough check for all standard file descriptors (stdin, stdout, stderr)
    [[ -t 0 && -t 1 && -t 2 ]]
}
runtime::is_terminal::lazy() {
    [[ -t 1 ]]
}

runtime::is_interactive() {
    [[ $- == *i* ]]
}

runtime::is_login() {
    shopt -q login_shell
}

runtime::is_sourced() {
    [[ "${BASH_SOURCE[0]}" != "${0}" ]]
}

runtime::is_bash() {
    [[ -n "$BASH_VERSION" ]]
}

runtime::has_command() {
    command -v "$1" >/dev/null 2>&1
}

runtime::is_root() {
    [[ $EUID -eq 0 ]]
}

runtime::is_desktop() {
    [ -n "$DISPLAY" ] || [ -n "$WAYLAND_DISPLAY" ]
}

runtime::sysinit() {
    ps -p 1 -o comm=
}

runtime::is_ci() {
    [[ -n "$CI" ]] ||
    [[ -n "$GITHUB_ACTIONS" ]] ||
    [[ -n "$GITLAB_CI" ]] ||
    [[ -n "$CIRCLECI" ]] ||
    [[ -n "$TRAVIS" ]] ||
    [[ -n "$JENKINS_URL" ]] ||
    [[ -n "$BITBUCKET_BUILD_NUMBER" ]] ||
    [[ -n "$TEAMCITY_VERSION" ]] ||
    [[ -n "$DRONE" ]] ||
    [[ -n "$CODEBUILD_BUILD_ID" ]]
}

runtime::kernel_version() {
    [[ $(runtime::os) == "linux" ]] || return 1
    # Number only, case of checks where you don't care about types
    local v
    v=$(uname -r)
    printf '%s\n' "${v%%-*}"
}

runtime::exec_root() {
    # Already root, nothing to do
    if runtime::is_root; then
        return 0
    fi

    if runtime::has_command sudo; then
        # In a non-terminal context, check if sudo can run without a password prompt
        # -n flag makes sudo fail immediately instead of hanging if password is needed
        if ! runtime::is_terminal && ! sudo -n true 2>/dev/null; then
            echo "runtime::request_root: sudo requires a password but no terminal is available, will attempt alternatives." >&2
            # Fall through to other methods
        else
            sudo "$@"
            return $?
        fi
    fi

    if runtime::has_command pkexec && runtime::is_desktop; then
        pkexec "$@"
    elif runtime::has_command doas; then
        doas "$@"
    elif runtime::has_command su; then
        # su -c takes a single string, fragile with spaces in arguments
        su -c "$*" root
    else
        echo "runtime::request_root: no privilege escalation method found" >&2
        return 1
    fi
}

runtime::is_wsl() {
    [[ -f /proc/version ]] && grep -qi "microsoft" /proc/version
}

runtime::os() {
    if runtime::is_wsl; then
        echo "wsl"
        return
    fi

    case "$(uname -s)" in
        Linux*)   echo "linux" ;;
        Darwin*)  echo "darwin" ;;
        CYGWIN*)  echo "cygwin" ;;
        MINGW*)   echo "mingw" ;;
        *)        echo "unknown" ;;
    esac
}

runtime::arch() {
    case "$(uname -m)" in
        x86_64)   echo "amd64" ;;
        i386)     echo "386" ;;
        armv7l)   echo "armv7" ;;
        aarch64)  echo "arm64" ;;
        *)        echo "unknown" ;;
    esac
}

runtime::distro() {
    if [[ -f /etc/os-release ]]; then
        ( . /etc/os-release && echo "$ID" )
    else
        echo "unknown"
    fi
}

runtime::bash_version() {
    echo "${BASH_VERSINFO[0]}.${BASH_VERSINFO[1]}.${BASH_VERSINFO[2]}"
}

runtime::bash_version::major() {
    echo "${BASH_VERSINFO[0]}"
}

# Default to 3, assuming that's what's at least needed for this framework (not final)
runtime::is_minimum_bash() {
    (( BASH_VERSINFO[0] >= ${1:-3}))
}

runtime::is_container() {
    [[ -f /.dockerenv ]] || [[ -f /run/.containerenv ]]
}

runtime::pm() {
    if runtime::has_command apt-get; then
        echo "apt"
    elif runtime::has_command pacman; then
        echo "pacman"
    elif runtime::has_command dnf; then
        echo "dnf"
    elif runtime::has_command yum; then
        echo "yum"
    elif runtime::has_command zypper; then
        echo "zypper"
    elif runtime::has_command apk; then
        echo "apk"
    elif runtime::has_command brew; then
        echo "brew"
    elif runtime::has_command pkg; then
        echo "pkg"
    elif runtime::has_command xbps-install; then
        echo "xbps"
    elif runtime::has_command nix-env; then
        echo "nix"
    else
        echo "unknown"
    fi
}
