#!/usr/bin/env bash

print_ram_usage() {
  if command -v free >/dev/null 2>&1; then
    free | awk '$1 ~ /Mem/ {printf "%.1fG/%.1fG", $3/1048576, $2/1048576}'
  elif command -v sysctl >/dev/null 2>&1; then
    local total_bytes
    total_bytes=$(sysctl -n hw.memsize)
    local page_size
    page_size=$(vm_stat | head -1 | grep -oE '[0-9]+')

    local stats
    stats=$(vm_stat)

    local active inactive speculative wired compressor free_pages cached purgeable file_backed
    active=$(echo "$stats" | awk '/Pages active/ {print $3}' | tr -d '.')
    inactive=$(echo "$stats" | awk '/Pages inactive/ {print $3}' | tr -d '.')
    speculative=$(echo "$stats" | awk '/Pages speculative/ {print $3}' | tr -d '.')
    wired=$(echo "$stats" | awk '/Pages wired down/ {print $4}' | tr -d '.')
    compressor=$(echo "$stats" | awk '/Pages occupied by compressor/ {print $NF}' | tr -d '.')
    free_pages=$(echo "$stats" | awk '/Pages free/ {print $3}' | tr -d '.')
    cached=$(echo "$stats" | awk '/Pages purgeable/ {print $3}' | tr -d '.')
    file_backed=$(echo "$stats" | awk '/File-backed pages/ {print $3}' | tr -d '.')

    local used_bytes=$(( (active + speculative + wired + compressor - cached) * page_size ))
    local total_used=$(( used_bytes < 0 ? 0 : used_bytes ))

    awk -v used="$total_used" -v total="$total_bytes" \
      '{printf "%.1fG/%.1fG", used/1073741824, total/1073741824}' <<< ""
  fi
}

main() {
  print_ram_usage
}
main
