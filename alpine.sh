#!/bin/bash

# Authored by C.J. Wade
# 06/27/23
# https://cj-wade.com
# https://github.com/sudge64

echo "Install CLI packages"
apk add $(cat packages/apk_cli.txt) -y
