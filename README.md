# privilege

Evidence-first investigation of **nested economic advantage**: how wealth, place, employment, citizenship, institutional access, and the ability to arrange one's circumstances interact.

A position can be advantageous within a workplace, disadvantaged within a country, and advantageous relative to a different country's labor market. These are comparisons with **specified reference groups and mechanisms**, not permanent labels attached to people or countries.

## What this repository does

- Keeps first-person observation, official rules, curated third-party material, and interpretation visibly separate.
- Records **relative comparisons** and movements across people, workplaces, places, and institutions, with dates and limitations.
- Examines the recurring pattern of a privileged position nested inside a still more privileged position (and the corresponding movements toward less privileged positions).
- Tests claims about who can access an opportunity, including the claim that a purportedly universal lifestyle or career prescription depends on unequal access.
- Preserves unquantified comparisons **without assigning imaginary numbers to them**.

The [mathematics and evidence rules](docs/model.md) specify exactly what a logarithmic ratio and a nested reference-class fraction mean. Neither is automatically a universal **privilege score**. In particular, percentages of a population cannot be exchanged for money ratios or treated as exponents of wealth.

## Existing records

| Area | Material | Evidentiary status |
| --- | --- | --- |
| [Wang Bing's *Youth* trilogy](records/wang-bing-youth-trilogy.md) | Zhili garment workshops, workers' origins in Anhui and Yunnan, seasonal travel | Film-program/press accounts; the project has **not** independently audited the underlying footage or computed wages |
| [Amazon India facility list](data/amazon_india/README.md) | Dated list of 69 distinct FC codes, map **search links**, licensed images | Third-party inventory snapshot, not Amazon-verified employment or current facility data; corporate photos are not warehouse photos |
| [Tim Ferriss and geographic arbitrage](records/digital-nomad-geographic-arbitrage.md) | Rich-market earnings, lower-cost purchases, outsourcing and migration gates | Ferriss's own descriptions and an official Brazilian visa rule; no measured wage differential claimed |
| [William T. Vollmann, *Poor People*](records/vollmann-poor-people.md) | First-person poverty testimony and the limits of outsider comparison | Bibliographic record and accessible opening chapter; **not** a claim to have read the entire book |

The [claim ledger](evidence/claims.tsv) lists individual, attributable source propositions. It does **not** turn an author's assertion into verified population data.

## Small executable examples

The C11 program implements only the two mathematical operations whose meaning is specified, not a fitted social-science model:

```sh
cc -std=c11 -O2 -Wall -Wextra -Werror -pedantic tools/comparisons.c -lm -o /tmp/privilege-comparisons
/tmp/privilege-comparisons log-ratio 4000 USD/month 1000 USD/month 2
/tmp/privilege-comparisons nested-counts 10000 100 1
sh tests/check.sh
```

The first computes `log₂(4000/1000)=2` for an **illustrative**, same-unit pair; it does not assert anyone actually earns either amount. The second computes the share of a population occupied by a subgroup inside a subgroup. These are different quantities.

The checks enforce arithmetic, input rejection, basic claim-ledger structure, and the existing Amazon India FC code count/uniqueness. **A passing test does not independently establish any social claim or source truth**. Hosted CI, if it runs, has the same narrow meaning. Independent publication or merge acceptance belongs to Flexible Pipes and ai-ci; no FP/AICI receipt is asserted by this repository.

## Open empirical work

1. Obtain source-level, attributable observations of workers' actual wages, employment terms, living costs, rights and outcomes, rather than substitute sample stories or institutional aggregates for representative data.
2. Compare international remote work with locally accessible employment for **matched work**, explicitly accounting for immigration law, family ties, taxation, language, employer authorization, and housing.
3. Work through Vollmann's actual interviews and Wang Bing's actual filmed testimony at identifiable page/scene locations; do not invent quotations or treat press summaries as film transcripts.
4. Reconcile the Amazon third-party facility list with dated operator-level evidence without harvesting prohibited map-provider data. The facilities alone establish no privilege gradient.
5. Evaluate whether a particular privilege comparison deserves a monetary log ratio, an opportunity-set inclusion, a conditional share, or only a qualitative description.

This repository's purpose is critical investigation, not advocacy for a single predetermined numeric ranking.