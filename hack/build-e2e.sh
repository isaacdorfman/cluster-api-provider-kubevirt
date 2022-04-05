#!/bin/bash

set -e

GOBIN="${GOBIN:-$GOPATH/bin}"
GINKGO=$GOBIN/ginkgo

if ! [ -x "$GINKGO" ]; then
	echo "Retrieving ginkgo build dependencies"
	go install github.com/onsi/ginkgo/v2/ginkgo@latest
else
	echo "GINKO binary found at $GINKGO"
fi

$GINKGO build e2e-tests/

mkdir -p $BIN_DIR
mv e2e-tests/e2e-tests.test $BIN_DIR/e2e-tests

