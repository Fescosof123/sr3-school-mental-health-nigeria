## SR3 meta-analysis, version 3 (after peer review round 1)
## Random effects, REML tau2, Hartung-Knapp-Sidik-Jonkman CI with ad hoc variance correction (never narrower than the standard CI; metafor test = "adhoc"),
## prediction interval with t on k-2 df.
suppressPackageStartupMessages(library(metafor))
## Run from the repository root: Rscript code/run_ma_v3.R (outputs are written to results/)
d <- read.csv("data/es_final.csv", stringsAsFactors = FALSE)
tf <- function(x) x %in% c("True", "TRUE", TRUE)
d$held_out <- tf(d$held_out); d$alloc_doubt <- tf(d$alloc_doubt); d$implausible_g_gt3 <- abs(d$g_f) > 3
d <- d[d$computable == "yes" & !is.na(d$g_f) & !is.na(d$se_primary), ]
tiers <- if (file.exists("data/integrity_tiers.csv")) read.csv("data/integrity_tiers.csv", stringsAsFactors = FALSE) else data.frame(rec_no = character(), tier = character())
dir.create("results", showWarnings = FALSE); setwd("results")
d$tierA <- d$rec_no %in% tiers$rec_no[grepl("^A", tiers$tier)]
d$cluster <- tolower(d$clusters_allocated) %in% c("yes", "unclear")
d$rob_short <- ifelse(grepl("^Low", d$rob_overall), "L", ifelse(grepl("^Some", d$rob_overall), "SC", ifelse(grepl("^High", d$rob_overall), "H",
               ifelse(grepl("^Moderate", d$rob_overall), "M", ifelse(grepl("^Serious", d$rob_overall), "S", ifelse(grepl("^Critical", d$rob_overall), "C", "?"))))))
d$critical <- d$rob_short == "C"
d$label[is.na(d$label) | d$label == ""] <- d$rec_no[is.na(d$label) | d$label == ""]
d$out <- d$pool_domain
d$out[d$pool_domain == "anxiety" & d$anxiety_type == "test_or_math"] <- "anxiety_test"
d$out[d$pool_domain == "anxiety" & d$anxiety_type != "test_or_math"] <- "anxiety_general"
anx <- d[d$pool_domain == "anxiety", ]; anx$out <- "anxiety"; d <- rbind(d, anx)   # protocol-defined anxiety outcome (all types)
d$k_cl <- suppressWarnings(as.numeric(d$k_clusters))
## arms in the trial: control plus active arms (combined arms are listed as "A + B (combined)")
act_txt <- sub("\\(?combined.*$", "", d$intervention_arm)
d$n_active <- ifelse(grepl("combined", d$intervention_arm), 1 + lengths(regmatches(act_txt, gregexpr(" \\+ ", act_txt))), 1)
d$n_arms <- d$n_active + 1
d$clusters_per_arm <- d$k_cl / d$n_arms
d$one_per_arm <- d$cluster & !is.na(d$k_cl) & d$clusters_per_arm <= 1
d$derived <- d$method %in% c("F_or_t", "adjusted_means", "change_scores")
d$overlap2 <- d$rec_no %in% c("EXTRA05", "R3152")

outs <- c("depression", "anxiety", "anxiety_general", "anxiety_test", "behaviour_problems", "ptsd_trauma", "distress_stress",
          "self_esteem", "wellbeing", "suicidal_ideation", "sleep", "other_eligible")
fit <- function(x, se, test = "adhoc") rma(yi = x$g_f, sei = se, method = "REML", test = test, slab = x$label)
pint <- function(m) { if (m$k < 3) return(c(NA, NA)); t <- qt(.975, m$k - 2); s <- sqrt(m$tau2 + m$se^2); c(m$b[1] - t * s, m$b[1] + t * s) }
row <- function(m, x, o, des, tp, an) { p <- pint(m)
  data.frame(outcome = o, design = des, timepoint = tp, analysis = an, k = m$k, nominal_N = sum(as.numeric(x$n_int), as.numeric(x$n_ctl), na.rm = TRUE),
             g = round(m$b[1], 2), ci_lb = round(m$ci.lb, 2), ci_ub = round(m$ci.ub, 2), pi_lb = round(p[1], 2), pi_ub = round(p[2], 2),
             p = signif(m$pval, 3), tau2 = round(m$tau2, 3), I2 = round(m$I2, 1), Q = round(m$QE, 2), Q_p = signif(m$QEp, 3), studies = paste(x$rec_no, collapse = "; ")) }
na_row <- function(x, o, des, tp, an, why) data.frame(outcome = o, design = des, timepoint = tp, analysis = an, k = nrow(x), nominal_N = NA, g = NA, ci_lb = NA, ci_ub = NA,
             pi_lb = NA, pi_ub = NA, p = NA, tau2 = NA, I2 = NA, Q = NA, Q_p = NA, studies = why)
