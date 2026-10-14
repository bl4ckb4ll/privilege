#!/bin/sh
# Host arithmetic/format tests only. Does not certify sources, FP receipts or research inferences.
set -eu
cd "$(dirname "$0")/.."
cc_bin=${CC:-cc}
workdir=$(mktemp -d)
trap 'rm -rf "$workdir"' EXIT HUP INT TERM
"$cc_bin" -std=c11 -O2 -Wall -Wextra -Werror -pedantic tools/comparisons.c -lm -o "$workdir/comparisons"

"$workdir/comparisons" log-ratio 4000 USD/month 1000 USD/month 2 > "$workdir/out"
grep -qx 'log_ratio=2' "$workdir/out"
"$workdir/comparisons" log-ratio 1000 USD/month 2000 USD/month 2 > "$workdir/out"
grep -qx 'log_ratio=-1' "$workdir/out"
"$workdir/comparisons" nested-counts 10000 100 1 > "$workdir/out"
grep -qx 'outer_share=0.01' "$workdir/out"
grep -qx 'inner_share_within_outer=0.01' "$workdir/out"
grep -qx 'inner_share_of_total=0.0001' "$workdir/out"
"$workdir/comparisons" nested-counts 5 2 0 > "$workdir/out"
grep -qx 'inner_share_of_total=0' "$workdir/out"
for invalid in 'log-ratio 4 USD 2 EUR 2' 'log-ratio 0 USD 2 USD 2' \
    'log-ratio 1 USD 2 USD 1' 'log-ratio x USD 2 USD 2' \
    'log-ratio 1 USD 2 USD 0' 'nested-counts 2 3 1' \
    'nested-counts 1 1 2' 'nested-counts 100 0 0' \
    'nested-counts -1 1 0' 'nested-counts 10.5 1 0'; do
    # Test fixture is literal ASCII words and numbers; splitting intentionally maps to argv.
    # shellcheck disable=SC2086
    if "$workdir/comparisons" $invalid > "$workdir/out" 2> "$workdir/err"; then
        printf 'unexpected success: %s\n' "$invalid" >&2
        exit 1
    fi
done

awk -F '\t' '
NR == 1 {
  if ($0 != "claim_id\tkind\tgeography\tas_of\tclaim\tsource_url\tlimitation") exit 1
  next
}
{
  if (NF != 7 || $1 !~ /^[A-Z][A-Z0-9-]*$/ || seen[$1]++ ||
      ($2 != "first-person" && $2 != "author-claim" &&
       $2 != "official-rule" && $2 != "institutional-description" &&
       $2 != "curated-list") ||
      $3 == "" || $4 !~ /^[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]$/ ||
      $5 == "" || $6 !~ /^https:\/\/[^ ]+$/ || $7 == "") {
    printf "invalid claim ledger row %d\n", NR > "/dev/stderr"; exit 1
  }
  n++
}
END { if (n < 6) exit 1 }
' evidence/claims.tsv

# Check exactly what can be checked with naive comma separation: the first column,
# which never contains commas, and the snapshot count (not CSV semantic validity).
awk -F, '
FNR == 1 { if ($1 != "fc_code") exit 1; next }
{
  if ($1 !~ /^[A-Z0-9]+$/ || seen[$1]++) {
     printf "invalid or repeated facility code %s\n", $1 > "/dev/stderr"; exit 1
  }
  n++
}
END { if (n != 69) { printf "expected 69 FC codes, got %d\n", n > "/dev/stderr"; exit 1 } }
' data/amazon_india/fulfillment_centers_*.csv

printf 'PASS: C11 log-ratio and nested counts, negative inputs, ledger structure, 69 unique Amazon FC codes\n'