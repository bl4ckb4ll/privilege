/* Mathematical comparisons, NOT a calibrated privilege index.
 * log-ratio compares strictly positive measurements with identical unit labels.
 * nested-counts computes exact shares for nested finite sets.
 */
#include <ctype.h>
#include <errno.h>
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

static int positive_finite(const char *s, long double *out) {
    char *end;
    long double v;
    errno = 0;
    if (!s || !*s) return 0;
    v = strtold(s, &end);
    if (errno != 0 || end == s || *end != '\0' || !isfinite(v) || v <= 0.0L)
        return 0;
    *out = v;
    return 1;
}

static int unsigned_count(const char *s, unsigned long long *out) {
    char *end;
    unsigned long long v;
    const unsigned char *p = (const unsigned char *)s;
    if (!s || !*s) return 0;
    for (; *p; ++p) if (!isdigit(*p)) return 0;
    errno = 0;
    v = strtoull(s, &end, 10);
    if (errno != 0 || *end != '\0') return 0;
    *out = v;
    return 1;
}

static int usage(void) {
    fputs("usage:\n"
          "  comparisons log-ratio VALUE UNIT REFERENCE UNIT BASE\n"
          "  comparisons nested-counts POPULATION OUTER INNER\n"
          "Neither operation estimates total social privilege.\n", stderr);
    return 2;
}

int main(int argc, char **argv) {
    if (argc > 1 && strcmp(argv[1], "log-ratio") == 0) {
        long double x, r, b, log_ratio;
        if (argc != 7 || !positive_finite(argv[2], &x) ||
            !positive_finite(argv[4], &r) || !positive_finite(argv[6], &b) ||
            b <= 1.0L || argv[3][0] == '\0' || strcmp(argv[3], argv[5]) != 0) {
            fputs("log-ratio requires positive finite measurements, base > 1, and identical nonempty unit labels\n", stderr);
            return 2;
        }
        log_ratio = logl(x / r) / logl(b);
        /* Underflow/overflow can make even valid individual inputs unusable. */
        if (!isfinite(log_ratio)) {
            fputs("log ratio not representable\n", stderr);
            return 2;
        }
        printf("log_ratio=%.12Lg\nbase=%.12Lg\nunit=%s\n", log_ratio, b, argv[3]);
        return 0;
    }
    if (argc > 1 && strcmp(argv[1], "nested-counts") == 0) {
        unsigned long long population, outer, inner;
        if (argc != 5 || !unsigned_count(argv[2], &population) ||
            !unsigned_count(argv[3], &outer) || !unsigned_count(argv[4], &inner) ||
            population == 0 || outer == 0 || outer > population || inner > outer) {
            fputs("nested-counts requires integer POPULATION >= OUTER > 0 and 0 <= INNER <= OUTER\n", stderr);
            return 2;
        }
        printf("outer_share=%.12Lg\ninner_share_within_outer=%.12Lg\ninner_share_of_total=%.12Lg\n",
               (long double)outer / (long double)population,
               (long double)inner / (long double)outer,
               (long double)inner / (long double)population);
        return 0;
    }
    return usage();
}