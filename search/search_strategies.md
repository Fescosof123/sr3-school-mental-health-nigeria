# Online Resource 2

**Effectiveness of School-Based Mental Health Interventions for Children and Adolescents in Nigeria: A Systematic Review and Meta-Analysis**

## Search strategies, dates and record counts for each source

All sources were searched from inception to the search date with no language restriction. The strategy combined four concept blocks: school setting or school-age population; mental health outcomes; interventions and controlled designs; and Nigeria, including all 36 states, the Federal Capital Territory and major cities. Search strings are reported exactly as run.

### Part 1. Search record (PRISMA-S)

**Table S2.1** Sources searched, platforms, dates, limits and records retrieved

| Source | Platform or interface | Date searched | Limits | Records retrieved | Notes |
|---|---|---|---|---|---|
| MEDLINE | PubMed (NCBI) | 2 November 2026 | Inception to search date; no language limit; animal-only records excluded | 1,947 | Protocol strategy unchanged |
| Embase | Embase.com (Elsevier) | 3 November 2026 | Inception to search date; no language limit; animal-only records excluded | 2,654 (2,567 articles; 87 clinical-trial records) | Run as one combined query, one day after the other sources. The trial-record export stalled, so title, registry number and status were captured from the results list |
| Europe PMC (including preprints) | Europe PMC REST API | 2 November 2026 | Inception to search date; no language limit | 1,117 (MEDLINE 893, preprints 210, PMC 12, Agricola 2) | State and city list shortened because of the query-length cap; PubMed and Embase carry the full list |
| ERIC | ERIC API (Institute of Education Sciences) | 2 November 2026 | Inception to search date; no language limit | 264 |  |
| PsyArXiv | OSF/SHARE search API, PsyArXiv provider | 2 November 2026 | None | 2 unique (5 hits across 3 runs: 1, 2, 2) | All records screened |
| African Journals Online (AJOL) | ajol.info search | 2 November 2026 | None | 740 (741 reported, 740 retrieved) | AJOL accepted nested Boolean, so one full string replaced the six short strings planned |
| WHO Global Index Medicus (including African Index Medicus) | pesquisa.bvsalud.org/gim | 2 November 2026 | Inception to search date; no language limit | 173 |  |
| Google Scholar | scholar.google.com, 20 results per page, sorted by relevance | 2 November 2026 | Patents and citations excluded; first 110 records by relevance | 110 (ranks 1 to 110) | 300 records planned; the interface returned to page 1 whenever page 7 was requested, so capture stopped at 110. Records carry the Scholar snippet, not the full abstract |
| ClinicalTrials.gov | API version 2 | 2 November 2026 | Location Nigeria; all statuses | 23 |  |
| WHO ICTRP | Advanced search | 2 November 2026 | Country Nigeria; all recruitment statuses | 31 (including 20 PACTR records) | XML export failed; the result table was captured. PACTR is a WHO primary registry whose records feed ICTRP and was covered through ICTRP |
| **Total** | | | | **7,061** | Duplicates removed: 2,643; records screened: 4,418 |

*Note.* Records from all sources were merged and de-duplicated by DOI, PubMed identifier, and normalized title and year, followed by a check of near-identical titles; Embase records were de-duplicated against the existing set by DOI, PubMed identifier and exact or fuzzy title match (similarity at least 0.92). PACTR = Pan African Clinical Trials Registry; ICTRP = International Clinical Trials Registry Platform.

**Table S2.2** Sources planned in the protocol but not searched, or searched indirectly

| Source | Status | Reason |
|---|---|---|
| Cochrane CENTRAL | Not searched | No institutional access; deviation from protocol. Trial coverage kept through MEDLINE, Embase, Europe PMC and three registries |
| Scopus | Not searched | No institutional access |
| Web of Science | Not searched | No institutional access |
| CINAHL | Not searched | No institutional access |
| CAB Global Health | Not searched | No institutional access |
| APA PsycInfo | Not planned and not searched | Not listed in the protocol |
| Pan African Clinical Trials Registry (PACTR) | Not searched directly | Covered through WHO ICTRP (20 PACTR records in the ICTRP set) |
| Nigerian university repositories and conference proceedings | Planned (strategy below) | [AUTHORS TO CONFIRM: whether these searches were completed, with dates and record counts; if not, report as a deviation] |
| Forward and backward citation searching | Planned (strategy below) | [AUTHORS TO CONFIRM: whether completed, with dates and record counts] |

### Part 2. Validation of the MEDLINE strategy

