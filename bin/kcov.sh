#!/usr/bin/env bash

KCOV=kcov-build/usr/local/bin/kcov

for file in target/debug/bv-*[^\.d]; do
    COVDIR="target/cov/$(basename $file)"
    mkdir -p "$COVDIR"
    $KCOV --exclude-pattern=/.cargo,/usr/lib --verify "$COVDIR" "$file"
done

base <(curl -s https://codecov.io/bash) || exit 4

echo "Uploaded code coverage"
