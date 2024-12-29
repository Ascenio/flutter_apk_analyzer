#!/usr/bin/env bash

strings $(find $1 -name libapp.so) | grep '^package:' | sed 's/package://' | cut -d '/' -f 1 | sort | uniq