res <- list(); loo <- list(); swim <- list()
add <- function(r) res[[length(res) + 1]] <<- r
sens <- function(x, base, o, des, tp, an, se = x$se_primary) {
  if (nrow(x) >= 3) add(row(fit(x, se), x, o, des, tp, an)) else add(na_row(x, o, des, tp, an, paste0("not estimable (k = ", nrow(x), ")")))
}
for (tp in c("post", "follow_up")) for (o in outs) for (des in c("randomised", "non_randomised")) {
  base <- d[d$out == o & d$timepoint == tp & d$comparison == "vs inactive control" & d$design_group == des, ]
  prim <- base[!base$held_out, ]
  if (nrow(prim) == 0) next
  if (nrow(prim) < 3) { swim[[length(swim) + 1]] <- data.frame(outcome = o, design = des, timepoint = tp, k = nrow(prim), rec_no = prim$rec_no, label = prim$label,
                         g = round(prim$g_f, 2), ci_lb = round(prim$g_f - 1.96 * prim$se_primary, 2), ci_ub = round(prim$g_f + 1.96 * prim$se_primary, 2),
                         direction = ifelse(abs(prim$g_f) < 0.005, "no difference", ifelse(prim$g_f > 0, "favours intervention", "favours control")), rob = prim$rob_short, tierA = prim$tierA); next }
  m <- fit(prim, prim$se_primary); add(row(m, prim, o, des, tp, "primary"))
  add(row(fit(prim, prim$se_primary, "knha"), prim, o, des, tp, "sensitivity: standard HKSJ (no ad hoc correction)"))
  add(row(fit(prim, prim$se_icc001), prim, o, des, tp, "sensitivity: ICC 0.01"))
  add(row(fit(prim, prim$se_icc010), prim, o, des, tp, "sensitivity: ICC 0.10"))
  add(row(fit(prim, prim$se_g_f), prim, o, des, tp, "sensitivity: no cluster correction"))
  sens(prim[!prim$cluster, ], base, o, des, tp, "sensitivity: excluding cluster-allocated studies (imputed ICC)")
  if (any(prim$tierA)) sens(prim[!prim$tierA, ], base, o, des, tp, "sensitivity: excluding tier A integrity concerns")
  if (any(prim$implausible_g_gt3)) sens(prim[!prim$implausible_g_gt3, ], base, o, des, tp, "sensitivity: excluding implausible effects (|g| > 3)")
  if (any(prim$tierA | prim$implausible_g_gt3)) sens(prim[!prim$tierA & !prim$implausible_g_gt3, ], base, o, des, tp, "sensitivity: excluding tier A and |g| > 3")
  if (any(base$held_out)) sens(base, base, o, des, tp, "sensitivity: adding held-out studies")
  if (des == "randomised" && any(prim$alloc_doubt)) sens(prim[!prim$alloc_doubt, ], base, o, des, tp, "sensitivity: excluding randomised studies with doubtful or contradictory allocation")
  if (any(prim$overlap2)) sens(prim[!prim$overlap2, ], base, o, des, tp, "sensitivity: one report per possibly overlapping pair (later report removed: EXTRA05, R3152)")
  if (any(prim$derived)) sens(prim[!prim$derived, ], base, o, des, tp, "sensitivity: excluding effects derived from F, t, adjusted means or change scores")
  if (des == "randomised" && any(prim$alloc_doubt | prim$one_per_arm)) sens(prim[!(prim$alloc_doubt | prim$one_per_arm), ], base, o, des, tp, "sensitivity: design reclassified (doubtful allocation or one cluster per arm moved to non-randomised)")
  if (des == "non_randomised") { mv <- d[d$out == o & d$timepoint == tp & d$comparison == "vs inactive control" & d$design_group == "randomised" & !d$held_out & (d$alloc_doubt | d$one_per_arm), ]
    if (nrow(mv) > 0) sens(rbind(prim, mv), base, o, des, tp, "sensitivity: design reclassified (adds randomised studies with doubtful allocation or one cluster per arm)") }
  if (any(prim$critical)) sens(prim[!prim$critical, ], base, o, des, tp, "sensitivity: excluding critical risk of bias")
  sens(prim[prim$rob_short %in% c("L", "SC", "M"), ], base, o, des, tp, "sensitivity: low / some concerns / moderate risk of bias only")
  if (m$k >= 3) { l <- leave1out(m); loo[[length(loo) + 1]] <- data.frame(outcome = o, design = des, timepoint = tp, omitted = prim$label,
      g = round(l$estimate, 2), ci_lb = round(l$ci.lb, 2), ci_ub = round(l$ci.ub, 2), I2 = round(l$I2, 1)) }
  if (m$k >= 10) { e <- regtest(m); add(data.frame(outcome = o, design = des, timepoint = tp, analysis = "Egger regression test", k = m$k, nominal_N = NA,
      g = NA, ci_lb = NA, ci_ub = NA, pi_lb = NA, pi_ub = NA, p = signif(e$pval, 3), tau2 = NA, I2 = NA, Q = NA, Q_p = NA, studies = sprintf("t = %.2f; limit estimate b = %.2f", e$zval, e$est))) }
  ## forest plot with RoB and integrity markers
  ilab <- cbind(prim$rob_short, paste0(ifelse(prim$tierA, "A", ""), ifelse(prim$implausible_g_gt3, "*", "")))
  h <- max(4, 1.6 + 0.33 * m$k); p <- pint(m)
  png(sprintf("Fig_forest_%s_%s_%s.png", o, des, tp), width = 3000, height = round(h * 300), res = 300, type = "cairo")
  par(mar = c(6, 4, 1, 2))
  ## place the RoB and Integ. columns well left of the plotting region so labels never touch the zero line
  pdf(NULL); fr0 <- forest(m, ilab = ilab, cex = .72); dev.off()
  ixp <- fr0$xlim[1] + (fr0$alim[1] - fr0$xlim[1]) * c(0.68, 0.84)
  fr <- forest(m, xlab = "Hedges' g (positive favors intervention)", header = c("Study", "g [95% CI]"), ilab = ilab, ilab.xpos = ixp,
         mlab = sprintf("RE model (REML, modified HKSJ): I\u00b2 = %.0f%%, \u03c4\u00b2 = %.2f", m$I2, m$tau2), cex = .72)
  text(fr$ilab.xpos, m$k + 2, c("RoB", "Integ."), font = 2, cex = .72)
  segments(max(p[1], fr$alim[1]), -1, min(p[2], fr$alim[2]), -1, lty = "dashed"); if (p[1] < fr$alim[1] || p[2] > fr$alim[2]) text(fr$alim[2], -1.6, sprintf("PI %.2f to %.2f (truncated)", p[1], p[2]), pos = 2, cex = .55); mtext(side = 1, line = 4.2, adj = 0, cex = .5, text = "Dashed line: 95% prediction interval (t, k-2 df). RoB: H high, SC some concerns, S serious, C critical. Integ.: A tier A integrity concern; * |g| > 3")
  dev.off()
}
R <- do.call(rbind, res); write.csv(R, "MA_results_v3.csv", row.names = FALSE)
write.csv(do.call(rbind, loo), "MA_leave_one_out_v3.csv", row.names = FALSE)
write.csv(do.call(rbind, swim), "SWiM_k_less_than_3_v3.csv", row.names = FALSE)

