#! /usr/bin/env zsh

[ -x "$(command -v go)" ] && eval "$(go env)"

GO_BIN=$GOPATH/bin
export PATH=$PATH:$GO_BIN
