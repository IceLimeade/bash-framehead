#!/usr/bin/env bash
# math.sh — bash-frameheader math lib
# Requires: runtime.sh (runtime::has_command)
#
# Pure bash integer arithmetic where possible.
# Floating point operations require bc — math::bc() checks availability.
# Scale (decimal places) defaults to 10 unless overridden via MATH_SCALE.

MATH_SCALE="${MATH_SCALE:-10}"

# ==============================================================================
# CONSTANTS
# 42 digits — enough for the observable universe with room for Douglas Adams
# ==============================================================================

readonly MATH_PI="3.141592653589793238462643383279502884197169"
readonly MATH_E="2.718281828459045235360287471352662497757237"
readonly MATH_PHI="1.618033988749894848204586834365638117720309"
readonly MATH_SQRT2="1.414213562373095048801688724209698078569671"
readonly MATH_SQRT3="1.732050808568877293527446341505872366942805"
readonly MATH_LN2="0.693147180559945309417232121458176568075500"
readonly MATH_LN10="2.302585092994045684017991454684364207601101"
readonly MATH_TAU="6.283185307179586476925286766559005768394338"  # 2π
readonly MATH_EULER_MASCHERONI="0.577215664901532860606512090082402431042159"  # γ
readonly MATH_CATALAN="0.915965594177219015054603514932384110774149"
readonly MATH_APERY="1.202056903159594285399738161511449990764986"  # ζ(3)

# ==============================================================================
# BC WRAPPER
# ==============================================================================

# Check if bc is available
math::has_bc() {
    runtime::has_command bc
}

# Safe bc wrapper — checks availability, applies scale
# Usage: math::bc expression [scale]
# Example: math::bc "4 * a(1)" 42
math::bc() {
    local expr="$1" scale="${2:-$MATH_SCALE}"
    if ! math::has_bc; then
        echo "math::bc: requires bc (GNU coreutils)" >&2
        return 1
    fi
    echo "scale=${scale}; ${expr}" | bc -l
}

# ==============================================================================
# BASIC INTEGER ARITHMETIC
# Pure bash — no bc needed
# ==============================================================================

# Absolute value
# Usage: math::abs n
math::abs() {
    echo $(( $1 < 0 ? -$1 : $1 ))
}

# Minimum of two values
math::min() {
    echo $(( $1 < $2 ? $1 : $2 ))
}

# Maximum of two values
math::max() {
    echo $(( $1 > $2 ? $1 : $2 ))
}

# Clamp n between min and max inclusive
# Usage: math::clamp n min max
math::clamp() {
    local n="$1" lo="$2" hi="$3"
    echo $(( n < lo ? lo : (n > hi ? hi : n) ))
}

# Integer division (truncated toward zero)
# Usage: math::div dividend divisor
math::div() {
    echo $(( $1 / $2 ))
}

# Modulo
math::mod() {
    echo $(( $1 % $2 ))
}

# Integer exponentiation
# Usage: math::pow base exponent
math::pow() {
    local base="$1" exp="$2" result=1
    while (( exp > 0 )); do
        (( exp % 2 == 1 )) && result=$(( result * base ))
        base=$(( base * base ))
        exp=$(( exp / 2 ))
    done
    echo "$result"
}

# Greatest common divisor (Euclidean algorithm)
# Usage: math::gcd a b
math::gcd() {
    local a=$(( $1 < 0 ? -$1 : $1 ))
    local b=$(( $2 < 0 ? -$2 : $2 ))
    while (( b != 0 )); do
        local t=$b
        b=$(( a % b ))
        a=$t
    done
    echo "$a"
}

# Least common multiple
# Usage: math::lcm a b
math::lcm() {
    local a="$1" b="$2"
    local gcd
    gcd=$(math::gcd "$a" "$b")
    echo $(( (a / gcd) * b ))
}

# Check if integer is even
math::is_even() {
    (( $1 % 2 == 0 ))
}

# Check if integer is odd
math::is_odd() {
    (( $1 % 2 != 0 ))
}

# Check if integer is prime
math::is_prime() {
    local n="$1"
    (( n < 2 )) && return 1
    (( n == 2 )) && return 0
    (( n % 2 == 0 )) && return 1
    local i=3
    while (( i * i <= n )); do
        (( n % i == 0 )) && return 1
        (( i += 2 ))
    done
    return 0
}

