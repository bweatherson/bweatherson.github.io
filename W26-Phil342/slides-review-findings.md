# Phil 342 Slides — Review Findings

A pass over all 25 decks (`slides/01.qmd`–`25.qmd`) looking for the five things you asked about:

1. Spelling errors
2. Unclear statements / tables that don't match the text
3. Tell-tale LLM signs (especially em-dashes)
4. Headings whose counts don't match what follows
5. "For Next Time" plans that don't match the next lecture

Line numbers are from the `.qmd` source. Items handled so far are marked **✅ Done**; the rest are still open. (Line numbers on open items are from the original review and may have shifted slightly after edits.)

---

## Status — done so far

- ✅ Deck 03/04 mismatch — reconciled by changing deck 03's activity (Borda → Approval).
- ✅ Highest-priority typos: `rantgs` (05), `disasterous`+`Columbia`→`Colombia` (06), broken sentence (08:96), Person 2 errors (09), `Breir`→`Brier` (11), `generalisaing` (09), `normaliszation` (10).
- ✅ Deck 13 header date 2/23 → 2/25.
- ✅ Deck 16 "four properties" reconciled with the unnumbered fifth.
- ✅ Deck 08 "For Next Time" — dropped the imprecise-pooling over-promise; "Next lecture" → "Over the next couple of lectures."
- ✅ US/UK spelling — whole course converted to US (77 changes; two direct quotations deliberately left in UK spelling).
- ✅ Grammar / missing-word batch: 07 (`justfied`, `lookng`, `responsibile`, "a few", "lead"); 08:389 `Unanamity`→`Unanimity`; 12 (`equiilibria`, `whgether`, the "If there you have" line, and 152 now ends "…to see what effect it would have had"); 15:337 "0 > 0"→"0 = 0"; 17 (`arrbitrary`, `Oridinal`→`Ordinal`, `cooperatesbeing`, "especially **true** for", "famous **uses** of game theory"); 20:166 (added "not"), 20:179 ("**in** a straightforward way"); 22 (`Univesity`, 28 added "is", 50 added "might"); 23 (`interacct`, `discusing`, dropped the stray "that" at 16); 24:36 (added "views").

