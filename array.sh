#!/usr/bin/env bash
# array.sh — bash-frameheader array lib
# Requires: runtime.sh (runtime::is_minimum_bash)
#
# USAGE NOTE: Bash arrays cannot be passed by value — callers must use
# nameref (Bash 4.3+) or pass elements as individual arguments.
# Functions that take arrays expect elements as "$@" unless noted.
#
# BASH 5 FEATURES: Some functions use associative array tricks or features
# only available in Bash 5+. These are guarded with runtime::is_minimum_bash 5
# and will print an error and return 1 if called on an older version.

# ==============================================================================
# CONSTRUCTION
# ==============================================================================

# Build an array from a delimited string
# Usage: array::from_string delimiter string
# Example: array::from_string "," "a,b,c" → prints one element per line
array::from_string() {
    local delim="$1" s="$2"
    local IFS="$delim"
    local -a parts=($s)
    printf '%s\n' "${parts[@]}"
}

# Build an array from lines of stdin or a string (newline-delimited)
# Usage: array::from_lines "line1\nline2\nline3"
array::from_lines() {
    local IFS=$'\n'
    local -a parts=($1)
    printf '%s\n' "${parts[@]}"
}

# Build a range of integers
# Usage: array::range start end [step]
# Example: array::range 1 5 → 1 2 3 4 5
array::range() {
    local start="$1" end="$2" step="${3:-1}"
    local i
    for (( i=start; i<=end; i+=step )); do
        echo "$i"
    done
}

# ==============================================================================
# INSPECTION
# ==============================================================================

# Number of elements
# Usage: array::length el1 el2 ...
array::length() {
    echo "$#"
}

# Check if array is empty
# Usage: array::is_empty "$@"
array::is_empty() {
    [[ "$#" -eq 0 ]]
}

# Check if array contains a value
# Usage: array::contains needle el1 el2 ...
array::contains() {
    local needle="$1"; shift
    local el
    for el in "$@"; do
        [[ "$el" == "$needle" ]] && return 0
    done
    return 1
}

# Return index of first match (-1 if not found)
# Usage: array::index_of needle el1 el2 ...
array::index_of() {
    local needle="$1"; shift
    local i=0
    for el in "$@"; do
        [[ "$el" == "$needle" ]] && echo "$i" && return 0
        (( i++ ))
    done
    echo -1
    return 1
}

# Return first element
# Usage: array::first el1 el2 ...
array::first() {
    echo "$1"
}

# Return last element
# Usage: array::last el1 el2 ...
array::last() {
    eval echo "\${$#}"
}

# Return element at index
# Usage: array::get index el1 el2 ...
array::get() {
    local idx="$1"; shift
    local -a arr=("$@")
    echo "${arr[$idx]}"
}

# Count occurrences of a value
# Usage: array::count_of needle el1 el2 ...
array::count_of() {
    local needle="$1" count=0; shift
    for el in "$@"; do
        [[ "$el" == "$needle" ]] && (( count++ ))
    done
    echo "$count"
}

# ==============================================================================
# TRANSFORMATION
# ==============================================================================

# Print each element on its own line (normalise for piping)
array::print() {
    printf '%s\n' "$@"
}

