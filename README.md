TEST LINE# School-based mental health interventions for children and adolescents in Nigeria: systematic review and meta-analysis

Data and code for the systematic review registered in PROSPERO (CRD420251232239).

Authors: Olaniyi Felix Sanni and Abike Elizabeth Sanni, Research Department, EasyGlob Health Initiatives, Ota, Ogun State, Nigeria.

## Contents

- `data/es_final.csv`: effect sizes (Hedges' g) and standard errors for every outcome, time point and report, with design, risk of bias, integrity tier and held-out flags
- `data/integrity_tiers.csv`: integrity tier (A = data not credible, B = no such concern) and reasons for each report
- `data/rob_all.csv`: risk of bias judgments (RoB 2, RoB 2 cluster variant, ROBINS-I V2) by domain
- `data/A_all.csv`: characteristics of the 65 included reports
- `data/S3_excluded_reports.csv`: reports excluded at full text, with reasons
- `data/prisma_counts.json`: record counts for the PRISMA 2020 flow diagram
- `code/run_ma_v3.R`: all meta-analyses, sensitivity analyses, leave-one-out analyses and forest plots
- `results/`: output of the script, plus the GRADE ratings (`grade_final_v3.csv`)
- `search/search_strategies.md`: full search strategies, dates and record counts

## How to run

From the repository root, with R 4.3.3 and metafor 4.4-0:

```
Rscript code/run_ma_v3.R
```

Results and forest plots are written to `results/`.

## Methods summary

Random-effects models (REML), modified Hartung-Knapp-Sidik-Jonkman confidence intervals, 95% prediction intervals with t on k - 2 degrees of freedom. Randomized and non-randomized studies pooled separately, only when at least three studies were available. Cluster trials corrected with an assumed ICC of 0.05 (sensitivity 0.01 and 0.10).

## Licence

Data: CC BY 4.0. Code: MIT.
