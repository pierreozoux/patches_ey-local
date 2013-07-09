#!/bin/bash

eylocal_version="1.0.2"

path_to_eylocal=$(gem env | grep "INSTALLATION DIRECTORY" | cut -d":" -f2 | sed -e 's/^[ \t]*//')/gems/engineyard-local-$eylocal_version

diff -rupN engineyard-local.orig/ $path_to_eylocal > patches/my.patch \
  -x .yardoc \
  -x yardoc \
  -x diff_recipes \
  -x recipes* \
  -x .gitignore \
  -x .DS_Store
  