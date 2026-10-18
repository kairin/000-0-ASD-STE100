#!/usr/bin/env bash
set -eu

repo_dir="$(CDPATH='' cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
delivery_doc="$repo_dir/docs/ste-delivery.md"
ai_repo="${AI_REPO:-}"
delivery_home="${STE_DELIVERY_HOME:-$HOME}"
ci_mode="${STE_PAYLOAD_CI:-}"
local_package_dir="$repo_dir/skills/ste-writing"

source_files=(
  "ste-writing-skill.md"
  "ste-lint.py"
  "ste-recurring-errors.md"
  "ste-system-append.md"
  "ste-senior-engineer-prompt.md"
)

test -f "$delivery_doc"

for source_file in "${source_files[@]}"; do
  test -f "$repo_dir/$source_file"
  rg -q --fixed-strings "\`$source_file\`" "$delivery_doc"
done

# shellcheck disable=SC2016 # Single quotes stop variable expansion in fixed table patterns.
for mapping in \
  'ste-writing-skill.md` | `SKILL.md` | Packaged' \
  'ste-lint.py` | `ste-lint.py` | Packaged' \
  'ste-recurring-errors.md` | `ste-recurring-errors.md` | Packaged' \
  'ste-system-append.md` | None | Manual' \
  'ste-senior-engineer-prompt.md` | None | Manual'; do
  rg -q --fixed-strings "$mapping" "$delivery_doc"
done

automated_mappings=(
  "ste-writing-skill.md:SKILL.md"
  "ste-lint.py:ste-lint.py"
  "ste-recurring-errors.md:ste-recurring-errors.md"
)

rm -rf "$local_package_dir/__pycache__"
test -d "$local_package_dir"

for mapping in "${automated_mappings[@]}"; do
  source_file="${mapping%%:*}"
  package_file="${mapping#*:}"
  test -f "$local_package_dir/$package_file"
  cmp -s "$repo_dir/$source_file" "$local_package_dir/$package_file"
  echo "source-package match: $source_file -> $package_file"
done

manual_files=(
  "ste-system-append.md"
  "ste-senior-engineer-prompt.md"
)

for source_file in "${manual_files[@]}"; do
  if test -e "$local_package_dir/$source_file"; then
    echo "manual file has a local package copy: $source_file" >&2
    exit 1
  fi
done

while IFS= read -r package_file; do
  case "${package_file#"$local_package_dir/"}" in
    "SKILL.md"|"ste-lint.py"|"ste-recurring-errors.md") ;;
    *)
      echo "unexpected packaged file: ${package_file#"$local_package_dir/"}" >&2
      exit 1
      ;;
  esac
done < <(find "$local_package_dir" -type f ! -path '*/__pycache__*' -print)

if test "$ci_mode" != 1 && test -n "$ai_repo" && test -d "$ai_repo/skills/ste-writing"; then
  ai_package_dir="$ai_repo/skills/ste-writing"
  for mapping in "${automated_mappings[@]}"; do
    source_file="${mapping%%:*}"
    package_file="${mapping#*:}"
    test -f "$ai_package_dir/$package_file"
    cmp -s "$repo_dir/$source_file" "$ai_package_dir/$package_file"
    cmp -s "$local_package_dir/$package_file" "$ai_package_dir/$package_file"
    echo "source-ai-package match: $source_file -> $package_file"
  done

  for source_file in "${manual_files[@]}"; do
    if test -e "$ai_package_dir/$source_file"; then
      echo "manual file has a transitional package copy: $source_file" >&2
      exit 1
    fi
  done

  while IFS= read -r package_file; do
    case "${package_file#"$ai_package_dir/"}" in
      "SKILL.md"|"ste-lint.py"|"ste-recurring-errors.md") ;;
      *)
        echo "unexpected transitional packaged file: ${package_file#"$ai_package_dir/"}" >&2
        exit 1
        ;;
    esac
  done < <(find "$ai_package_dir" -type f ! -path '*/__pycache__*' -print)
fi

preferred_tool_found=false
for tool_command in hermes pi codex agy; do
  if command -v "$tool_command" >/dev/null 2>&1; then
    preferred_tool_found=true
  fi
done

compare_destination() {
  destination_dir="$1"
  destination_name="$2"

  for mapping in "${automated_mappings[@]}"; do
    source_file="${mapping%%:*}"
    package_file="${mapping#*:}"
    destination_file="$destination_dir/$package_file"

    if ! test -f "$destination_file"; then
      echo "missing $destination_name file: $destination_file" >&2
      return 1
    fi

    if ! cmp -s "$repo_dir/$source_file" "$destination_file"; then
      echo "drift in $destination_name file: $destination_file" >&2
      return 1
    fi

    if ! cmp -s "$local_package_dir/$package_file" "$destination_file"; then
      echo "drift between local package and $destination_name file: $destination_file" >&2
      return 1
    fi

    echo "source-destination match: $source_file -> $destination_name/$package_file"
  done
}

if test "$ci_mode" != 1 && "$preferred_tool_found"; then
  compare_destination \
    "$delivery_home/.agents/skills/ste-writing" \
    "portable destination"
fi

if test "$ci_mode" != 1 && command -v hermes >/dev/null 2>&1; then
  compare_destination \
    "$delivery_home/.hermes/skills/ste-writing" \
    "Hermes destination"
fi

if test "$ci_mode" != 1 && command -v agy >/dev/null 2>&1; then
  compare_destination \
    "$delivery_home/.gemini/config/skills/ste-writing" \
    "Antigravity destination"
fi

for tool_name in \
  "Hermes" \
  "Pi" \
  "OpenAI Codex CLI" \
  "Google Antigravity (\`agy\`)"; do
  rg -q --fixed-strings "$tool_name" "$delivery_doc"
done

# shellcheck disable=SC2088 # Tilde stays literal in documentation table patterns.
for destination in \
  "~/.agents/skills/ste-writing/" \
  "~/.hermes/skills/ste-writing/" \
  "~/.gemini/config/skills/ste-writing/"; do
  rg -q --fixed-strings "$destination" "$delivery_doc"
done

issue_url="https://github.com/kairin/000-0-ASD-STE100/issues/10"
rg -q --fixed-strings "$issue_url" "$repo_dir/README.md"
rg -q --fixed-strings "$issue_url" "$delivery_doc"

term_one="cl""aude"
term_two="anthr""opic"
term_three="s""onnet"
term_four="o""pus"
term_five="ha""iku"
prohibited_pattern="$term_one|$term_two|$term_three|$term_four|$term_five"

if rg -n -i \
  --hidden \
  --glob '!.git/**' \
  "$prohibited_pattern" \
  "$repo_dir"; then
  echo "prohibited material found" >&2
  exit 1
fi

echo "STE source, package, destination, and purge checks passed"