The MEDLINE strategy was tested before the final run. It retrieved all five known seed studies (eligible or near-eligible Nigerian school trials), which were used only to test sensitivity. A PRESS 2015 self-check found the translation of the question, Boolean logic, subject headings and text words appropriate and no unjustified limits. The MeSH term Schools was not exploded, to avoid medical and nursing schools; the terms "Students"[Mesh] and student* bring in university and teacher studies, which were accepted to keep sensitivity and excluded at screening.

**Table S2.3** Seed studies used to test the MEDLINE strategy

| PMID | Study | Retrieved |
|---|---|---|
| 32680363 | Bella-Awusah 2016, brief school-based group CBT for depressed adolescents, Child Adolesc Ment Health | Yes |
| 34563220 | Egbegi 2021, CBT-based strategies for insomnia in in-school adolescents, Child Adolesc Psychiatry Ment Health | Yes |
| 36800628 | Aneke 2023, randomized intervention for depressive symptoms in schoolchildren, Medicine (Baltimore) | Yes |
| 34106582 | Obiweluozo 2021, cognitive behavioral play therapy for social anxiety in schoolchildren who stutter, Medicine (Baltimore) | Yes |
| 36796302 | Ezeh 2023, media-based dance and art therapies for post-traumatic symptoms in schoolchildren, J Pediatr Nurs | Yes |

### Part 3. Full search strategies

**1. MEDLINE (PubMed), 2 November 2026: 1,947 records**

```
#1 "Schools"[Mesh:NoExp] OR "Schools, Nursery"[Mesh] OR "School Health Services"[Mesh] OR "School Teachers"[Mesh] OR "Students"[Mesh] OR "Child"[Mesh] OR "Adolescent"[Mesh] OR school*[tiab] OR classroom*[tiab] OR pupil*[tiab] OR student*[tiab] OR adolescen*[tiab]
#2 "Mental Health"[Mesh] OR "Mental Disorders"[Mesh] OR "mental health"[tiab] OR depress*[tiab] OR anxi*[tiab] OR stress*[tiab] OR "post-traumatic"[tiab] OR posttraumatic[tiab] OR PTSD[tiab] OR trauma*[tiab] OR wellbeing[tiab] OR "well-being"[tiab] OR behavio*[tiab] OR emotion*[tiab] OR aggress*[tiab] OR "conduct problem*"[tiab] OR bully*[tiab] OR insomnia[tiab] OR sleep[tiab] OR suicid*[tiab] OR "self-esteem"[tiab] OR resilien*[tiab]
#3 "Psychotherapy"[Mesh] OR intervention*[tiab] OR program*[tiab] OR therap*[tiab] OR training[tiab] OR counsel*[tiab] OR "rational emotive"[tiab] OR REBT[tiab] OR "cognitive behavio*"[tiab] OR "cognitive restructuring"[tiab] OR desensiti*[tiab] OR "self-management"[tiab] OR "token economy"[tiab] OR "life skills"[tiab] OR "social and emotional learning"[tiab] OR mindfulness[tiab] OR psychoeducation*[tiab] OR random*[tiab] OR "quasi-experiment*"[tiab] OR "control group*"[tiab] OR pretest[tiab] OR "pre-test"[tiab]
#4 "Nigeria"[Mesh] OR nigeria*[tiab] OR Abia[tiab] OR Adamawa[tiab] OR "Akwa Ibom"[tiab] OR Anambra[tiab] OR Bauchi[tiab] OR Bayelsa[tiab] OR Benue[tiab] OR Borno[tiab] OR "Cross River"[tiab] OR "Delta State"[tiab] OR Ebonyi[tiab] OR "Edo State"[tiab] OR Ekiti[tiab] OR Enugu[tiab] OR Gombe[tiab] OR "Imo State"[tiab] OR Jigawa[tiab] OR Kaduna[tiab] OR Kano[tiab] OR Katsina[tiab] OR Kebbi[tiab] OR Kogi[tiab] OR Kwara[tiab] OR Lagos[tiab] OR Nasarawa[tiab] OR "Niger State"[tiab] OR Ogun[tiab] OR Ondo[tiab] OR Osun[tiab] OR Oyo[tiab] OR "Plateau State"[tiab] OR "Rivers State"[tiab] OR Sokoto[tiab] OR Taraba[tiab] OR Yobe[tiab] OR Zamfara[tiab] OR "Federal Capital Territory"[tiab] OR Abuja[tiab] OR Ibadan[tiab] OR "Port Harcourt"[tiab] OR Zaria[tiab] OR "Ile-Ife"[tiab] OR Nsukka[tiab] OR Calabar[tiab] OR Maiduguri[tiab] OR "Benin City"[tiab] OR Ilorin[tiab] OR Onitsha[tiab] OR Owerri[tiab] OR Abeokuta[tiab]
#5 #1 AND #2 AND #3 AND #4
#6 #5 NOT ("Animals"[Mesh] NOT "Humans"[Mesh])
```

