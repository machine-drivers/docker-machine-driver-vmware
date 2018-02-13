# the following helpers are borrowed from the test_helper.bash in https://github.com/sstephenson/rbenv

flunk() {
  { if [ "$#" -eq 0 ]; then cat -
    else echo "$@"
    fi
  } >&2
  return 1
}

assert_success() {
  if [ "$status" -ne 0 ]; then
    flunk "command failed with exit status $status: $output"
  elif [ "$#" -gt 0 ]; then
    assert_output "$1"
  fi
}

assert_failure() {
  if [ "$status" -ne 1 ]; then
    flunk $(printf "expected failed exit status=1, got status=%d" $status)
  elif [ "$#" -gt 0 ]; then
    assert_output "$1"
  fi
}

assert_equal() {
  if [ "$1" != "$2" ]; then
    { echo "expected: $1"
      echo "actual:   $2"
    } | flunk
  fi
}

assert_output() {
  local expected
  if [ $# -eq 0 ]; then expected="$(cat -)"
  else expected="$1"
  fi
  assert_equal "$expected" "$output"
}

assert_matches() {
  local pattern="${1}"
  local actual="${2}"

  if [ $# -eq 1 ]; then
    actual="$output"
  fi

  if ! grep -E -q "${pattern}" <<<"${actual}"; then
    { echo "pattern: ${pattern}"
      echo "actual:  ${actual}"
    } | flunk
  fi
}

assert_number() {
  assert_matches "^-?[0-9]+$" "$output"
}

assert_empty() {
  local actual="${1}"

  if [ $# -eq 0 ]; then
    actual="$(cat -)"
  fi

  if [ -n "${actual}" ]; then
    { echo "actual: ${actual}"
    } | flunk
  fi
}

assert_line() {
  if [ "$1" -ge 0 ] 2>/dev/null; then
    assert_equal "$2" "$(collapse_ws ${lines[$1]})"
  else
    local line
    for line in "${lines[@]}"; do
      if [ "$(collapse_ws $line)" = "$1" ]; then return 0; fi
    done
    flunk "expected line \`$1'"
  fi
}

refute_line() {
  if [ "$1" -ge 0 ] 2>/dev/null; then
    local num_lines="${#lines[@]}"
    if [ "$1" -lt "$num_lines" ]; then
      flunk "output has $num_lines lines"
    fi
  else
    local line
    for line in "${lines[@]}"; do
      if [ "$line" = "$1" ]; then
        flunk "expected to not find line \`$line'"
      fi
    done
  fi
}

assert() {
  if ! "$@"; then
    flunk "failed: $*"
  fi
}