## Post hoc exploratory analyses (clearly labelled): designs combined, and test vs general anxiety
ex <- list()
for (o in c("depression", "anxiety", "anxiety_general", "anxiety_test", "behaviour_problems", "self_esteem", "suicidal_ideation")) {
  x <- d[d$out == o & d$timepoint == "post" & d$comparison == "vs inactive control" & !d$held_out, ]
  if (nrow(x) >= 3) ex[[length(ex) + 1]] <- row(fit(x, x$se_primary), x, o, "both designs (post hoc)", "post", "exploratory: designs combined")
}
x <- d[d$pool_domain == "anxiety" & d$out != "anxiety" & d$timepoint == "post" & d$comparison == "vs inactive control" & !d$held_out & d$design_group == "randomised", ]
m <- rma(yi = x$g_f, sei = x$se_primary, mods = ~ factor(x$out), method = "REML", test = "adhoc")
ex[[length(ex) + 1]] <- data.frame(outcome = "anxiety", design = "randomised (post hoc)", timepoint = "post", analysis = "exploratory: test vs general anxiety (moderator, randomised only)", k = m$k,
  nominal_N = NA, g = round(m$b[2], 2), ci_lb = round(m$ci.lb[2], 2), ci_ub = round(m$ci.ub[2], 2), pi_lb = NA, pi_ub = NA, p = signif(m$QMp, 3), tau2 = round(m$tau2, 3), I2 = round(m$I2, 1), Q = round(m$QM, 2), Q_p = NA,
  studies = "g column = difference (test minus general)")
write.csv(do.call(rbind, ex), "MA_exploratory_v3.csv", row.names = FALSE)
cat("Subgroup analyses: protocol requires >= 10 studies; maximum k within a design is", max(R$k[R$analysis == "primary"]), "so pre-specified subgroups were not run.\n")
print(R[R$analysis == "primary", c("outcome", "design", "timepoint", "k", "g", "ci_lb", "ci_ub", "pi_lb", "pi_ub", "I2")])
