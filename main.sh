#!/usr/bin/env bash

compile_files() {
    local output_file="${1:-compiled.sh}"
    local src_dir
    src_dir="$(dirname "${BASH_SOURCE[0]}")/src"

    # Validate src directory exists
    if [[ ! -d "$src_dir" ]]; then
        echo "Error: src directory not found: $src_dir" >&2
        return 1
    fi

    # Collect .sh files upfront so we can validate before touching output
    local -a files=()
    for f in "$src_dir"/*.sh; do
        [[ -f "$f" ]] && files+=("$f")
    done

    if (( ${#files[@]} == 0 )); then
        echo "Error: No .sh files found in $src_dir" >&2
        return 1
    fi

    # Truncate/create output only after we know there's something to write
    true > "$output_file"

    local i=0
    local total_err=0 total_warn=0 total_info=0
    local has_shellcheck=false
    command -v shellcheck >/dev/null 2>&1 && has_shellcheck=true

    for func_file in "${files[@]}"; do
        local fname
        fname="$(basename "$func_file")"

        if [[ ! -s "$func_file" ]]; then
            echo "Warning: Skipping empty file: $fname" >&2
            continue
        fi

        # Run shellcheck once, parse counts from output
        local err_file=0 warn_file=0 info_file=0 issue_str_file=""
        if $has_shellcheck; then
            local sc_out
            sc_out=$(shellcheck --format=gcc "$func_file" 2>/dev/null)
            err_file=$(echo "$sc_out"  | grep -c ': error:')
            warn_file=$(echo "$sc_out" | grep -c ': warning:')
            info_file=$(echo "$sc_out" | grep -c ': note:')

            # Also show human-readable output
            shellcheck --color=auto --format=tty "$func_file" 2>/dev/null || true
            echo

            local file_issues=$(( err_file + warn_file + info_file ))
            if (( file_issues > 0 )); then
                issue_str_file=" — $file_issues issues ($err_file errors, $warn_file warnings, $info_file info)"
                (( total_err  += err_file  ))
                (( total_warn += warn_file ))
                (( total_info += info_file ))
            fi
        fi

        echo -n "Writing $fname..."

        local i_line=0
        while IFS= read -r line; do
            # Strip shebang from all but the first file
            if (( i > 0 && i_line == 0 )); then
                (( i_line++ ))
                [[ "$line" =~ ^#! ]] && continue
            fi
            printf '%s\n' "$line" >> "$output_file"
            (( i_line++ ))
        done < "$func_file"

        echo " ok${issue_str_file}"
        (( i++ ))
    done

    # Nothing was actually written (all files were empty)
    if (( i == 0 )); then
        echo "Error: All source files were empty, output not written" >&2
        rm -f "$output_file"
        return 1
    fi

    chmod +x "$output_file" 2>/dev/null

    local total_issues=$(( total_err + total_warn + total_info ))
    local final_issue_str=""
    if (( total_issues > 0 )); then
        final_issue_str=" — $total_issues total issues ($total_err errors, $total_warn warnings, $total_info info)"
    fi

    echo "Compiled $i file(s) to $output_file${final_issue_str}"
}

stat() {
    local file=$1
    echo "=== bash::framehead.sh Diagnostics ==="
    echo "File size: $(wc -l < $file) lines"
    echo "First 5 lines:"
    head -5 $file
    echo "..."
    echo "Last 5 lines:"
    tail -5 $file
    echo ""
    echo "=== Testing load time in fresh shell ==="
    command time -f "Real: %e s, User: %U s, Sys: %S s" \
      bash -c "source $file"
    echo ""
    echo "=== Function count by module ==="
    (
      source $file
      declare -F | awk -F'::' '{print $1}' | sort | uniq -c | sort -rn
      echo "$(declare -F | wc -l) total functions loaded"
    )

}

## These are covered by LLMs
## You may not want to update this manually
## Unless you want to painstakingly go back and forth the files and recompile to fix test coverages.
##
## Recommended prompt:
## """
##  Based on the following tester function:
##  (copy this function)
##  Can you update the function to maximise test coverage? Here is the output:
##  (Insert test output ESPECIALLY the 'untested functions' section)
##
##  Please do not change the structure of the tests, just add new ones.
##  If you insist, you SHOULD ask first.
## """
##
##  Upload the compiled single-file output (bash-framehead.sh) for full context.
##  If the file is too large, upload individual module files one at a time and specify which module to cover first.
##  You may add "May you suggest a module you want to cover first?" as guidance
##
##  REMEMBER: YOU are still responsible. DO NOT leave LLMs fully agentic.
tester() {
    local file=$1
    local passed=0 failed=0 skipped=0

local _stderr_log
    _stderr_log=$(mktemp)
    exec 3>&2 2>"$_stderr_log"

    _check_stderr() {
        local err
        err=$(cat "$_stderr_log")
        > "$_stderr_log"
        if [[ -n "$err" ]]; then
            echo "        stderr: $err"
            return 1
        fi
        return 0
    }

    _test() {
        local name="$1" expected="$2" actual="$3"
        local clean=true
        _check_stderr || clean=false
        if [[ "$actual" == "$expected" ]] && $clean; then
            echo "  PASS  $name"
            (( passed++ ))
        else
            echo "  FAIL  $name"
            [[ "$actual" != "$expected" ]] && \
                echo "        expected: $expected" && \
                echo "        actual:   $actual"
            (( failed++ ))
        fi
    }

    _test_contains() {
        local name="$1" needle="$2" actual="$3"
        local clean=true
        _check_stderr || clean=false
        if [[ "$actual" == *"$needle"* ]] && $clean; then
            echo "  PASS  $name"
            (( passed++ ))
        else
            echo "  FAIL  $name"
            [[ "$actual" != *"$needle"* ]] && \
                echo "        expected to contain: $needle" && \
                echo "        actual: $actual"
            (( failed++ ))
        fi
    }

    _test_nonempty() {
        local name="$1" actual="$2"
        local clean=true
        _check_stderr || clean=false
        if [[ -n "$actual" ]] && $clean; then
            echo "  PASS  $name"
            (( passed++ ))
        else
            echo "  FAIL  $name${actual:+ (empty output)}"
            (( failed++ ))
        fi
    }

    _test_skip() {
        echo "  SKIP  $1"
        (( skipped++ ))
    }

    # Track which functions were tested
    local -A _tested=()
    _mark_tested() {
        for fn in "$@"; do _tested["$fn"]=1; done
    }

    source "$file"

    echo "=== bash::framehead functional smoke tests ==="
    echo ""

    echo "--- string ---"
    _test        "string::upper"              "HELLO"          "$(string::upper hello)"
    _test        "string::lower"              "hello"          "$(string::lower HELLO)"
    _test        "string::length"             "5"              "$(string::length hello)"
    _test        "string::contains (true)"    "0"              "$( string::contains hello ell; echo $? )"
    _test        "string::reverse"            "olleh"          "$(string::reverse hello)"
    _test        "string::snake_to_camel"     "helloWorld"     "$(string::snake_to_camel hello_world)"
    _test        "string::trim"               "hello"          "$(string::trim "  hello  ")"
    _test        "string::repeat"             "aaa"            "$(string::repeat a 3)"
    _test        "string::is_integer (true)"  "0"              "$( string::is_integer 42; echo $? )"
    _test        "string::is_integer (false)" "1"              "$( string::is_integer abc; echo $? )"
    _mark_tested string::upper string::lower string::length string::contains string::reverse \
                 string::snake_to_camel string::trim string::repeat string::is_integer

    echo ""
    echo "--- array ---"
    _test        "array::length"              "3"              "$(array::length a b c)"
    _test        "array::first"               "a"              "$(array::first a b c)"
    _test        "array::last"                "c"              "$(array::last a b c)"
    _test        "array::contains (true)"     "0"              "$( array::contains b a b c; echo $? )"
    _test        "array::contains (false)"    "1"              "$( array::contains z a b c; echo $? )"
    _test        "array::reverse"             "$(printf 'c\nb\na')" "$(array::reverse a b c)"
    _test        "array::join"                "a,b,c"          "$(array::join , a b c)"
    _test        "array::sum"                 "6"              "$(array::sum 1 2 3)"
    _test        "array::unique"              "$(printf 'a\nb\nc')" "$(array::unique a b a c b)"
    _mark_tested array::length array::first array::last array::contains array::reverse \
                 array::join array::sum array::unique

    echo ""
    echo "--- math ---"
    _test        "math::abs (negative)"       "5"              "$(math::abs -5)"
    _test        "math::abs (positive)"       "5"              "$(math::abs 5)"
    _test        "math::min"                  "3"              "$(math::min 3 7)"
    _test        "math::max"                  "7"              "$(math::max 3 7)"
    _test        "math::clamp"                "5"              "$(math::clamp 5 1 10)"
    _test        "math::clamp (low)"          "1"              "$(math::clamp -5 1 10)"
    _test        "math::clamp (high)"         "10"             "$(math::clamp 99 1 10)"
    _test        "math::gcd"                  "6"              "$(math::gcd 12 18)"
    _test        "math::lcm"                  "12"             "$(math::lcm 4 6)"
    _test        "math::is_prime (true)"      "0"              "$( math::is_prime 17; echo $? )"
    _test        "math::is_prime (false)"     "1"              "$( math::is_prime 18; echo $? )"
    _test        "math::factorial"            "120"            "$(math::factorial 5)"
    _test        "math::fibonacci"            "13"             "$(math::fibonacci 7)"
    _test        "math::pow"                  "8"              "$(math::pow 2 3)"
    _test        "math::choose"               "10"             "$(math::choose 5 2)"
    _mark_tested math::abs math::min math::max math::clamp math::gcd math::lcm \
                 math::is_prime math::factorial math::fibonacci math::pow math::choose

    echo ""
    echo "--- hash ---"
    _test_nonempty "hash::md5"               "$(hash::md5 hello)"
    _test_nonempty "hash::sha256"            "$(hash::sha256 hello)"
    _test          "hash::sha256 (known)"    "2cf24dba5fb0a30e26e83b2ac5b9e29e1b161e5c1fa7425e73043362938b9824" \
                                             "$(hash::sha256 hello)"
    _test_nonempty "hash::djb2"              "$(hash::djb2 hello)"
    _test_nonempty "hash::fnv1a32"           "$(hash::fnv1a32 hello)"
    _test          "hash::verify"            "0"              "$( hash::verify hello "$(hash::sha256 hello)" sha256; echo $? )"
    _test          "hash::slot range"        "0"              "$( h=$(hash::slot 10 test); [[ $h -ge 0 && $h -lt 10 ]] && echo 0 || echo 1 )"
    _mark_tested hash::md5 hash::sha256 hash::djb2 hash::fnv1a32 hash::verify hash::slot

    echo ""
    echo "--- runtime ---"
    _test_nonempty "runtime::os"             "$(runtime::os)"
    _test_nonempty "runtime::arch"           "$(runtime::arch)"
    _test_nonempty "runtime::bash_version"   "$(runtime::bash_version)"
    _test          "runtime::is_bash"        "0"              "$( runtime::is_bash; echo $? )"
    _test_nonempty "runtime::distro"         "$(runtime::distro)"
    _mark_tested runtime::os runtime::arch runtime::bash_version runtime::is_bash runtime::distro

    echo ""
    echo "--- timedate ---"
    _test_nonempty "timedate::timestamp::unix"    "$(timedate::timestamp::unix)"
    _test_nonempty "timedate::date::today"        "$(timedate::date::today)"
    _test_nonempty "timedate::time::now"          "$(timedate::time::now)"
    _test          "timedate::calendar::is_leap_year (2000)" "0" "$( timedate::calendar::is_leap_year 2000; echo $? )"
    _test          "timedate::calendar::is_leap_year (1900)" "1" "$( timedate::calendar::is_leap_year 1900; echo $? )"
    _test          "timedate::calendar::easter 2024" "2024-03-31" "$(timedate::calendar::easter 2024)"
    _test          "timedate::duration::format"  "1h 1m 1s"   "$(timedate::duration::format 3661)"
    _test_contains "timedate::duration::relative" "ago"       "$(timedate::duration::relative $(( $(timedate::timestamp::unix) - 3600 )))"
    _mark_tested timedate::timestamp::unix timedate::date::today timedate::time::now \
                 timedate::calendar::is_leap_year timedate::calendar::easter \
                 timedate::duration::format timedate::duration::relative

    echo ""
    echo "--- git (skipped if not in repo) ---"
    if git rev-parse --git-dir >/dev/null 2>&1; then
        _test_nonempty "git::branch::current"   "$(git::branch::current)"
        _test_nonempty "git::commit::hash"       "$(git::commit::hash)"
        _test_nonempty "git::root_dir"               "$(git::root_dir)"
        _mark_tested git::branch::current git::commit::hash git::root_dir
    else
        _test_skip "git (not in a git repo)"
    fi

    echo ""
    echo "--- net (skipped if offline) ---"
    if net::is_online 2>/dev/null; then
        _test_nonempty "net::ip::local"          "$(net::ip::local)"
        _test_nonempty "net::hostname"           "$(net::hostname)"
        _test          "net::port::is_open (80)" "0" "$( net::port::is_open google.com 80; echo $? )"
        _mark_tested net::ip::local net::hostname net::port::is_open
    else
        _test_skip "net (no network)"
    fi

    # Report untested functions
    echo ""
    echo "--- untested functions ---"
    local untested=0
    while IFS= read -r fn; do
        [[ -z "${_tested[$fn]+x}" ]] && echo "  UNTESTED  $fn" && (( untested++ ))
    done < <(declare -F | awk '{print $3}' | grep -v '^_')

    exec 2>&3 3>&-
    rm -f "$_stderr_log"

    echo ""
    echo "=== Results: $passed passed, $failed failed, $skipped skipped, $untested untested ==="
    (( failed == 0 ))
}

if [[ ${1,,} == "compile" ]]; then
    compile_files "${2:-compiled.sh}"
    exit 0
fi

if [[ ${1,,} == "test" ]]; then
    tester $2
    exit 0
fi

if [[ ${1,,} == "stat" ]]; then
    stat $2
    exit 0
fi

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    # Being executed, not sourced — tell user to source it
    echo "Usage: source ${0}" >&2
    exit 1
fi

# source all function files
src_dir="$(dirname "${BASH_SOURCE[0]}")/src"
for func_file in "$src_dir"/*.sh; do
    if [[ -f "$func_file" ]]; then
        echo -n "Sourcing $func_file..."
        bash -n "$func_file" || { echo "Failed Bash dry check." && return 1; }
        source "$func_file" && echo "ok"
    fi
done