**2. Embase (Embase.com), 3 November 2026: 2,654 records**

```
#1 'school'/de OR 'school health service'/exp OR 'school teacher'/exp OR 'student'/exp OR 'child'/exp OR 'adolescent'/exp OR (school* OR classroom* OR pupil* OR student* OR adolescen*):ti,ab
#2 'mental health'/exp OR 'mental disease'/exp OR ('mental health' OR depress* OR anxi* OR stress* OR 'post traumatic' OR posttraumatic OR ptsd OR trauma* OR wellbeing OR 'well being' OR behavio* OR emotion* OR aggress* OR 'conduct problem*' OR bully* OR insomnia OR sleep OR suicid* OR 'self esteem' OR resilien*):ti,ab
#3 'psychotherapy'/exp OR (intervention* OR program* OR therap* OR training OR counsel* OR 'rational emotive' OR rebt OR 'cognitive behavio*' OR 'cognitive restructuring' OR desensiti* OR 'self management' OR 'token economy' OR 'life skills' OR 'social and emotional learning' OR mindfulness OR psychoeducation* OR random* OR 'quasi experiment*' OR 'control group*' OR pretest OR 'pre test'):ti,ab
#4 'nigeria'/exp OR (nigeria* OR abia OR adamawa OR 'akwa ibom' OR anambra OR bauchi OR bayelsa OR benue OR borno OR 'cross river' OR 'delta state' OR ebonyi OR 'edo state' OR ekiti OR enugu OR gombe OR 'imo state' OR jigawa OR kaduna OR kano OR katsina OR kebbi OR kogi OR kwara OR lagos OR nasarawa OR 'niger state' OR ogun OR ondo OR osun OR oyo OR 'plateau state' OR 'rivers state' OR sokoto OR taraba OR yobe OR zamfara OR 'federal capital territory' OR abuja OR ibadan OR 'port harcourt' OR zaria OR 'ile ife' OR nsukka OR calabar OR maiduguri OR 'benin city' OR ilorin OR onitsha OR owerri OR abeokuta):ti,ab
#5 #1 AND #2 AND #3 AND #4
#6 #5 NOT ([animals]/lim NOT [humans]/lim)
```

The sets were run as a single combined query.

**3. Europe PMC (all sources, including preprints), 2 November 2026: 1,117 records**

```
(TITLE_ABS:(nigeria* OR abuja OR lagos OR ibadan OR enugu OR nsukka OR kano OR kaduna OR "port harcourt" OR anambra OR ebonyi OR ogun OR oyo OR osun OR ondo OR ekiti OR kwara OR benue OR borno OR maiduguri OR calabar OR "akwa ibom")) AND (TITLE_ABS:(school* OR classroom* OR pupil* OR student* OR adolescen*)) AND (TITLE_ABS:(depress* OR anxi* OR stress* OR ptsd OR posttraumatic OR "post-traumatic" OR trauma* OR wellbeing OR "well-being" OR emotion* OR behavio* OR aggress* OR bully* OR sleep OR insomnia OR suicid* OR "self-esteem" OR "mental health" OR resilien*)) AND (TITLE_ABS:(intervention* OR program* OR therap* OR training OR counsel* OR "rational emotive" OR rebt OR "cognitive behavio*" OR mindfulness OR psychoeducation* OR random* OR "quasi-experiment*" OR "control group*" OR pretest OR "pre-test"))
```

**4. ERIC, 2 November 2026: 264 records**

```
(Nigeria OR Nigerian) AND (depression OR anxiety OR stress OR "mental health" OR emotional OR behavior OR behaviour OR wellbeing OR "well-being" OR trauma OR PTSD OR sleep OR suicide OR "self-esteem" OR aggression OR bullying) AND (intervention OR program OR programme OR therapy OR counseling OR counselling OR training OR experimental OR "control group" OR "quasi-experimental")
```

**5. PsyArXiv (OSF Preprints), 2 November 2026: 2 unique records**

Three runs, all records screened: (a) "Nigeria school depression"; (b) "Nigeria school anxiety intervention"; (c) "Nigeria adolescents mental health intervention".

