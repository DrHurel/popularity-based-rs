#!/bin/bash

GIT_ROOT=$(git rev-parse --show-toplevel)

# if the git_root result is empty, fall back to the current directory
if [ -z "$GIT_ROOT" ]; then
  GIT_ROOT=$(pwd)
fi

$echo "Setting up development environment in $GIT_ROOT"


if [ ! -d ".venv" ]; then
  python3 -m venv .venv
  source .venv/bin/activate
fi
source .venv/bin/activate
pip install -r requirements.txt