#!/usr/bin/env bash

set -euo pipefail

# Input
if [ -z "${1:-}" ]; then
    echo "Usage: $0 <entry_file> [output_file]"
    exit 1
fi

ENTRY_FILE="$1"
OUTPUT_FILE="${2:-bundled.sh}"      # Optionaler zweiter Parameter
SHEBANG='#!/usr/bin/env bash'        # Standard-Shebang

# Initialisierung
declare -A INCLUDED_FILES
declare -a PREINCLUDE_FILES=()

> "$OUTPUT_FILE"

# resolve Paths
resolve_path() {
    local base="$1"
    local target="$2"

    if [[ "$target" = /* ]]; then
        echo "$target"
    else
        echo "$(cd "$base" && pwd)/$target"
    fi
}

# file bundle
bundle_file() {
    local file="$1"

    if [[ ! -f "$file" ]]; then
        echo "File not found: $file" >&2
        return
    fi

    file="$(cd "$(dirname "$file")" && pwd)/$(basename "$file")"

    if [[ -n "${INCLUDED_FILES[$file]:-}" ]]; then
        return
    fi
    INCLUDED_FILES[$file]=1

    local first_line=1
    while IFS= read -r line || [[ -n "$line" ]]; do
        if [[ $first_line -eq 1 && "$line" =~ ^#! ]]; then
            first_line=0
            continue
        fi
        first_line=0

        # Source-Includes auflösen
        if [[ "$line" =~ ^[[:space:]]*(source|\.)[[:space:]]+(.+) ]]; then
            local inc="${BASH_REMATCH[2]}"
            inc="${inc#"${inc%%[![:space:]]*}"}"   # left trim
            inc="${inc%"${inc##*[![:space:]]}"}"   # right trim

            if [[ -z "$inc" ]]; then
                echo "$line" >> "$OUTPUT_FILE"
                continue
            fi

            resolved="$(resolve_path "$(pwd)" "$inc")"
            bundle_file "$resolved"
        else
            echo "$line" >> "$OUTPUT_FILE"
        fi
    done < "$file"
}

# Pre Includes
for pre in "${PREINCLUDE_FILES[@]}"; do
    resolved="$(resolve_path "$(pwd)" "$pre")"
    echo "# >>> BEGIN PREINCLUDE $resolved" >> "$OUTPUT_FILE"
    bundle_file "$resolved"
    echo "# <<< END PREINCLUDE $resolved" >> "$OUTPUT_FILE"
done

# Bundle file
bundle_file "$ENTRY_FILE"

# Remove Comments
if sed --version >/dev/null 2>&1; then
    sed -i '/^[[:space:]]*#/d' "$OUTPUT_FILE"
else
    sed -i '' '/^[[:space:]]*#/d' "$OUTPUT_FILE"
fi

# --- Shebang setzen ---
if sed --version >/dev/null 2>&1; then
    sed -i "1i $SHEBANG" "$OUTPUT_FILE"
else
    sed -i '' -e "1i\\
$SHEBANG
" "$OUTPUT_FILE"
fi

chmod +x "$OUTPUT_FILE"
echo "Bundling abgeschlossen → $OUTPUT_FILE"