# Factorial (integer)
# Usage: math::factorial n
math::factorial() {
    local n="$1" result=1
    (( n < 0 )) && { echo "math::factorial: negative input" >&2; return 1; }
    local i
    for (( i=2; i<=n; i++ )); do result=$(( result * i )); done
    echo "$result"
}

# Fibonacci (nth term, 0-indexed)
# Usage: math::fibonacci n
math::fibonacci() {
    local n="$1" a=0 b=1 i
    (( n == 0 )) && echo 0 && return
    for (( i=1; i<n; i++ )); do
        local t=$(( a + b ))
        a=$b
        b=$t
    done
    echo "$b"
}

# Integer square root (floor)
# Usage: math::isqrt n
math::int_sqrt() {
    local n="$1" x
    (( n < 0 )) && { echo "math::isqrt: negative input" >&2; return 1; }
    (( n == 0 )) && echo 0 && return
    x=$(( n / 2 + 1 ))
    local y=$(( (x + n / x) / 2 ))
    while (( y < x )); do
        x=$y
        y=$(( (x + n / x) / 2 ))
    done
    echo "$x"
}

# Sum of a sequence of integers
# Usage: math::sum n1 n2 n3 ...
math::sum() {
    local total=0
    for n in "$@"; do (( total += n )); done
    echo "$total"
}

# Product of a sequence of integers
math::product() {
    local result=1
    for n in "$@"; do (( result *= n )); done
    echo "$result"
}

# ==============================================================================
# FLOATING POINT (requires bc)
# ==============================================================================

# Floor — largest integer ≤ n
math::floor() {
    math::bc "scale=0; $1 / 1"
}

# Ceiling — smallest integer ≥ n
math::ceil() {
    local n="$1"
    math::bc "define ceil(x) {
        auto r; scale=0; r = x/1
        if (r < x) return r+1
        return r
    }; ceil($n)"
}

# Round to nearest integer (or to d decimal places)
# Usage: math::round n [decimal_places]
math::round() {
    local n="$1" d="${2:-0}"
    math::bc "scale=${d}; (${n} + 0.5 * (${n} > 0) - 0.5 * (${n} < 0)) / 1" "$d"
}

# Square root
math::sqrt() {
    math::bc "sqrt($1)"
}

# Natural logarithm
math::log() {
    math::bc "l($1)"
}

# Log base 2
math::log2() {
    math::bc "l($1) / l(2)"
}

# Log base 10
math::log10() {
    math::bc "l($1) / l(10)"
}

# Log with arbitrary base
# Usage: math::logn value base
math::logn() {
    math::bc "l($1) / l($2)"
}

# Exponential e^n
math::exp() {
    math::bc "e($1)"
}

# Power (floating point)
# Usage: math::powf base exponent
math::powf() {
    math::bc "e($2 * l($1))"
}

# ==============================================================================
# TRIGONOMETRY (requires bc)
# All angles in radians unless noted
# ==============================================================================

math::sin() {
    math::bc "s($1)"
}

math::cos() {
    math::bc "c($1)"
}

math::tan() {
    math::bc "s($1) / c($1)"
}

math::asin() {
    math::bc "a($1 / sqrt(1 - $1^2))"
}

math::acos() {
    math::bc "a(sqrt(1 - $1^2) / $1)"
}

math::atan() {
    math::bc "a($1)"
}

math::atan2() {
    math::bc "a($1 / $2)"
}

# Convert degrees to radians
math::deg_to_rad() {
    math::bc "$1 * $MATH_PI / 180"
}

# Convert radians to degrees
math::rad_to_deg() {
    math::bc "$1 * 180 / $MATH_PI"
}

# ==============================================================================
# PERCENTAGE / RATIO
# ==============================================================================

# Calculate percentage: (part / total) * 100
# Usage: math::percent part total [scale]
math::percent() {
    local part="$1" total="$2" scale="${3:-2}"
    math::bc "($part / $total) * 100" "$scale"
}

# Calculate what value is p% of total
# Usage: math::percent_of percent total [scale]
math::percent_of() {
    local pct="$1" total="$2" scale="${3:-2}"
    math::bc "($pct / 100) * $total" "$scale"
}

# Percentage change from old to new
# Usage: math::percent_change old new [scale]
math::percent_change() {
    local old="$1" new="$2" scale="${3:-2}"
    math::bc "(($new - $old) / $old) * 100" "$scale"
}

# ==============================================================================
# INTERPOLATION / MAPPING
# ==============================================================================

