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
cd "$PROJ_DIR"

setup copied from https://bats-core.readthedocs.io/en/stable/tutorial.html#quick-installation
setup() {
    local test_helpers="$(absdir "$PROJ_DIR/../test/test_helper/")"
    load "${test_helpers}/bats-support/load.bash"
    load "${test_helpers}/bats-assert/load.bash"
    PATH="$PROJ_DIR/src:$PATH"
}

function run_mod_7_3 () {
    printf "7\n3\n" | modulus.bash
}
@test "mod_7_3" {
    run run_mod_7_3
    assert_success
    assert_output "Your remainder is 1"
}

function run_mod_6_0 () {
    printf "6\n0\n" | modulus.bash
}
@test "mod_6_0" {
    run run_mod_6_0
    assert_output --partial "division by 0"
}