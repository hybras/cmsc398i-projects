#!/usr/bin/env bats

# These 2 helpers were copied from homebew package maanger
quiet_safe_cd() {
  cd "$1" &>/dev/null || {
    echo "Error: failed to cd to $1" >&2
    exit 1
  }
}

absdir() {
  quiet_safe_cd "${1%/*}/" && pwd -P
}

PROJ_DIR="$(absdir "$(dirname "$BATS_TEST_FILENAME")")"

# setup copied from https://bats-core.readthedocs.io/en/stable/tutorial.html#quick-installation
setup() {
  quiet_safe_cd "$PROJ_DIR"
  local test_helpers="$(absdir "$PROJ_DIR/../test/test_helper/")"
  load "${test_helpers}/bats-support/load.bash"
  load "${test_helpers}/bats-assert/load.bash"
  PATH="$PROJ_DIR/src:$PATH"
}

function missing_file { # @test
  run "line_count.answer.bash" yeet.txt
  assert_output "File does not exist."
  assert_success
}

# The wierd indent on the trailing EOF matters
function line_counts { # @test
  run "line_count.answer.bash" "test/4_lines.txt" "test/trailing_nl.txt"
  assert_output --partial '5 test/4_lines.txt'
  assert_output --partial '4 test/trailing_nl.txt'
  assert_success
}