# Linear interpolation between a and b by factor t (0.0 - 1.0)
# Usage: math::lerp a b t [scale]
math::lerp() {
    local a="$1" b="$2" t="$3" scale="${4:-$MATH_SCALE}"
    math::bc "$a + ($b - $a) * $(math::clamp "$t" 0 1)" "$scale"
}

math::lerp_unclamped() {
    local a="$1" b="$2" t="$3" scale="${4:-$MATH_SCALE}"
    math::bc "$a + $t * ($b - $a)" "$scale"
}

# Map a value from one range to another
# Usage: math::map value in_min in_max out_min out_max [scale]
math::map() {
    local v="$1" imin="$2" imax="$3" omin="$4" omax="$5" scale="${6:-$MATH_SCALE}"
    math::bc "($v - $imin) * ($omax - $omin) / ($imax - $imin) + $omin" "$scale"
}

# Normalise a value to 0.0-1.0 range
# Usage: math::normalize value min max [scale]
math::normalize() {
    local v="$1" lo="$2" hi="$3" scale="${4:-$MATH_SCALE}"
    math::bc "($v - $lo) / ($hi - $lo)" "$scale"
}

# ==============================================================================
# NUMBER THEORY / COMBINATORICS
# ==============================================================================

# Binomial coefficient C(n, k) — "n choose k"
# Usage: math::choose n k
math::choose() {
    local n="$1" k="$2"
    (( k > n )) && echo 0 && return
    (( k == 0 || k == n )) && echo 1 && return
    # Use the smaller of k and n-k for efficiency
    (( k > n - k )) && k=$(( n - k ))
    local result=1 i
    for (( i=0; i<k; i++ )); do
        result=$(( result * (n - i) / (i + 1) ))
    done
    echo "$result"
}

# Number of permutations P(n, k)
# Usage: math::permute n k
math::permute() {
    local n="$1" k="$2" result=1 i
    for (( i=0; i<k; i++ )); do
        result=$(( result * (n - i) ))
    done
    echo "$result"
}

# Sum of digits of an integer
math::digit_sum() {
    local n="${1#-}" sum=0  # strip sign
    while (( n > 0 )); do
        (( sum += n % 10 ))
        (( n /= 10 ))
    done
    echo "$sum"
}

# Count number of digits
math::digit_count() {
    local n="${1#-}"
    (( n == 0 )) && echo 1 && return
    local count=0
    while (( n > 0 )); do
        (( count++ ))
        (( n /= 10 ))
    done
    echo "$count"
}

# Reverse digits of an integer
math::digit_reverse() {
    local n="${1#-}" sign="" result=0
    [[ "$1" == -* ]] && sign="-"
    while (( n > 0 )); do
        result=$(( result * 10 + n % 10 ))
        (( n /= 10 ))
    done
    echo "${sign}${result}"
}

# Check if integer is a palindrome
math::is_palindrome() {
    local n="${1#-}"
    local rev
    rev=$(math::digit_reverse "$n")
    (( n == rev ))
}

#!/usr/bin/env bash
# math::unitconvert — universal unit conversion dispatcher
# Usage: math::unitconvert from to value [scale]
# Example: math::unitconvert km mi 100
#          math::unitconvert celsius fahrenheit 37
#          math::unitconvert b gib 1073741824
#          math::unitconvert sector4k mib 2048