**Still open** (decks 1–9 are now essentially clear; the only leftover in that range is deck 02's minor "Disadvantages" list. Remaining items are deck 10+ plus style/verify):
- One trailing-off sentence needing your wording: **15:623** ("…challenges for what to do about ").
- Smaller obvious typos not yet swept: `betwen` (10:537), "worth nothing"→"worth noting" (11:396), "long which"→"along which" (13:205), "local maxima"→"local maximum" (23:274), stray double period (25:53).
- Judgment calls: 10:59 "Two-Stage" heading; 12:270 "Two-and-a-Half Models" (intentional?).
- Style decision: em-dash clusters in the game-theory decks (14, 17, and spaced ones in 15/16/25).
- Reconcile/verify (not edits): "62 vs 63" (16/17); 24:202 "more than triples" figure; 11:224 "climate change example from last lecture" back-reference.

---

## Highest-priority fixes

- ✅ **Done — 04, "Last Time" recap.** The recap (lines 11–17) and the deck's worked answers are about Plurality / Range / **Approval**, but deck 03's closing activity listed Plurality / Range / **Borda**. Resolved by changing deck 03's activity item 3 to Approval, matching deck 04.
- ✅ **Done — 05.qmd:372 — "rantgs" → "wants".**
- ✅ **Done — 06.qmd:68 — "disasterous" → "disastrous"; "in Columbia" → "in Colombia".**
- ✅ **Done — 08.qmd:96 — broken sentence** now reads "This seems really **obvious**—…".
- ✅ **Done — 09.qmd:278 & 282 — Person 2 slide.** Heading now "really **unlikely**"; `Pr_2(¬A) = Pr_1(¬B)` corrected to `Pr_2(¬B)`.
- ✅ **Done — 11.qmd:108 — "Breir score" → "Brier score".**
- ✅ **Done — 13.qmd:3 — header date** corrected to 2/25/2026.
- ✅ **Done — 16 — "four properties" vs the fifth.** Line 213 now reads "four surprisingly simple properties, plus a lesson about what counts as success," so the unnumbered "Don't Be Envious" slide reads as that lesson. (Deck 17's "four properties" recap stays accurate.)

---

## Cross-deck / consistency issues

- ✅ **Done — US vs UK spelling.** Whole course standardized to US (`behaviour`→`behavior`, `labour`→`labor`, `favourite`, `colour`, `neighbour(hood)`, `modelling`/`modelled`, `analyse`, `polarisation`, `idealisation`, `stylised`, `recognise`, `maximise`, `organising`, `incentivise`, `realised`, `programme`, `cancelling`, plus the `generalisaing` and `normaliszation` typos). Two direct quotations were intentionally left in UK spelling: the Keynes "practise" quote (12.qmd:84) and the Schelling "mixed neighbourhood" quote (13.qmd:78). The textbook title *Modeling Scientific Communities* was already US.
- **Open — "62 entries" (16.qmd:73) vs "all 63 strategies" (17.qmd:192).** Axelrod's second tournament had 62 entrants plus RANDOM = 63 strategies. Both defensible, but they read as a contradiction across consecutive lectures; a half-sentence reconciling them would help.
- **Open — em-dash density** is uneven and clusters in the game-theory decks. Decks 14 (6) and 17 (4) use the markdown `---` em-dash inline; decks 15, 16, 25 use spaced Unicode em-dashes. Most other decks have none. Full list at the bottom. (Style decision — left for you.)

---

## Deck-by-deck

### 01 — Introduction
- ✅ **Done — Item 5 (412):** reworded to "other examples with the structure of the football example…", softening the promise.
- ✅ **Done — em-dashes** (145, 200, 211, 324) removed. Tables verified.

### 02 — Voting Systems
- **Open — Item 2 (minor):** "Disadvantages" list (lines 82–83) — the "Disproportional / Disordered" bullets describe multi-winner/seat outcomes inside a deck framed around single-winner elections. Reads as slightly garbled out of context. (Still unchanged — defensible to leave.)
- ✅ **Done — em-dashes** (278, 372) removed. Condorcet example table (364–372) verified.

### 03 — Arrow's Theorem
- ✅ **Done:** closing activity item 3 changed from Borda to Approval (see highest-priority).

### 04 — Consequences of Arrow
- ✅ **Done:** "Last Time" recap reconciled via the deck-03 edit.
- ✅ **Done — Item 2 (370):** now reads "Alex prefers blickets and Charlie prefers widgets, on both days."
- ✅ **Done — em-dashes** (38, 370) removed.

### 05 — Paretian Liberal
- ✅ **Done:** "rantgs" → "wants" (372).
- ✅ **Done — Item 4 (310):** slide retitled "Three Questions" (matches "focus on three").
- ✅ **Done (412):** the stray "Liberty and Individual Welfare" is now "Liberty and Social Choice," matching the reference at 268.

### 06 — Peer Disagreement
- ✅ **Done:** "disasterous"/"Columbia" (68).
- ✅ **Done — Item 2 (305):** "one of the motivations **for** equal weight fails."
- ✅ **Done — Item 2 (333):** "just is **a** way to say."
- ✅ **Done (124):** "five" dropped — now "the puzzles we already mentioned."

### 07 — Group Responsibility
- ✅ **Done — spelling:** `justfied`→justified (110), `lookng`→looking (242), `responsibile`→responsible (316).
- ✅ **Done — Item 2:** "there are **a** few more complications" (104); "claims which either **lead** people" (232).

### 08 — Properties of Pooling
- ✅ **Done:** broken sentence (96); "For Next Time" imprecise-pooling over-promise removed and "Next lecture" → "Over the next couple of lectures."
- ✅ **Done — spelling (08.qmd:389):** "Local Unanimity Preservation."

### 09 — Linear Pooling — ✅ fully resolved
- ✅ **Done:** Person 2 errors (278, 282); both "Generalizing" headings (336, 441).
- ✅ **Done — Item 2 (292):** correct symmetric pair `Pr_G(A ∧ ¬B) = Pr_G(¬A ∧ B) = 0.09`.
- ✅ **Done — Item 2 (298):** math delimiters closed; renders correctly (0.82).
- ✅ **Done — Item 2 (395):** Bet 1 prose rewritten; "pays nothing if $\neg A \wedge B$" now matches the payoff table.
- ✅ **Done (262):** "call them 1 and 2." Dutch-book table verified.
- ✅ **Done — em-dashes** (20, 78, 505) removed.

### 10 — Geometric Pooling
- ✅ **Done:** "normaliszation" → "normalization" (123).
- **Open — Item 4, heading count (10.qmd:59):** "The Two-Stage Process" then lists Stages 1–4. Retitle (e.g., "The Multi-Stage Process") or recount.
- **Open — spelling:** "betwen" (537) → "between."
- **Open — Item 2 (minor):** fine-grained No-Rain figure given as 0.52 (169, 285) / rain 0.48 (191); recomputing gives ≈0.515 (→0.51/0.49). Quick recheck of the rounding.

### 11 — Promoting Group Rationality
- ✅ **Done:** "Breir score" → "Brier score" (108).
- **Open — Item 2 (11.qmd:100):** the bad measure is "the difference between your **inaccuracy** and the ideal" — should be "between your **credence** and the ideal."
- **Open — spelling:** "worth nothing" (396) → "worth noting."
- **Open — Item 2 (minor, 11.qmd:224):** "the climate change example from last lecture" — deck 10's examples were rain and polio, not climate change. Check the back-reference.

### 12 — Focal Points
- ✅ **Done — spelling:** `equiilibria`→equilibria (58); `whgether`→whether (103).
- ✅ **Done — incomplete sentences:** 152 now ends "…to see what effect it would have had"; 359 "**If you have** ideas for 2."
- **Open — Item 4 (check intent):** "Two-and-a-Half Models" (270) lists three labeled models. If "the half" is the Luck model that's a deliberate joke; otherwise title/count don't line up.

### 13 — Segregation Model
- ✅ **Done:** header date corrected to 2/25/2026.
- **Open — grammar:** line 99 "they are just have a preference" → "they just have"; line 205 "long which dimensions" → "along which dimensions."
- **Open (minor):** "homogenous"/"heterogenous" (201, 205, 206) — nonstandard for "homogeneous/heterogeneous."

### 14 — Static Games
- **Open — em-dash cluster:** six inline `---` (34, 118, 192, 280, 314, 347), the highest density in the course.
- Math fully verified (ice-cream-truck matrix, iterated elimination, Nash/dominance examples).

### 15 — Dynamic Games
- ✅ **Done — Item 2 (15.qmd:337):** "2-0: 0 = 0, so she's actually indifferent."
- **Open — Item 2 (15.qmd:623):** sentence ends mid-thought: "…challenges for what to do about " — **needs your wording.**
- **Open (minor):** rejection threshold "below about 20%" (138) vs "below about 20–30%" (358) for the same result. Centipede/backward-induction trees verified.
- Em-dash (spaced): 154.

### 16 — Evolution of Cooperation
- ✅ **Done:** "four properties" reconciled (see highest-priority).
- Em-dashes (spaced): 141, 162.
- **Open (minor):** the brief "Reciprocators and Hunters" overview (136–152) lists different strategies than the detailed questionnaire slides (160–176). Fine as overview-vs-menu, but a student comparing them may notice.

### 17 — Applications of TFT
- ✅ **Done — spelling:** `arrbitrary`→arbitrary (130); "The **Ordinal** Society" (285); "cooperates, being" (360).
- ✅ **Done — grammar:** "especially **true** for interactions between groups" (309); "one of the famous **uses** of game theory" (430).
- **Open:** "63 strategies" (192) vs deck 16's "62 entries" — see Cross-deck.
- **Open — em-dashes** (inline `---`): 162, 423, 425.

### 18 — Lemons and Signals
- Clean. Payoff tree and signaling discussion verify. Minor historical nitpick: the Old North Church signaller (165, "The priest") was the sexton, Robert Newman. Double space at line 25.

### 19 — College as a Signal
- Clean. All three OECD tables verified against the prose (lines 60, 64, 78, 82) and the Spence payoff table (260–269) against payoffs and tree. Los Andes figures internally consistent.

### 20 — The Zollman Effect
- ✅ **Done — Item 2 (20.qmd:166):** "but **not** how any arm has drifted."
- ✅ **Done — grammar (179):** "relevant to science **in** a straightforward way." (Open: line 36 missing a question mark.)
- "112 distinct networks of six scientists" (299) verified. "For Next Time" matches deck 21.

### 21 — Is Less Really More?
- Clean. Robustness figures internally consistent; the deck-20 preview (robustness + polarization + manipulation) is delivered in full.

### 22 — The Matthew Effect
- ✅ **Done — spelling:** "Univesity"→"University" (32).
- ✅ **Done — Item 2 (28):** "…on the whole, **is** useful for…".
- ✅ **Done — Item 2 (50):** "while it **might** not produce as many new results, might produce…".
- **Open (minor):** line 62 "projects not that look the most promising" — word order.

### 23 — Citation Gaps and Peer Review
- ✅ **Done — spelling:** "interacct"→"interact" (23); "discusing"→"discussing" (211).
- ✅ **Done — Item 2 (16):** dropped the stray "that" → "…of credit, and this interacts with demographic inequity."
- **Open (minor):** line 274 "stuck at a local maxima" → "a local **maximum**." "For Next Time" matches deck 24.

### 24 — Epistemic Landscapes
- ✅ **Done — Item 2 (24.qmd:36):** "tend to also have distinctive **views** about the right questions to ask."
- **Open — Item 2, number vs claim (24.qmd:202):** "epistemic progress more than **triples** (from 0.07 to 0.15)" — 0.07→0.15 is ~2.1×. Fix the multiplier word or the figures (cf. line 218). Worth checking against Weisberg & Muldoon.
- Minor: "Imré Lakatos" (42) is normally "Imre."

### 25 — Revisiting Division of Labor
- ✅ **Done:** UK→US in title and body (now "Division of Labor").
- **Open (minor):** "modeled the same way.." (53) has a stray double period.
- Em-dash (spaced, two in one sentence): 302.
- Otherwise clean; recap consistent with deck 24, Explorers/Extractors kept distinct from mavericks/followers.

---

## Appendix — every em-dash, by deck

Unicode "—" (mostly your own unspaced style): 01 (145, 200, 211, 324), 02 (278, 372), 03 (230), 04 (38, 370), 05 (103, 252, 256, 406), 08 (96, 151), 09 (20, 78, 505). Spaced "—" (more AI-flavoured): 15 (154), 16 (141, 162), 25 (302).

Markdown "---" inline: 14 (34, 118, 192, 280, 314, 347), 17 (162, 423, 425).

(The standalone `---` lines in decks 14, 15, 18, 19 are slide separators, not dashes — leave those.)
