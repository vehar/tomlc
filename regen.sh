#!/bin/bash

set -o nounset
set -o errexit
set -o pipefail

re2c toml-re2c.re2c >toml-re2c.c