**6. African Journals Online, 2 November 2026: 740 records**

```
Nigeria AND (school* OR student* OR pupil* OR adolescen*) AND (depress* OR anxi* OR stress* OR trauma* OR emotion* OR behavio* OR "mental health" OR wellbeing OR "well-being" OR sleep OR suicid* OR "self-esteem" OR aggress* OR bully*) AND (intervention* OR program* OR therap* OR training OR counsel* OR experiment* OR "control group" OR random*)
```

**7. WHO Global Index Medicus, 2 November 2026: 173 records**

```
(tw:(nigeria*)) AND (tw:(school* OR pupil* OR student* OR adolescen*)) AND (tw:(depress* OR anxi* OR stress* OR trauma* OR ptsd OR emotion* OR behavio* OR "mental health" OR wellbeing OR sleep OR suicid* OR "self-esteem")) AND (tw:(intervention* OR program* OR therap* OR training OR counsel* OR random* OR experiment*))
```

**8. Google Scholar, 2 November 2026: 110 records (ranks 1 to 110 by relevance)**

```
Nigeria school students intervention "control group" depression OR anxiety OR stress OR "mental health"
```

**9. ClinicalTrials.gov, 2 November 2026: 23 records**

```
location = Nigeria; condition = depression OR anxiety OR stress OR "mental health" OR PTSD OR behavior OR sleep OR suicide; other terms = school OR student OR adolescent.
```

**10. WHO ICTRP (including PACTR records), 2 November 2026: 31 records**

```
Advanced search; Title: school OR schools OR student OR students OR adolescent OR adolescents OR pupils; Condition: depression OR anxiety OR stress OR mental OR trauma OR PTSD OR behaviour OR behavior OR sleep OR suicide; Country: Nigeria; status ALL
```

**Planned but not run: Cochrane CENTRAL (Cochrane Library, Trials tab).** CENTRAL holds trials only, so the design and intervention blocks were dropped.

```
#1 (nigeria* OR [same state and city list as #4]):ti,ab,kw
#2 MeSH descriptor: [Nigeria] explode all trees
#3 #1 OR #2
#4 (school* OR classroom* OR pupil* OR student* OR adolescen* OR child*):ti,ab,kw
#5 #3 AND #4  (limit: Trials)
```

**Planned gray literature search.** Institutional repositories (University of Nigeria Nsukka, University of Ibadan, Obafemi Awolowo University, University of Lagos, Ahmadu Bello University, Covenant University), to be searched with the string below, and the conference proceedings of the Counselling Association of Nigeria and the Nigerian Psychological Association, where available online.

```
school AND (depression OR anxiety OR stress OR trauma) AND (intervention OR therapy OR counselling)
```

**Planned citation searching.** Backward: reference lists of included studies and related reviews. Forward: Google Scholar "Cited by" and OpenAlex for each included study.

[AUTHORS TO CONFIRM: whether the gray literature and citation searches were completed, with dates and record counts.]

### Part 4. Records identified through other methods

Ten records were identified outside the database and register searches. Eight (EXTRA01 to EXTRA08) were found by the review team while searching the web for the full texts of reports that could not be retrieved; they were reported as records identified from other methods and did not replace the missing reports. Two (EXTRA09 and EXTRA10) came from hand-searched journal files supplied by a member of the review team. All ten were screened on full text against the same criteria (Online Resource 3, part 4); six were included and four excluded.

**Table S2.4** Records identified through other methods

| Record | Report | Decision |
|---|---|---|
| EXTRA01 | Okoiye et al. (2013) | Included |
| EXTRA02 | Azuji et al. (2015) | Included |
| EXTRA03 | Anyamene et al. (2020) | Included |
| EXTRA05 | Nzeadibe et al. (2025) | Included |
| EXTRA06 | Allison & Muraina (2023) | Included |
| EXTRA10 | Ezeribe (n.d.) | Included |
| EXTRA04 | Igara 2021, systematic desensitization on examination anxiety, Zaria (MEd thesis) | Excluded: no concurrent control group |
| EXTRA07 | Ntamu 2017, REBT on examination malpractice behavior, Calabar | Excluded: no eligible mental health outcome |
| EXTRA08 | Yanda 2025, CBT on mental wellness, North-West (university students) | Excluded: wrong population |
| EXTRA09 | REBT and psychological trauma of students in abusive homes, Imo State (Iheka 2025) | Excluded: no concurrent control group |

*Note.* Characteristics of the included records are in Online Resource 4; reasons for exclusion are in Online Resource 3, part 1.
