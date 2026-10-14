# Comparison mathematics and evidence discipline

## 1. Specify a comparison before calling something privilege

Each claim needs: **whose access**; **to what** (income, safety, legal permission, leisure, control over working time, wealth, etc.); **relative to whom**; **where and when**; **the causal mechanism proposed**; and **the observations that would contradict it**.

Do not silently identify any of the following:

- Money income, net wealth, access to credit, purchasing power, and time.
- Legal eligibility, a granted visa, possession of a passport, and actual ability to travel.
- An individual worker, their workshop, a company, its executives, a city, a country, and a population percentile.
- A source's claim, an observed event, a derived comparison, and a causal explanation.

Access to **options** offers one interpretation. For a fixed context and specified feasible actions, let `F(person, context)` be the set of options the person can actually take. The relation `a >= b` *on feasible options* holds if `F(b, context)` is a subset of `F(a, context)`. This is a **partial order**, not necessarily a total ranking. If neither set contains the other, the people are incomparable on this definition. The feasible sets have not yet been constructed or measured for real cases here.

Institutional access may impose discontinuities: a minimum-income visa threshold can make one option unavailable despite continuous income differences. Geography alone does not establish an order of persons.

A related hypothesis is **capacity to impose purposeful order on contingency**: savings, predictable schedules, protected leisure, affordable exit options, enforceable rights, and institutional access can buffer uncertainty. A garden-versus-forest image is a metaphor for differing capacity to shape circumstances, not a numerical measure or proof that control always transfers risk to another person. Investigate who controls an arrangement, who bears its downside, and whose options shrink or expand.

## 2. Log ratios describe one strictly positive measurable quantity

For a quantity `x` and reference `r` measured in **the same unit and time basis**, with `x > 0`, `r > 0`, and base `b > 1`, define

```
L_b(x; r) = log_b(x/r).
```

Equivalently, `x = r * b^(L_b(x;r))`. The ratio is dimensionless. A negative value means `x < r`; it is **not automatically evidence of personal disadvantage**. Net wealth may be negative, legal permission is binary, and multiple institutional opportunities need not admit this formula. Never force such variables into logarithms.

A chain of *comparable* positive measurements satisfies

```
L_b(x; z) = L_b(x; y) + L_b(y; z).
```

This is an identity, not a finding that two social mechanisms are independent. Using different currencies, hours, household definitions, or time periods without conversion makes the identity inapplicable to the proposed measurements.

**Illustration, not field data:** for the same wage unit and period, `x=4000`, `r=1000`, `b=2` gives `L_2=2`. If a local reference were 8000, the same wage would have `L_2=-1`. A result is always relative to a named reference.

The program `tools/comparisons.c` checks positive finite inputs and exact matching unit *labels*. It cannot prove that two real measurements really have comparable populations, contracts, price levels or definitions.

## 3. A “1% within a 1%” is a question about conditional fractions

Take finite population `U`, subgroup `A` inside `U`, and subgroup `B` inside `A`. If their observed counts are `N`, `a`, and `c`, then

```
share(A in U) = a/N
share(B in A) = c/a
share(B in U) = c/N = (c/a) * (a/N).
```

For 10,000 people with 100 in `A` and 1 in `B`, `B` is 1% *of A*, or 0.01% *of U*. Neither 1% is a wage ratio, an income multiplier, or a logarithmic privilege unit.

Membership may be nested along different dimensions (e.g., national earning percentile and educational selectivity). Multiply fractions only with their **actual conditional denominators** and an explicit meaning for intersection. Do not take two separately reported top-one-percent statuses and assume independence or identify their intersection with a `0.01%` population group. With a sample, the corresponding probabilities may have sampling uncertainty; exact counts in a toy example have none.

## 4. A geoarbitrage contrast is an empirical proposal, not an identity

One proposed mechanism is access to wages priced in a rich labor market while purchasing housing, food, domestic work or services in a place with lower local wages. The *same person's* purchasing power, and the opportunities available to a locally hired worker, are not determined by exchange rates alone. Consider taxes, contract terms, hours, access to the same employers, legal status, work permissions, household obligations, service quality, rent changes and changes caused by entrants.

Useful counterfactual: **If every comparably capable worker could sell labor to the high-wage market on the same terms, could the advertised wage/cost combination persist at the same scale?** This is a test of dependence on restricted access. It is **not** a mathematical theorem that all pay must equalize, nor proof that every person using remote work harms local workers. Sectoral productivity, scarce job openings, regulation, capital, bargaining and housing supply may change the outcome. Collect contrary cases too.

Keep at least three comparisons apart: `remote worker vs. their prior self`, `remote worker vs. locally hired similar worker`, and `remote worker vs. other foreign entrants`. No single comparison exhausts the question.

## 5. Evidence, source roles, and falsification

Source classes in `evidence/claims.tsv`:

- `first-person`: identifiable author's account of events they report observing; not automatically representative.
- `author-claim`: an author's statement or prescription; evidence of *what the author said*, not that it works.
- `official-rule`: rule stated by its issuing body; a description of eligibility, not observed enforcement or approvals.
- `institutional-description`: institutional account of a film, place, or project, not the underlying recordings.
- `curated-list`: third-party compilation; keep the compiler's exact snapshot and limitations.

An inference belongs in prose and must cite the relevant ledger entries. The source's own page and precise original passage take priority over summaries; a press page can document *what that page reports* but not replace original observation. Bibliographic descriptions and excerpts do not establish that the entire source was read. State denominators, selection, excluded cases, individual outcomes and persistence when analyzing careers, wages, or mobility. A named case is not a representative sample.

A proposed finding should name a possible defeater. For geoarbitrage: measured wage accessibility for local workers, changes in relative costs after increased entry, or similar outcomes without passport/employer advantages could limit the mechanism. For filmmaking: independently viewing testimony may contradict the press synopsis. For facility addresses: original operator records may contradict a reseller compilation.

## 6. Research directions and nonclaims

The existing cases cover individual people, workshops, industrial clusters, companies, cities, states, countries and global labor markets. These scales can be connected as a **graph of specific relations**, not a made-up universal hierarchy. Moving outward or inward does not itself assert that every node differs by a constant multiplicative factor.

Neither `F` nor `L_b` is yet an empirically fitted, validated measure of privilege. This document defines possible *operations* and the evidence required before using them in a study.