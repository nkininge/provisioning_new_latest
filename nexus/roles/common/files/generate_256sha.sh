#!/bin/bash
sha256sum $1 | cut -d " "  -f1 > $1.sha256
