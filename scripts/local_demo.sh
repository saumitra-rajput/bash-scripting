#!/bin/bash

echo "===== LOCAL VARIABLE DEMO ====="

local_function() {
  local name="Saumitra"
  local role="DevOps Learner"
  echo "Inside local_function:"
  echo "name = $name"
  echo "role = $role"
}

global_function() {
  name="Mansi"
  role="Global Variable"
  echo "Inside global_function:"
  echo "name = $name"
  echo "role = $role"
}

# Call functions
local_function

echo
echo "After local_function:"
echo "name = ${name:-NOT SET}"
echo "role = ${role:-NOT SET}"

echo
global_function

echo
echo "After global_function:"
echo "name = $name"
echo "role = $role"

