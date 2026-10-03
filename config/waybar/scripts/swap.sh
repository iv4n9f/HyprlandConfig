#!/usr/bin/env bash
free | awk '/^Swap:/ { if ($2 > 0) printf "󰓡 SWAP: %.0f%%\n", $3/$2*100; else print "󰓡 SWAP: 0%" }'