math::unitconvert() {
    local from="${1,,}" to="${2,,}" value="$3" scale="${4:-$MATH_SCALE}"

    [[ -z "$from" || -z "$to" || -z "$value" ]] && {
        echo "Usage: math::unitconvert <from> <to> <value> [scale]" >&2
        return 1
    }

    [[ "$from" == "$to" ]] && echo "$value" && return 0

    from=$(_math::unitconvert::normalise "$from")
    to=$(_math::unitconvert::normalise "$to")
    local key="${from}:${to}"
    local expr

    case "$key" in

    # --- Temperature ---
    celsius:fahrenheit  | c:f)    expr="$value * 9/5 + 32" ;;
    fahrenheit:celsius  | f:c)    expr="($value - 32) * 5/9" ;;
    celsius:kelvin      | c:k)    expr="$value + 273.15" ;;
    kelvin:celsius      | k:c)    expr="$value - 273.15" ;;
    fahrenheit:kelvin   | f:k)    expr="($value - 32) * 5/9 + 273.15" ;;
    kelvin:fahrenheit   | k:f)    expr="($value - 273.15) * 9/5 + 32" ;;

    # --- Length ---
    km:mi)              expr="$value * 0.621371" ;;
    mi:km)              expr="$value * 1.609344" ;;
    m:ft)               expr="$value * 3.28084" ;;
    ft:m)               expr="$value * 0.3048" ;;
    cm:in)              expr="$value * 0.393701" ;;
    in:cm)              expr="$value * 2.54" ;;
    m:yd)               expr="$value * 1.09361" ;;
    yd:m)               expr="$value * 0.9144" ;;
    mm:in)              expr="$value * 0.0393701" ;;
    in:mm)              expr="$value * 25.4" ;;
    m:km)               expr="$value / 1000" ;;
    km:m)               expr="$value * 1000" ;;
    cm:m)               expr="$value / 100" ;;
    m:cm)               expr="$value * 100" ;;
    mm:m)               expr="$value / 1000" ;;
    m:mm)               expr="$value * 1000" ;;
    cm:mm)              expr="$value * 10" ;;
    mm:cm)              expr="$value / 10" ;;
    nm_si:m)            expr="$value / 1000000000" ;;           # nanometres (SI) — nm taken by nautical
    m:nm_si)            expr="$value * 1000000000" ;;
    pm:m)               expr="$value / 1000000000000" ;;        # picometres
    m:pm)               expr="$value * 1000000000000" ;;
    fm:m)               expr="$value / 1000000000000000" ;;     # femtometres (10^-15 m)
    m:fm)               expr="$value * 1000000000000000" ;;
    fm:pm)              expr="$value / 1000" ;;
    pm:fm)              expr="$value * 1000" ;;
    nm_si:pm)           expr="$value * 1000" ;;
    pm:nm_si)           expr="$value / 1000" ;;
    nm_si:fm)           expr="$value * 1000000" ;;
    fm:nm_si)           expr="$value / 1000000" ;;
    nm:km)              expr="$value * 1.852" ;;                # nautical miles
    km:nm)              expr="$value / 1.852" ;;
    ly:km)              expr="$value * 9460730472580.8" ;;
    km:ly)              expr="$value / 9460730472580.8" ;;
    lh:km)              expr="$value * 1079251200" ;;           # light-hours
    km:lh)              expr="$value / 1079251200" ;;
    ld:km)              expr="$value * 25902068371.2" ;;        # light-days
    km:ld)              expr="$value / 25902068371.2" ;;
    lh:ly)              expr="$value / 8765.81" ;;
    ly:lh)              expr="$value * 8765.81" ;;
    ld:ly)              expr="$value / 365.25" ;;
    ly:ld)              expr="$value * 365.25" ;;
    ld:lh)              expr="$value * 24" ;;
    lh:ld)              expr="$value / 24" ;;
    au:km)              expr="$value * 149597870.7" ;;
    km:au)              expr="$value / 149597870.7" ;;
    pc:ly)              expr="$value * 3.26156" ;;
    ly:pc)              expr="$value / 3.26156" ;;
    pc:km)              expr="$value * 30856775814913.7" ;;
    km:pc)              expr="$value / 30856775814913.7" ;;

    # --- Mass ---
    kg:lb)              expr="$value * 2.20462" ;;
    lb:kg)              expr="$value * 0.453592" ;;
    g:oz)               expr="$value * 0.035274" ;;
    oz:g)               expr="$value * 28.3495" ;;
    g:kg)               expr="$value / 1000" ;;
    kg:g)               expr="$value * 1000" ;;
    mg:g)               expr="$value / 1000" ;;
    g:mg)               expr="$value * 1000" ;;
    t:kg)               expr="$value * 1000" ;;
    kg:t)               expr="$value / 1000" ;;
    t:lb)               expr="$value * 2204.62" ;;
    lb:t)               expr="$value / 2204.62" ;;
    st:kg)              expr="$value * 6.35029" ;;
    kg:st)              expr="$value / 6.35029" ;;

    # --- Volume ---
    l:gal)              expr="$value * 0.264172" ;;
    gal:l)              expr="$value * 3.78541" ;;
    ml:floz)            expr="$value * 0.033814" ;;
    floz:ml)            expr="$value * 29.5735" ;;
    l:pt)               expr="$value * 2.11338" ;;
    pt:l)               expr="$value / 2.11338" ;;
    ml:l)               expr="$value / 1000" ;;
    l:ml)               expr="$value * 1000" ;;
    l:qt)               expr="$value * 1.05669" ;;
    qt:l)               expr="$value / 1.05669" ;;
    m3:l)               expr="$value * 1000" ;;
    l:m3)               expr="$value / 1000" ;;
    tsp:ml)             expr="$value * 4.92892" ;;
    ml:tsp)             expr="$value / 4.92892" ;;
    tbsp:ml)            expr="$value * 14.7868" ;;
    ml:tbsp)            expr="$value / 14.7868" ;;

    # --- Speed ---
    kmh:mph)            expr="$value * 0.621371" ;;
    mph:kmh)            expr="$value * 1.609344" ;;
    ms:kmh)             expr="$value * 3.6" ;;
    kmh:ms)             expr="$value / 3.6" ;;
    ms:mph)             expr="$value * 2.23694" ;;
    mph:ms)             expr="$value / 2.23694" ;;
    knot:kmh)           expr="$value * 1.852" ;;
    kmh:knot)           expr="$value / 1.852" ;;
    knot:mph)           expr="$value * 1.15078" ;;
    mph:knot)           expr="$value / 1.15078" ;;
    mach:ms)            expr="$value * 343" ;;
    ms:mach)            expr="$value / 343" ;;
    c:ms)               expr="299792458" ;;

    # --- Pressure ---
    pa:psi)             expr="$value * 0.000145038" ;;
    psi:pa)             expr="$value * 6894.76" ;;
    atm:pa)             expr="$value * 101325" ;;
    pa:atm)             expr="$value / 101325" ;;
    bar:pa)             expr="$value * 100000" ;;
    pa:bar)             expr="$value / 100000" ;;
    atm:bar)            expr="$value * 1.01325" ;;
    bar:atm)            expr="$value / 1.01325" ;;
    mmhg:pa)            expr="$value * 133.322" ;;
    pa:mmhg)            expr="$value / 133.322" ;;

    # --- Energy ---
    j:cal)              expr="$value * 0.239006" ;;
    cal:j)              expr="$value * 4.18400" ;;
    j:kwh)              expr="$value / 3600000" ;;
    kwh:j)              expr="$value * 3600000" ;;
    j:btu)              expr="$value * 0.000947817" ;;
    btu:j)              expr="$value / 0.000947817" ;;
    ev:j)               expr="$value * 0.0000000000000000001602176634" ;;
    j:ev)               expr="$value / 0.0000000000000000001602176634" ;;
    kcal:j)             expr="$value * 4184" ;;
    j:kcal)             expr="$value / 4184" ;;

    # --- Power ---
    w:hp)               expr="$value * 0.00134102" ;;
    hp:w)               expr="$value / 0.00134102" ;;
    w:kw)               expr="$value / 1000" ;;
    kw:w)               expr="$value * 1000" ;;
    kw:hp)              expr="$value * 1.34102" ;;
    hp:kw)              expr="$value / 1.34102" ;;

    # --- Digital storage ---
    # SI prefixes (powers of 1000)
    b:kb)               expr="$value / 1000" ;;
    kb:b)               expr="$value * 1000" ;;
    b:mb)               expr="$value / 1000000" ;;
    mb:b)               expr="$value * 1000000" ;;
    b:gb)               expr="$value / 1000000000" ;;
    gb:b)               expr="$value * 1000000000" ;;
    b:tb)               expr="$value / 1000000000000" ;;
    tb:b)               expr="$value * 1000000000000" ;;
    kb:mb)              expr="$value / 1000" ;;
    mb:kb)              expr="$value * 1000" ;;
    mb:gb)              expr="$value / 1000" ;;
    gb:mb)              expr="$value * 1000" ;;
    gb:tb)              expr="$value / 1000" ;;
    tb:gb)              expr="$value * 1000" ;;
    tb:pb)              expr="$value / 1000" ;;
    pb:tb)              expr="$value * 1000" ;;
    # IEC prefixes (powers of 1024)
    b:kib)              expr="$value / 1024" ;;
    kib:b)              expr="$value * 1024" ;;
    b:mib)              expr="$value / 1048576" ;;
    mib:b)              expr="$value * 1048576" ;;
    b:gib)              expr="$value / 1073741824" ;;
    gib:b)              expr="$value * 1073741824" ;;
    b:tib)              expr="$value / 1099511627776" ;;
    tib:b)              expr="$value * 1099511627776" ;;
    kib:mib)            expr="$value / 1024" ;;
    mib:kib)            expr="$value * 1024" ;;
    mib:gib)            expr="$value / 1024" ;;
    gib:mib)            expr="$value * 1024" ;;
    gib:tib)            expr="$value / 1024" ;;
    tib:gib)            expr="$value * 1024" ;;
    tib:pib)            expr="$value / 1024" ;;
    pib:tib)            expr="$value * 1024" ;;
    # Disk sectors — 512-byte (traditional)
    sector:b)           expr="$value * 512" ;;
    b:sector)           expr="$value / 512" ;;
    sector:kb)          expr="$value / 2" ;;
    kb:sector)          expr="$value * 2" ;;
    sector:mb)          expr="$value / 2000" ;;
    mb:sector)          expr="$value * 2000" ;;
    sector:gb)          expr="$value / 2000000" ;;
    gb:sector)          expr="$value * 2000000" ;;
    sector:kib)         expr="$value / 2" ;;                    # 512*2=1024
    kib:sector)         expr="$value * 2" ;;
    sector:mib)         expr="$value / 2048" ;;
    mib:sector)         expr="$value * 2048" ;;
    sector:gib)         expr="$value / 2097152" ;;
    gib:sector)         expr="$value * 2097152" ;;
    # Disk sectors — 4096-byte (Advanced Format)
    sector4k:b)         expr="$value * 4096" ;;
    b:sector4k)         expr="$value / 4096" ;;
    sector4k:kb)        expr="$value / 244.140625" ;;
    kb:sector4k)        expr="$value * 244.140625" ;;
    sector4k:mb)        expr="$value / 244140.625" ;;
    mb:sector4k)        expr="$value * 244140.625" ;;
    sector4k:kib)       expr="$value * 4" ;;                    # 4096/1024=4
    kib:sector4k)       expr="$value / 4" ;;
    sector4k:mib)       expr="$value / 256" ;;
    mib:sector4k)       expr="$value * 256" ;;
    sector4k:gib)       expr="$value / 262144" ;;
    gib:sector4k)       expr="$value * 262144" ;;
    # Cross-sector
    sector:sector4k)    expr="$value / 8" ;;
    sector4k:sector)    expr="$value * 8" ;;

    # --- Time ---
    s:ms)               expr="$value * 1000" ;;
    ms:s)               expr="$value / 1000" ;;
    s:us)               expr="$value * 1000000" ;;
    us:s)               expr="$value / 1000000" ;;
    s:ns)               expr="$value * 1000000000" ;;
    ns:s)               expr="$value / 1000000000" ;;
    s:ps)               expr="$value * 1000000000000" ;;        # picoseconds
    ps:s)               expr="$value / 1000000000000" ;;
    s:fs)               expr="$value * 1000000000000000" ;;     # femtoseconds
    fs:s)               expr="$value / 1000000000000000" ;;
    ms:us)              expr="$value * 1000" ;;
    us:ms)              expr="$value / 1000" ;;
    us:ns)              expr="$value * 1000" ;;
    ns:us)              expr="$value / 1000" ;;
    ns:ps)              expr="$value * 1000" ;;
    ps:ns)              expr="$value / 1000" ;;
    ps:fs)              expr="$value * 1000" ;;
    fs:ps)              expr="$value / 1000" ;;
    fs:ns)              expr="$value / 1000000" ;;
    ns:fs)              expr="$value * 1000000" ;;
    fs:us)              expr="$value / 1000000000" ;;
    us:fs)              expr="$value * 1000000000" ;;
    fs:ms)              expr="$value / 1000000000000" ;;
    ms:fs)              expr="$value * 1000000000000" ;;
    s:min)              expr="$value / 60" ;;
    min:s)              expr="$value * 60" ;;
    min:ms)             expr="$value * 60000" ;;
    ms:min)             expr="$value / 60000" ;;
    min:h)              expr="$value / 60" ;;
    h:min)              expr="$value * 60" ;;
    h:s)                expr="$value * 3600" ;;
    s:h)                expr="$value / 3600" ;;
    h:d)                expr="$value / 24" ;;
    d:h)                expr="$value * 24" ;;
    d:s)                expr="$value * 86400" ;;
    s:d)                expr="$value / 86400" ;;
    d:week)             expr="$value / 7" ;;
    week:d)             expr="$value * 7" ;;
    d:year)             expr="$value / 365.25" ;;
    year:d)             expr="$value * 365.25" ;;

    # --- Angle ---
    deg:rad)            expr="$value * 3.141592653589793238462643383279502884197169 / 180" ;;
    rad:deg)            expr="$value * 180 / 3.141592653589793238462643383279502884197169" ;;
    deg:grad)           expr="$value * 400 / 360" ;;
    grad:deg)           expr="$value * 360 / 400" ;;
    rad:grad)           expr="$value * 200 / 3.141592653589793238462643383279502884197169" ;;
    grad:rad)           expr="$value * 3.141592653589793238462643383279502884197169 / 200" ;;
    deg:arcmin)         expr="$value * 60" ;;
    arcmin:deg)         expr="$value / 60" ;;
    deg:arcsec)         expr="$value * 3600" ;;
    arcsec:deg)         expr="$value / 3600" ;;
    arcmin:arcsec)      expr="$value * 60" ;;
    arcsec:arcmin)      expr="$value / 60" ;;

    *)
        echo "math::unitconvert: unknown conversion '${from}' → '${to}'" >&2
        return 1
        ;;
    esac

    math::bc "$expr" "$scale"
}

