#!/bin/bash

set -ex

ROOT=$(git rev-parse --show-toplevel)

check_tool() {
  echo "Checking tool $1 ..."
  type "$1" >/dev/null || ( echo "error: missing $1" && exit 1 )
}

check_tool bats
check_tool docker-machine
check_tool docker-machine-driver-vmware

bats $ROOT/test/*.bats
