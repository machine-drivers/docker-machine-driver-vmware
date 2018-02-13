#!/usr/bin/env bats

load test_helper
load env

@test "lifecycle" {
  id="vm-$$"
  run docker-machine create --driver="${DRIVER}" "${id}"
  assert_success

  run docker-machine status "${id}"
  assert_output "Running"

  run docker-machine url "${id}"
  assert_matches "^[a-z]+://([0-9]{1,3}\.){3}[0-9]{1,3}:[0-9]+$"

  run docker-machine ip "${id}"
  assert_matches "^([0-9]{1,3}\.){3}[0-9]{1,3}$"

  run docker-machine ssh "$id" ls
  assert_matches "boot2docker"

  run docker-machine restart "${id}"
  assert_success

  run docker-machine stop "${id}"
  assert_success

  run docker-machine status "${id}"
  assert_output "Stopped"

  run docker-machine start "${id}"
  assert_success

  run docker-machine kill "${id}"
  assert_success

  run docker-machine status "${id}"
  assert_output "Stopped"

  run docker-machine rm "${id}" -f
  assert_success

  run docker-machine status "${id}"
  assert_failure
}