# ==============================================================================
# UNIT NAME NORMALISER
# Accepts long-form, plural, and common aliases — returns the short key
# used by math::unitconvert's case logic
# ==============================================================================

_math::unitconvert::normalise() {
    local unit="${1,,}"  # lowercase

    case "$unit" in

    # --- Temperature ---
    celsius|centigrade|degc|deg_c|"°c")        echo "celsius" ;;
    fahrenheit|degf|deg_f|"°f")                echo "fahrenheit" ;;
    kelvin|degk|deg_k|"°k")                    echo "kelvin" ;;
    # short aliases
    c)                                          echo "c" ;;
    f)                                          echo "f" ;;
    k)                                          echo "k" ;;

    # --- Length ---
    kilometre|kilometres|kilometer|kilometers|km)  echo "km" ;;
    metre|metres|meter|meters|m)                   echo "m" ;;
    centimetre|centimetres|centimeter|centimeters|cm) echo "cm" ;;
    millimetre|millimetres|millimeter|millimeters|mm) echo "mm" ;;
    micrometre|micrometres|micrometer|micrometers|micron|microns|um|μm) echo "um" ;;
    nanometre_si|nanometer_si|nm_si)               echo "nm_si" ;;
    picometre|picometres|picometer|picometers|pm)   echo "pm" ;;
    femtometre|femtometres|femtometer|femtometers|fm) echo "fm" ;;
    mile|miles|mi)                                 echo "mi" ;;
    foot|feet|ft)                                  echo "ft" ;;
    inch|inches|in)                                echo "in" ;;
    yard|yards|yd)                                 echo "yd" ;;
    nautical_mile|nautical_miles|nauticalmile|nauticalmiles|nm) echo "nm" ;;
    light_year|light_years|lightyear|lightyears|ly) echo "ly" ;;
    light_hour|light_hours|lighthour|lighthours|lh) echo "lh" ;;
    light_day|light_days|lightday|lightdays|ld)     echo "ld" ;;
    astronomical_unit|astronomical_units|au)        echo "au" ;;
    parsec|parsecs|pc)                              echo "pc" ;;

    # --- Mass ---
    kilogram|kilograms|kilogramme|kilogrammes|kg)   echo "kg" ;;
    gram|grams|gramme|grammes|g)                    echo "g" ;;
    milligram|milligrams|milligramme|milligrammes|mg) echo "mg" ;;
    pound|pounds|lb|lbs)                            echo "lb" ;;
    ounce|ounces|oz)                                echo "oz" ;;
    tonne|tonnes|metric_ton|metric_tons|t)          echo "t" ;;
    stone|stones|st)                                echo "st" ;;

    # --- Volume ---
    litre|litres|liter|liters|l)                   echo "l" ;;
    millilitre|millilitres|milliliter|milliliters|ml) echo "ml" ;;
    gallon|gallons|gal)                             echo "gal" ;;
    fluid_ounce|fluid_ounces|fluidounce|fl_oz|floz) echo "floz" ;;
    pint|pints|pt)                                  echo "pt" ;;
    quart|quarts|qt)                                echo "qt" ;;
    cubic_metre|cubic_meters|m3|m³)                 echo "m3" ;;
    teaspoon|teaspoons|tsp)                         echo "tsp" ;;
    tablespoon|tablespoons|tbsp)                    echo "tbsp" ;;

    # --- Speed ---
    "km/h"|kmh|kph|kilometres_per_hour|kilometers_per_hour) echo "kmh" ;;
    mph|"mi/h"|miles_per_hour)                      echo "mph" ;;
    "m/s"|ms|metres_per_second|meters_per_second)   echo "ms" ;;
    knot|knots)                                     echo "knot" ;;
    mach)                                           echo "mach" ;;
    speed_of_light|lightspeed)                      echo "c" ;;

    # --- Pressure ---
    pascal|pascals|pa)                              echo "pa" ;;
    kilopascal|kilopascals|kpa)                     echo "kpa" ;;
    psi|pounds_per_square_inch)                     echo "psi" ;;
    atmosphere|atmospheres|atm)                     echo "atm" ;;
    bar|bars)                                       echo "bar" ;;
    millibar|millibars|mbar)                        echo "mbar" ;;
    mmhg|millimetre_of_mercury|millimeter_of_mercury|torr) echo "mmhg" ;;

    # --- Energy ---
    joule|joules|j)                                 echo "j" ;;
    kilojoule|kilojoules|kj)                        echo "kj" ;;
    calorie|calories|cal)                           echo "cal" ;;
    kilocalorie|kilocalories|kcal)                  echo "kcal" ;;
    kilowatt_hour|kilowatt_hours|kwh|"kw/h")        echo "kwh" ;;
    btu|british_thermal_unit|british_thermal_units) echo "btu" ;;
    electronvolt|electronvolts|ev)                  echo "ev" ;;

    # --- Power ---
    watt|watts|w)                                   echo "w" ;;
    kilowatt|kilowatts|kw)                          echo "kw" ;;
    horsepower|hp)                                  echo "hp" ;;

    # --- Digital storage ---
    bit|bits|b)                                     echo "b" ;;
    kilobit|kilobits|kb)                            echo "kb" ;;
    megabit|megabits|mb)                            echo "mb" ;;
    gigabit|gigabits|gb)                            echo "gb" ;;
    terabit|terabits|tb)                            echo "tb" ;;
    petabit|petabits|pb)                            echo "pb" ;;
    kibibit|kibibits|kib)                           echo "kib" ;;
    mebibit|mebibits|mib)                           echo "mib" ;;
    gibibit|gibibits|gib)                           echo "gib" ;;
    tebibit|tebibits|tib)                           echo "tib" ;;
    pebibit|pebibits|pib)                           echo "pib" ;;
    sector|sectors|disk_sector|disk_sectors)        echo "sector" ;;
    sector4k|sector_4k|4k_sector|4ksector|advanced_format) echo "sector4k" ;;

    # --- Time ---
    second|seconds|sec|s)                           echo "s" ;;
    millisecond|milliseconds|ms|msec)               echo "ms" ;;
    microsecond|microseconds|us|μs|usec)            echo "us" ;;
    nanosecond|nanoseconds|ns|nsec)                 echo "ns" ;;
    picosecond|picoseconds|ps|psec)                 echo "ps" ;;
    femtosecond|femtoseconds|fs|fsec)               echo "fs" ;;
    minute|minutes|min)                             echo "min" ;;
    hour|hours|h|hr|hrs)                            echo "h" ;;
    day|days|d)                                     echo "d" ;;
    week|weeks)                                     echo "week" ;;
    year|years|yr|yrs)                              echo "year" ;;

    # --- Angle ---
    degree|degrees|deg)                             echo "deg" ;;
    radian|radians|rad)                             echo "rad" ;;
    gradian|gradians|grad|gon|gons)                 echo "grad" ;;
    arcminute|arcminutes|arcmin|"'")                echo "arcmin" ;;
    arcsecond|arcseconds|arcsec|"\"")              echo "arcsec" ;;

    # Already a valid short key — pass through
    *)                                              echo "$unit" ;;
    esac
}

# Wrapper that normalises unit names before dispatching
# Accepts the same args as math::unitconvert but with natural language units
# Usage: math::convert from to value [scale]
# Example: math::convert kilometres miles 100
#          math::convert "degrees celsius" fahrenheit 37
#          math::convert light_years parsecs 1
math::convert() {
    local from="$1" to="$2" value="$3" scale="${4:-$MATH_SCALE}"
    local nfrom nto
    nfrom=$(_math::unitconvert::normalise "$from")
    nto=$(_math::unitconvert::normalise "$to")
    math::unitconvert "$nfrom" "$nto" "$value" "$scale"
}