# Reverse order of elements
# Usage: array::reverse el1 el2 ...
array::reverse() {
    local -a arr=("$@")
    local i
    for (( i=${#arr[@]}-1; i>=0; i-- )); do
        echo "${arr[$i]}"
    done
}

# Flatten one level — splits each element by whitespace
# Usage: array::flatten el1 "el2a el2b" el3
array::flatten() {
    for el in "$@"; do
        for word in $el; do
            echo "$word"
        done
    done
}

# Slice a subarray
# Usage: array::slice start length el1 el2 ...
array::slice() {
    local start="$1" len="$2"; shift 2
    local -a arr=("$@")
    printf '%s\n' "${arr[@]:$start:$len}"
}

# Append elements (print existing + new)
# Usage: array::push new_el el1 el2 ...
array::push() {
    local new="$1"; shift
    printf '%s\n' "$@" "$new"
}

# Remove last element
# Usage: array::pop el1 el2 ...
array::pop() {
    local -a arr=("$@")
    unset 'arr[-1]'
    printf '%s\n' "${arr[@]}"
}

# Prepend an element
# Usage: array::unshift new_el el1 el2 ...
array::unshift() {
    local new="$1"; shift
    printf '%s\n' "$new" "$@"
}

# Remove first element
# Usage: array::shift el1 el2 ...
array::shift() {
    shift
    printf '%s\n' "$@"
}

# Remove element at index
# Usage: array::remove_at index el1 el2 ...
array::remove_at() {
    local idx="$1" i=0; shift
    for el in "$@"; do
        [[ "$i" -ne "$idx" ]] && echo "$el"
        (( i++ ))
    done
}

# Remove all occurrences of a value
# Usage: array::remove value el1 el2 ...
array::remove() {
    local target="$1"; shift
    for el in "$@"; do
        [[ "$el" != "$target" ]] && echo "$el"
    done
}

# Replace element at index with new value
# Usage: array::set index value el1 el2 ...
array::set() {
    local idx="$1" val="$2" i=0; shift 2
    for el in "$@"; do
        [[ "$i" -eq "$idx" ]] && echo "$val" || echo "$el"
        (( i++ ))
    done
}

# Insert element at index
# Usage: array::insert_at index value el1 el2 ...
array::insert_at() {
    local idx="$1" val="$2" i=0; shift 2
    for el in "$@"; do
        [[ "$i" -eq "$idx" ]] && echo "$val"
        echo "$el"
        (( i++ ))
    done
    # If index is beyond end, append
    [[ "$i" -le "$idx" ]] && echo "$val"
}

# ==============================================================================
# FILTERING
# ==============================================================================

# Filter elements matching a regex
# Usage: array::filter regex el1 el2 ...
array::filter() {
    local regex="$1"; shift
    for el in "$@"; do
        [[ "$el" =~ $regex ]] && echo "$el"
    done
}

# Filter elements NOT matching a regex
# Usage: array::reject regex el1 el2 ...
array::reject() {
    local regex="$1"; shift
    for el in "$@"; do
        [[ ! "$el" =~ $regex ]] && echo "$el"
    done
}

# Return only elements that are non-empty
array::compact() {
    for el in "$@"; do
        [[ -n "$el" ]] && echo "$el"
    done
}

# ==============================================================================
# AGGREGATION
# ==============================================================================

# Join elements with a delimiter
# Usage: array::join delimiter el1 el2 ...
array::join() {
    local delim="$1" result="" first=true; shift
    for el in "$@"; do
        if $first; then result="$el"; first=false
        else result+="${delim}${el}"; fi
    done
    echo "$result"
}

# Sum all numeric elements
# Usage: array::sum el1 el2 ...
array::sum() {
    local total=0
    for el in "$@"; do
        total=$(( total + el ))
    done
    echo "$total"
}

# Minimum value (numeric)
array::min() {
    local min="$1"; shift
    for el in "$@"; do
        (( el < min )) && min="$el"
    done
    echo "$min"
}

# Maximum value (numeric)
array::max() {
    local max="$1"; shift
    for el in "$@"; do
        (( el > max )) && max="$el"
    done
    echo "$max"
}

# ==============================================================================
# SET OPERATIONS
# ==============================================================================

# Intersection — elements present in both arrays
# Usage: array::intersect "el1 el2 el3" "el2 el3 el4"
# Pass each array as a single space-separated string
array::intersect() {
    local -a a=($1) b=($2)
    for el in "${a[@]}"; do
        for other in "${b[@]}"; do
            [[ "$el" == "$other" ]] && echo "$el" && break
        done
    done
}

# Difference — elements in first array not in second
# Usage: array::diff "el1 el2 el3" "el2 el3 el4"
array::diff() {
    local -a a=($1) b=($2)
    for el in "${a[@]}"; do
        local found=false
        for other in "${b[@]}"; do
            [[ "$el" == "$other" ]] && found=true && break
        done
        $found || echo "$el"
    done
}

# Union — all unique elements from both arrays
# Usage: array::union "el1 el2" "el2 el3"
array::union() {
    local -a a=($1) b=($2)
    array::unique "${a[@]}" "${b[@]}"
}

# ==============================================================================
# SORTING
# ==============================================================================

# Sort elements alphabetically
# Usage: array::sort el1 el2 ...
array::sort() {
    printf '%s\n' "$@" | sort
}

# Sort elements in reverse
array::sort::reverse() {
    printf '%s\n' "$@" | sort -r
}

# Sort elements numerically
array::sort::numeric() {
    printf '%s\n' "$@" | sort -n
}

# Sort elements numerically in reverse
array::sort::numeric_reverse() {
    printf '%s\n' "$@" | sort -rn
}

# Check if two arrays are equal (same elements, same order)
# Usage: array::equals "el1 el2" "el1 el2"
array::equals() {
    local -a a=($1) b=($2)
    [[ "${#a[@]}" -ne "${#b[@]}" ]] && return 1
    local i
    for (( i=0; i<${#a[@]}; i++ )); do
        [[ "${a[$i]}" != "${b[$i]}" ]] && return 1
    done
    return 0
}

# Zip two arrays together — pairs elements by index
# Usage: array::zip "a1 a2 a3" "b1 b2 b3"
# Output: "a1 b1", "a2 b2", "a3 b3" (one pair per line)
array::zip() {
    local -a a=($1) b=($2)
    local len=$(( ${#a[@]} < ${#b[@]} ? ${#a[@]} : ${#b[@]} ))
    local i
    for (( i=0; i<len; i++ )); do
        echo "${a[$i]} ${b[$i]}"
    done
}

# Rotate array left by n positions
# Usage: array::rotate n el1 el2 ...
array::rotate() {
    local n="$1"; shift
    local -a arr=("$@")
    local len="${#arr[@]}"
    n=$(( n % len ))
    printf '%s\n' "${arr[@]:$n}" "${arr[@]:0:$n}"
}

# Chunk array into groups of n
# Usage: array::chunk size el1 el2 ...
# Output: each chunk on one line, space-separated
array::chunk() {
    local size="$1" i=0; shift
    local chunk=""
    for el in "$@"; do
        if [[ -n "$chunk" ]]; then chunk+=" $el"
        else chunk="$el"; fi
        (( i++ ))
        if (( i % size == 0 )); then
            echo "$chunk"
            chunk=""
        fi
    done
    [[ -n "$chunk" ]] && echo "$chunk"
}

# ==============================================================================
# BASH 5+ FEATURES
# ==============================================================================

# Remove duplicate elements (preserves first occurrence order)
# Usage: array::unique el1 el2 ...
array::unique() {
    local -A seen=()
    for el in "$@"; do
        if [[ -z "${seen[$el]+x}" ]]; then
            seen["$el"]=1
            echo "$el"
        fi
    done
}
