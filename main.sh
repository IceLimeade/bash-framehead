#!/usr/bin/env bash

compile_files() {
    local output_file="${1:-compiled.sh}"
    local i=0

    # Create AND overwrite file
    true > "$output_file"

    local total_err=0 total_warn=0 total_info=0
    for func_file in $(dirname "${BASH_SOURCE[0]}")/src/*.sh; do
        [[ ! -f "$func_file" ]] && continue

        if [[ ! -s "$func_file" ]]; then
            echo "Warning: Skipping empty file: $(basename "$func_file")" >&2
            continue
        fi

        local err_file=0 warn_file=0 info_file=0
        local issue_str_file=""

        if command -v shellcheck > /dev/null 2>&1; then
            # Count errors (severity=error)
            err_file=$(shellcheck --format=gcc --severity=error "$func_file" 2>/dev/null | wc -l)

            # Count warnings (severity=warning)
            warn_file=$(shellcheck --format=gcc --severity=warning "$func_file" 2>/dev/null | wc -l)

            # Count info/style issues (severity=info, style)
            info_file=$(shellcheck --format=gcc --severity=info "$func_file" 2>/dev/null | wc -l)
            # Add style if you want it separate
            # style_file=$(shellcheck --format=gcc --severity=style "$func_file" 2>/dev/null | wc -l)
            # info_file=$((info_file + style_file))

            # Optional: Show shellcheck output
            shellcheck --color=auto --format=tty --wiki=0 "$func_file"
        fi

        # Build per-file issue string
        local total_file_issues=$((err_file + warn_file + info_file))
        if (( total_file_issues > 0 )); then
            issue_str_file="with $total_file_issues issues ($err_file errors, $warn_file warnings, $info_file info)"
            (( total_err += err_file ))
            (( total_warn += warn_file ))
            (( total_info += info_file ))
        fi

        local i_line=0
        echo -n "Writing from $(basename "$func_file")..."

        while IFS= read -r line; do
            # Strip shebang for non-first file
            if (( i > 0 && i_line == 0 )); then
                [[ "$line" =~ ^#! ]] && continue
            fi
            printf "%s\n" "$line" >> "$output_file"
            (( i_line++ ))
        done < "$func_file"

        echo " ok ${issue_str_file}"
        (( i++ ))
    done

    if (( i == 0 )); then
        echo "Warning: No .sh files found in $src_dir" >&2
        rm -f "$output_file"
        return 1
    fi

    chmod +x "$output_file" 2>/dev/null

    # Build final issue string
    local total_issues=$((total_err + total_warn + total_info))
    local final_issue_str=""
    if (( total_issues > 0 )); then
        final_issue_str="with total $total_issues issues ($total_err errors, $total_warn warnings, $total_info info)"
    fi

    echo "Successfully compiled $i files to $output_file ${final_issue_str}"
}


if [[ ${1,,} == "compile" ]]; then
    compile_files "${2:-compiled.sh}"
    exit 0
fi


# source all function files
for func_file in "$(dirname "${BASH_SOURCE[0]}")/src/"*.sh; do
    if [[ -f "$func_file" ]]; then
        echo -n "Sourcing $func_file..."
        bash -n "$func_file" || { echo "Failed Bash dry check." && return 1; }
        . "$func_file" && echo "ok"
    fi
done
