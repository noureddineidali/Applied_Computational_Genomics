#!/usr/bin/env bash

set -euo pipefail

fasta="${1:-chr22.fa}"

awk '/^>/ {next} {
    sequence = toupper($0)
    gc += gsub(/[GC]/, "", sequence)
} END {
    print "GC nucleotides:", gc
}' "${fasta}"

geecee -auto -sequence "${fasta}" -outfile chr22.geecee
cat chr22.geecee
