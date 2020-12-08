#!/bin/sh
#
# This file is part of DoJSON
# Copyright (C) 2015, 2016 CERN.
#
# DoJSON is free software; you can redistribute it and/or modify
# it under the terms of the Revised BSD License; see LICENSE file for
# more details.

# Quit on errors
set -o errexit

# Quit on unbound symbols
set -o nounset

python -m check_manifest --ignore ".*-requirements.txt"
python -m sphinx.cmd.build -qnNW docs docs/_build/html
python -m sphinx.cmd.build -qnNW -b doctest docs docs/_build/doctest
python -m pytest
tests_exit_code=$?
exit "$tests_exit_code"
